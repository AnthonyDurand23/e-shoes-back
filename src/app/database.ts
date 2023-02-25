import dotenv from "dotenv";
import { Pool, PoolConfig } from "pg";

dotenv.config();

const config: PoolConfig = {
  connectionString: process.env.DATABASE_URL,
};

// if (process.env.NODE_ENV === `production`) {
//   config.ssl = {
//     rejectUnauthorized: false,
//   };
// }

const pool = new Pool(config);

export default pool;
