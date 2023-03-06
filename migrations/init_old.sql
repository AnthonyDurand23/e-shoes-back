-- Deploy e-shoes:init to pg

BEGIN;

CREATE TABLE "gender" (
  "id" INT PRIMARY KEY,
  "name" TEXT NOT NULL
);

CREATE TABLE "product" (
  "id" INT PRIMARY KEY,
  "reference" TEXT NOT NULL UNIQUE,
  "name" TEXT,
  "brand" TEXT,
  "price"  FLOAT NOT NULL,
  "photos" TEXT,
  "top" TEXT,
  "lining" TEXT,
  "sockliner" TEXT,
  "outsole" TEXT,
  "lining_thickness" TEXT,
  "material" TEXT,
  "weather" TEXT,
  "sport" TEXT,
  "end" TEXT,
  "heel_shape" TEXT,
  "closure" TEXT,
  "pattern" TEXT,
  "additional_infos" TEXT,
  "properties" TEXT,
  "gender_id" INT NOT NULL REFERENCES "gender"("id")
);

CREATE TABLE "category" (
  "id" INT PRIMARY KEY,
  "name" TEXT NOT NULL
);

CREATE TABLE "product_category" (
  "product_id" INT NOT NULL REFERENCES "product"("id"),
  "category_id" INT NOT NULL REFERENCES "category"("id")
);

COMMIT;
