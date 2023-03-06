"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const product_1 = __importDefault(require("../models/product"));
const productController = {
    getProducts: (request, response) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            console.log("get products");
            const products = yield product_1.default.findAll();
            response.status(200).json(products);
        }
        catch (error) {
            if (error instanceof Error)
                response.status(500).json(error.message);
        }
    }),
    getProductsByGender: (request, response) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            console.log("get products by gender");
            const gender = request.params.gender;
            const products = yield product_1.default.findByGender(gender);
            response.status(200).json(products);
        }
        catch (error) {
            if (error instanceof Error)
                response.status(500).json(error.message);
        }
    }),
    getProductById: (request, response) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            console.log("get product by id");
            const id = Number(request.params.id);
            const products = yield product_1.default.findById(id);
            response.status(200).json(products);
        }
        catch (error) {
            if (error instanceof Error)
                response.status(500).json(error.message);
        }
    }),
};
exports.default = productController;
