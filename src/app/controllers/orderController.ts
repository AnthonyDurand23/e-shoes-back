import { Request, Response } from "express";
import Order from "../models/order";
// eslint-disable-next-line @typescript-eslint/no-var-requires
const stripe = require("stripe")(process.env.STRIPE_SECRET_KEY);

const orderController = {
  postOrder: async (request: Request, response: Response): Promise<void> => {
    try {
      console.log("post order");
      const order = await new Order(request.body).create();
      const {
        totalPriceCart: amount,
        email: customer,
        paymentId: id,
      } = request.body;
      try {
        const payment = await stripe.paymentIntents.create({
          amount: Number(amount) * 100,
          currency: "EUR",
          description: `Client: ${customer} / Commande: ${order?.id}`,
          payment_method: id,
          confirm: true,
        });
        if (order && payment.status === "succeeded") {
          Order.addPaymentStatus(order.id, "Réussi");
          response.status(200).json("Paiement réussi");
        }
        // TODO
        if (order && payment.status === "requires_action")
          console.log("requires_action");
      } catch (error) {
        console.log(error);
        if (order) Order.addPaymentStatus(order.id, "Echoué");
        response.status(500).json("Paiement échoué");
      }
    } catch (error) {
      if (error instanceof Error) response.status(500).json(error.message);
    }
  },
};

export default orderController;
