/* eslint-disable indent */
import Joi from "joi";
import { Request, Response, NextFunction } from "express";

const orderValidation =
  (schema: Joi.ObjectSchema) =>
  (request: Request, response: Response, next: NextFunction) => {
    const { error } = schema.validate(request.body);
    if (error) return response.status(400).json(error.message);
    next();
  };

export default orderValidation;
