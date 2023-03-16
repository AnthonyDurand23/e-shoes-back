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
const order_1 = __importDefault(require("../models/order"));
// eslint-disable-next-line @typescript-eslint/no-var-requires
const stripe = require("stripe")(process.env.STRIPE_SECRET_KEY);
const orderController = {
    postOrder: (request, response) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            console.log("post order");
            const order = yield new order_1.default(request.body).create();
            const { totalPriceCart: amount, email: customer, paymentId: id, } = request.body;
            try {
                const payment = yield stripe.paymentIntents.create({
                    amount: Number(amount) * 100,
                    currency: "EUR",
                    description: `Client: ${customer} / Commande: ${order === null || order === void 0 ? void 0 : order.id}`,
                    payment_method: id,
                    confirm: true,
                });
                if (order && payment.status === "succeeded") {
                    order_1.default.addPaymentStatus(order.id, "Réussi");
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
