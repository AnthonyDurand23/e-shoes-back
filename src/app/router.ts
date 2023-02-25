import { Router } from "express";
import productController from "./controllers/productController";

const router = Router();

router.get(`/produits/:genre`, productController.getProducts);

router.get(`/produit/:id`, productController.getProduct);

export default router;
