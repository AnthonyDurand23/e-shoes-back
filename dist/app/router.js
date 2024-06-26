"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const productController_1 = __importDefault(require("./controllers/productController"));
const router = (0, express_1.Router)();
router.get(`/produits/:genre`, productController_1.default.getProducts);
router.get(`/produit/:id`, productController_1.default.getProduct);
exports.default = router;
