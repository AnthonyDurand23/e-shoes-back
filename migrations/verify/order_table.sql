-- Verify e-shoes:order_table on pg

BEGIN;

SELECT id FROM "order" WHERE false;

ROLLBACK;
