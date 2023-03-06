"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const productController_1 = __importDefault(require("./controllers/productController"));
const router = (0, express_1.Router)();
router.get(`/produits/`, productController_1.default.getProducts);
router.get(`/produits/:gender`, productController_1.default.getProductsByGender);
router.get(`/produit/:id`, productController_1.default.getProductById);
router.get(`/getDB`, (_req, res) => {
    var _a;
    res.send(`${(_a = process.env.DATABASE_URL) === null || _a === void 0 ? void 0 : _a.split("@")[1].split(":")[0]}`);
});
exports.default = router;
