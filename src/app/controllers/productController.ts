import { Request, Response } from "express";
import Product from "../models/product";

const productController = {
  getProducts: async (request: Request, response: Response): Promise<void> => {
    try {
      const genre = request.params.genre;
      const products = await Product.findByGenre(genre);
      response.status(200).json(products);
    } catch (error) {
      if (error instanceof Error) response.status(500).json(error.message);
    }
  },
};

export default productController;
