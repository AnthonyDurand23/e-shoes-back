import Joi from "joi";

export const orderSchema = Joi.object({
  firstname: Joi.string().trim().required(),
  lastname: Joi.string().required(),
  address: Joi.string().required(),
  zipcode: Joi.string().required(),
  city: Joi.string().required(),
  phone: Joi.string()
    .regex(
      /^(?:(?:(?:\+|00)33[ ]?(?:\(0\)[ ]?)?)|0){1}[1-9]{1}([ .-]?)(?:\d{2}\1?){3}\d{2}$/
    )
    .required(),
  email: Joi.string().email().required(),
  cart: Joi.array().min(1).items({
    reference: Joi.string().required(),
    name: Joi.string().required(),
    size: Joi.number().required(),
    quantity: Joi.number().required(),
    photoUrl: Joi.string().required(),
    price: Joi.string().required(),
  }),
  totalPriceCart: Joi.number().required(),
  paymentId: Joi.string().required(),
  deliveryDate: Joi.string().required(),
});
