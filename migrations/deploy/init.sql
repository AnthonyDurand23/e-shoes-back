-- Deploy e-shoes:init to pg

BEGIN;

CREATE TABLE "genre" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "nom" TEXT NOT NULL
);

CREATE TABLE "produit" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "reference" TEXT NOT NULL UNIQUE,
  "nom" TEXT,
  "marque" TEXT,
  "prix"  FLOAT NOT NULL,
  "photos" TEXT,
  "dessus" TEXT,
  "doublure" TEXT,
  "semelle_proprete" TEXT,
  "semelle_usure" TEXT,
  "epaisseur_doublure" TEXT,
  "matiere" TEXT,
  "temps" TEXT,
  "sport" TEXT,
  "bout" TEXT,
  "forme_talon" TEXT,
  "fermeture" TEXT,
  "motif" TEXT,
  "info_sup" TEXT,
  "proprietes" TEXT,
  "genre_id" INTEGER NOT NULL REFERENCES "genre"("id")
);

CREATE TABLE "categorie" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "nom" TEXT NOT NULL
);

CREATE TABLE "produit_categorie" (
  "produit_id" INTEGER NOT NULL REFERENCES "produit"("id"),
  "categorie_id" INTEGER NOT NULL REFERENCES "categorie"("id")
);

COMMIT;
