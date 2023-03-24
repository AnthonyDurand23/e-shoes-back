"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const path_1 = __importDefault(require("path"));
const order_1 = __importDefault(require("../models/order"));
const product_1 = __importDefault(require("../models/product"));
const stripe = require("stripe")(process.env.STRIPE_SECRET_KEY);
const nodemailer = require("nodemailer");
const handlebars = require("handlebars");
const fs = require("fs");
const inlineCss = require("inline-css");
const orderController = {
    postOrder: (request, response) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            console.log("post order");
            const prices = yield Promise.all(request.body.cart.map(({ reference }) => __awaiter(void 0, void 0, void 0, function* () {
                return yield product_1.default.findPriceByRefrence(reference);
            })));
            const verifTotalPriceCart = request.body.cart
                .map(({ reference, quantity, }) => {
                return (prices
                    .find(({ reference: productRef }) => productRef === reference)
                    .price.toFixed(2) * quantity);
            })
                .reduce((a, b) => a + b);
            if (verifTotalPriceCart.toFixed(2) !==
                request.body.totalPriceCart.toFixed(2))
                throw new Error(`Le prix total du panier est invalide`);
            const order = yield new order_1.default(request.body).create();
            const { totalPriceCart: amount, email: customer, paymentId: id, deliveryDate, address, zipcode, city, cart, } = request.body;
            try {
                const payment = yield stripe.paymentIntents.create({
                    amount: Number((amount * 100).toFixed(2)),
                    currency: "EUR",
                    description: `Client: ${customer} / Commande: ${order === null || order === void 0 ? void 0 : order.id}`,
                    payment_method: id,
                    confirm: true,
                });
                if (order && payment.status === "succeeded") {
                    order_1.default.addPaymentStatus(order.id, "Réussi");
                    const filePath = path_1.default.join(__dirname, "../emails/order_confirmation.html");
                    const source = fs.readFileSync(filePath, "utf-8").toString();
                    const sourceStyled = yield inlineCss(source.toString(), {
                        url: path_1.default.join("file://", __dirname, "../emails/"),
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
                        secure: true,
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
            }
            catch (error) {
                console.log(error);
                if (order)
                    order_1.default.addPaymentStatus(order.id, "Echoué");
                // ATTENTION si modif message "Paiement échoué" -> à changer également en front
                response.status(500).json("Paiement échoué");
            }
        }
        catch (error) {
            if (error instanceof Error)
                response.status(500).json(error.message);
        }
    }),
};
exports.default = orderController;
