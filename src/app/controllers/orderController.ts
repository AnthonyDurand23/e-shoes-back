/* eslint-disable @typescript-eslint/no-var-requires */
import { Request, Response } from "express";
import path from "path";
import Order from "../models/order";
import Product from "../models/product";
const stripe = require("stripe")(process.env.STRIPE_SECRET_KEY);
const nodemailer = require("nodemailer");
const handlebars = require("handlebars");
const fs = require("fs");
const inlineCss = require("inline-css");

const orderController = {
  postOrder: async (request: Request, response: Response): Promise<void> => {
    try {
      console.log("post order");
      const prices = await Promise.all(
        request.body.cart.map(async ({ reference }: { reference: string }) => {
          return await Product.findPriceByRefrence(reference);
        })
      );
      const verifTotalPriceCart = request.body.cart
        .map(
          ({
            reference,
            quantity,
          }: {
            reference: string;
            quantity: number;
          }) => {
            return (
              prices
                .find(
                  ({ reference: productRef }: { reference: string }) =>
                    productRef === reference
                )
                .price.toFixed(2) * quantity
            );
          }
        )
        .reduce((a: number, b: number) => a + b);

      if (
        verifTotalPriceCart.toFixed(2) !==
        request.body.totalPriceCart.toFixed(2)
      )
        throw new Error(`Le prix total du panier est invalide`);

      const order = await new Order(request.body).create();
      const {
        totalPriceCart: amount,
        email: customer,
        paymentId: id,
        deliveryDate,
        address,
        zipcode,
        city,
        cart,
      } = request.body;
      try {
        const payment = await stripe.paymentIntents.create({
          amount: Number((amount * 100).toFixed(2)),
          currency: "EUR",
          description: `Client: ${customer} / Commande: ${order?.id}`,
          payment_method: id,
          confirm: true,
        });
        if (order && payment.status === "succeeded") {
          Order.addPaymentStatus(order.id, "Réussi");

          const filePath = path.join(
            __dirname,
            "../emails/order_confirmation.html"
          );
          const source = fs.readFileSync(filePath, "utf-8").toString();
          const sourceStyled = await inlineCss(source.toString(), {
            url: path.join("file://", __dirname, "../emails/"),
          });
          const template = handlebars.compile(sourceStyled);
          const replacements = {
            orderId: order.id,
            deliveryDate,
            address,
            zipcode,
            city,
            amount: amount.toFixed(2).replace(".", ","),
            cart,
          };
          const htmlToSend = template(replacements);

          const transporter = nodemailer.createTransport({
            host: "e-shoes.adwebdev.fr",
            port: 465,
            secure: true, // true for 465, false for other ports
            auth: {
              user: process.env.EMAIL_USER,
              pass: process.env.EMAIL_PASSWORD,
            },
          });
          const mailOptions = {
            from: process.env.EMAIL_USER,
            to: customer,
            cc: process.env.EMAIL_USER,
            subject: `Votre commande E-SHOES`,
            html: htmlToSend,
          };
          transporter.sendMail(mailOptions);
          response.status(200).json("Paiement réussi");
        }
        // TODO
        if (order && payment.status === "requires_action")
          console.log("requires_action");
      } catch (error) {
        console.log(error);
        if (order) Order.addPaymentStatus(order.id, "Echoué");
        // ATTENTION si modif message "Paiement échoué" -> à changer également en front
        response.status(500).json("Paiement échoué");
      }
    } catch (error) {
      if (error instanceof Error) response.status(500).json(error.message);
    }
  },
};

export default orderController;
