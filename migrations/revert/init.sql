-- Revert e-shoes:init from pg

BEGIN;

DROP TABLE "produit_categorie", "categorie", "genre", "produit";

COMMIT;
