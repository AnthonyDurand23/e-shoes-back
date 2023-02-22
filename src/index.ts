import dotenv from "dotenv";
import express, { Response } from "express";
// import cors, { CorsOptions } from "cors";
import router from "./app/router";

dotenv.config();

const app = express();

const port = Number(process.env.PORT) || 5050;

// const corsOptions: CorsOptions = {
//     exposedHeaders: `Authorization`
// };

// app.use(cors(corsOptions));

app.use(express.json());

app.use(router);

app.use((_, response: Response): void => {
  response.status(404).json("Ǹot found");
});

app.listen(port, () => {
  console.log(`Server started on http://localhost:${port}`);
});
