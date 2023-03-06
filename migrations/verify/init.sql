-- Verify e-shoes:init on pg

BEGIN;

SELECT id FROM "product" WHERE false;
SELECT id FROM "gender" WHERE false;
SELECT id FROM "category" WHERE false;

ROLLBACK;
