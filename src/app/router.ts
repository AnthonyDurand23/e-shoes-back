import { Router } from "express";
import productController from "./controllers/productController";

const router = Router();

router.get(`/products/:genre`, productController.getProducts);

export default router;
