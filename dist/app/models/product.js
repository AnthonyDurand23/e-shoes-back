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
const database_1 = __importDefault(require("../database"));
class Product {
    constructor(obj) {
        this.id = obj.id;
        this.reference = obj.reference;
        this.name = obj.name;
        this.brand = obj.brand;
        this.price = obj.price;
        this.photos = obj.photos;
        this.top = obj.top;
        this.lining = obj.lining;
        this.sockliner = obj.sockliner;
        this.outsole = obj.outsole;
        this.lining_thickness = obj.lining_thickness;
        this.material = obj.material;
        this.weather = obj.weather;
        this.sport = obj.sport;
        this.end = obj.end;
        this.heel_shape = obj.heel_shape;
        this.closure = obj.closure;
        this.pattern = obj.pattern;
        this.additional_infos = obj.additional_infos;
        this.properties = obj.properties;
        this.gender = obj.gender;
        this.categories = obj.categories;
    }
    static findAll() {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const { rows } = yield database_1.default.query(` SELECT product.*, gender.name AS gender, cat_agg.categories FROM product
          JOIN gender ON product.gender_id = gender.id
          JOIN (
            SELECT product.id, ARRAY_AGG(category.name) AS categories FROM product
            JOIN product_category ON product.id = product_category.product_id
            JOIN category ON product_category.category_id = category.id
            GROUP BY product.id) AS cat_agg
          ON product.id = cat_agg.id;
        `);
                if (!rows[0])
                    throw new Error(`Aucun produit trouvé`);
                return rows.map((row) => new Product(row));
            }
            catch (error) {
                console.log(error);
                if (error instanceof Error)
                    throw new Error(error.message);
            }
        });
    }
    static findByGender(gender) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const mixte = gender === "femme" || gender === "homme" ? "mixte" : "";
                const { rows } = yield database_1.default.query(` SELECT product.*, gender.name AS gender, cat_agg.categories FROM product
          JOIN gender ON product.gender_id = gender.id
          JOIN (
            SELECT product.id, ARRAY_AGG(category.name) AS categories FROM product
            JOIN product_category ON product.id = product_category.product_id
            JOIN category ON product_category.category_id = category.id
            GROUP BY product.id) AS cat_agg
          ON product.id = cat_agg.id
          WHERE gender.name = $1 OR gender.name = $2;
        `, [gender, mixte]);
                if (!rows[0])
                    throw new Error(`Aucun produit trouvé pour le gender: ${gender}`);
                return rows.map((row) => new Product(row));
            }
            catch (error) {
                console.log(error);
                if (error instanceof Error)
                    throw new Error(error.message);
            }
        });
    }
    static findById(id) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const { rows } = yield database_1.default.query(` SELECT product.*, gender.name AS gender, cat_agg.categories FROM product
          JOIN gender ON product.gender_id = gender.id
          JOIN (
            SELECT product.id, ARRAY_AGG(category.name) AS categories FROM product
            JOIN product_category ON product.id = product_category.product_id
            JOIN category ON product_category.category_id = category.id
            GROUP BY product.id) AS cat_agg
          ON product.id = cat_agg.id
          WHERE product.id = $1;
        `, [id]);
                if (!rows[0])
                    throw new Error(`Aucun produit trouvé avec l'id: ${id}`);
                const product = new Product(rows[0]);
                return product;
            }
            catch (error) {
                console.log(error);
                if (error instanceof Error)
                    throw new Error(error.message);
            }
        });
    }
}
exports.default = Product;
