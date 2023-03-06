import { Request, Response } from "express";
import Product from "../models/product";

const productController = {
  getProducts: async (request: Request, response: Response): Promise<void> => {
    try {
      console.log("get products");
      const products = await Product.findAll();
      response.status(200).json(products);
    } catch (error) {
      if (error instanceof Error) response.status(500).json(error.message);
    }
  },

  getProductsByGender: async (
    request: Request,
    response: Response
  ): Promise<void> => {
    try {
      console.log("get products by gender");
      const gender = request.params.gender;
      const products = await Product.findByGender(gender);
      response.status(200).json(products);
    } catch (error) {
      if (error instanceof Error) response.status(500).json(error.message);
    }
  },

  getProductById: async (
    request: Request,
    response: Response
  ): Promise<void> => {
    try {
      console.log("get product by id");
      const id = Number(request.params.id);
      const products = await Product.findById(id);
      response.status(200).json(products);
    } catch (error) {
      if (error instanceof Error) response.status(500).json(error.message);
    }
  },
};

export default productController;
