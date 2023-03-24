"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
/* eslint-disable indent */
const sanitize_html_1 = __importDefault(require("sanitize-html"));
const orderSanitization = () => (request, response, next) => {
    request.body = Object.assign(Object.assign({}, request.body), { firstname: (0, sanitize_html_1.default)(request.body.firstname), lastname: (0, sanitize_html_1.default)(request.body.lastname), address: (0, sanitize_html_1.default)(request.body.address), zipcode: (0, sanitize_html_1.default)(request.body.zipcode), city: (0, sanitize_html_1.default)(request.body.city), phone: (0, sanitize_html_1.default)(request.body.phone), email: (0, sanitize_html_1.default)(request.body.email), cart: JSON.parse((0, sanitize_html_1.default)(JSON.stringify(request.body.cart))), totalPriceCart: Number((0, sanitize_html_1.default)(request.body.totalPriceCart.toString())), paymentId: (0, sanitize_html_1.default)(request.body.paymentId), deliveryDate: (0, sanitize_html_1.default)(request.body.deliveryDate) });
    next();
};
exports.default = orderSanitization;
