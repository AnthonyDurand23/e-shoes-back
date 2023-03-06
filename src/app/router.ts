import { Router } from "express";
import productController from "./controllers/productController";

const router = Router();

router.get(`/produits/`, productController.getProducts);

router.get(`/produits/:gender`, productController.getProductsByGender);

router.get(`/produit/:id`, productController.getProductById);

router.get(`/getDB`, (_req, res) => {
  res.send(`${process.env.DATABASE_URL?.split("@")[1].split(":")[0]}`);
});

export default router;
