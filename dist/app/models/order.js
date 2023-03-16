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
class Order {
    constructor(obj) {
        this.id = obj.id;
        this.firstname = obj.firstname;
        this.lastname = obj.lastname;
        this.address = obj.address;
        this.city = obj.city;
        this.zipcode = obj.zipcode;
        this.phone = obj.phone;
        this.email = obj.email;
        this.cart = obj.cart;
        this.payment_status = obj.payment_status;
    }
    create() {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const { rows } = yield database_1.default.query(`INSERT INTO "order" (firstname, lastname, address, city, zipcode, phone, email, cart)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id`, [
                    this.firstname,
                    this.lastname,
                    this.address,
                    this.city,
                    this.zipcode,
                    this.phone,
                    this.email,
                    JSON.stringify(this.cart),
                ]);
                this.id = rows[0].id;
                return this;
            }
            catch (error) {
                console.log(error);
                if (error instanceof Error)
                    throw new Error(error.message);
            }
        });
    }
    static addPaymentStatus(id, payment_status) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                yield database_1.default.query(`UPDATE "order" SET payment_status=$1 WHERE id=$2`, [
                    payment_status,
                    id,
                ]);
            }
            catch (error) {
                console.log(error);
                if (error instanceof Error)
                    throw new Error(error.message);
            }
        });
    }
}
exports.default = Order;
