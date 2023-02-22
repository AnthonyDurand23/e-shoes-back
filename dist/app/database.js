"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const dotenv_1 = __importDefault(require("dotenv"));
const pg_1 = require("pg");
dotenv_1.default.config();
const config = {
    connectionString: process.env.DATABASE_URL,
};
if (process.env.NODE_ENV === `production`) {
    config.ssl = {
        rejectUnauthorized: false,
    };
}
const pool = new pg_1.Pool(config);
exports.default = pool;
