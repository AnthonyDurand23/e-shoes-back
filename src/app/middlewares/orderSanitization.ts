/* eslint-disable indent */
import sanitizeHtml from "sanitize-html";
import { Request, Response, NextFunction } from "express";

const orderSanitization =
  () => (request: Request, response: Response, next: NextFunction) => {
    request.body = {
      ...request.body,
      firstname: sanitizeHtml(request.body.firstname),
      lastname: sanitizeHtml(request.body.lastname),
      address: sanitizeHtml(request.body.address),
      zipcode: sanitizeHtml(request.body.zipcode),
      city: sanitizeHtml(request.body.city),
      phone: sanitizeHtml(request.body.phone),
      email: sanitizeHtml(request.body.email),
      cart: JSON.parse(sanitizeHtml(JSON.stringify(request.body.cart))),
      totalPriceCart: Number(
        sanitizeHtml(request.body.totalPriceCart.toString())
      ),
      paymentId: sanitizeHtml(request.body.paymentId),
      deliveryDate: sanitizeHtml(request.body.deliveryDate),
    };
    next();
  };

export default orderSanitization;
