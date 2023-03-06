-- Revert e-shoes:init from pg

BEGIN;

DROP TABLE "product_category", "category", "gender", "product";

COMMIT;
