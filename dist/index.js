"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const dotenv_1 = __importDefault(require("dotenv"));
const express_1 = __importDefault(require("express"));
// import cors, { CorsOptions } from "cors";
const router_1 = __importDefault(require("./app/router"));
dotenv_1.default.config();
const app = (0, express_1.default)();
const port = Number(process.env.PORT) || 5050;
// const corsOptions: CorsOptions = {
//     exposedHeaders: `Authorization`
// };
// app.use(cors(corsOptions));
app.use(express_1.default.json());
app.use(router_1.default);
app.use((_, response) => {
    response.status(404).json("Ǹot found");
});
app.listen(port, () => {
    console.log(`Server started on http://localhost:${port}`);
});
