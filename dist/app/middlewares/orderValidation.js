"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const orderValidation = (schema) => (request, response, next) => {
    const { error } = schema.validate(request.body);
    if (error)
        return response.status(400).json(error.message);
    next();
};
exports.default = orderValidation;
