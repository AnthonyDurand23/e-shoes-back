-- Verify e-shoes:init on pg

BEGIN;

SELECT id FROM "produit" WHERE false;
SELECT id FROM "genre" WHERE false;
SELECT id FROM "categorie" WHERE false;

ROLLBACK;
