"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.orderSchema = void 0;
const joi_1 = __importDefault(require("joi"));
exports.orderSchema = joi_1.default.object({
    firstname: joi_1.default.string().trim().required(),
    lastname: joi_1.default.string().required(),
    address: joi_1.default.string().required(),
    zipcode: joi_1.default.string().required(),
    city: joi_1.default.string().required(),
    phone: joi_1.default.string()
        .regex(/^(?:(?:(?:\+|00)33[ ]?(?:\(0\)[ ]?)?)|0){1}[1-9]{1}([ .-]?)(?:\d{2}\1?){3}\d{2}$/)
        .required(),
    email: joi_1.default.string().email().required(),
    cart: joi_1.default.array().min(1).items({
        reference: joi_1.default.string().required(),
        name: joi_1.default.string().required(),
        size: joi_1.default.number().required(),
        quantity: joi_1.default.number().required(),
        photoUrl: joi_1.default.string().required(),
        price: joi_1.default.string().required(),
    }),
    totalPriceCart: joi_1.default.number().required(),
    paymentId: joi_1.default.string().required(),
    deliveryDate: joi_1.default.string().required(),
});
