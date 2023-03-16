-- Revert e-shoes:order_table from pg

BEGIN;

DROP TABLE "order";

COMMIT;
