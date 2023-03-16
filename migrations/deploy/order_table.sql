-- Deploy e-shoes:order_table to pg

BEGIN;

CREATE TABLE "order" (
  "id" SERIAL PRIMARY KEY,
  "firstname" TEXT NOT NULL,
  "lastname" TEXT NOT NULL,
  "address" TEXT NOT NULL,
  "city" TEXT NOT NULL,
  "zipcode" TEXT NOT NULL,
  "phone" TEXT NOT NULL,
  "email" TEXT NOT NULL,
  "cart" JSON NOT NULL,
  "date" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  "payment_status" TEXT
);

COMMIT;
