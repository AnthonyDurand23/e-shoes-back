import { Router } from "express";
import orderController from "./controllers/orderController";
import productController from "./controllers/productController";
import orderSanitization from "./middlewares/orderSanitization";
import orderValidation from "./middlewares/orderValidation";
import { orderSchema } from "./schemas/orderSchema";

const router = Router();

router.get(`/produits/`, productController.getProducts);

router.get(`/produits/:gender`, productController.getProductsByGender);

router.get(`/produit/:id`, productController.getProductById);

router.get(`/getDB`, (_req, res) => {
  res.send(`${process.env.DATABASE_URL?.split("@")[1].split(":")[0]}`);
});

router.post(
  `/order`,
  orderSanitization(),
  orderValidation(orderSchema),
  orderController.postOrder
);

export default router;
