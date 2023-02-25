import db from "../database";

type ProductInstance = {
  id: number;
  reference: string;
  nom: string;
  marque: string;
  prix: number;
  photos: string;
  dessus: string;
  doublure: string;
  semelle_proprete: string;
  semelle_usure: string;
  epaisseur_doublure: string;
  matiere: string;
  temps: string;
  sport: string;
  bout: string;
  forme_talon: string;
  fermeture: string;
  motif: string;
  info_sup: string;
  proprietes: string;
  genre: string;
  categories: string[];
};

class Product {
  id: number;
  reference: string;
  nom: string;
  marque: string;
  prix: number;
  photos: string;
  dessus: string;
  doublure: string;
  semelle_proprete: string;
  semelle_usure: string;
  epaisseur_doublure: string;
  matiere: string;
  temps: string;
  sport: string;
  bout: string;
  forme_talon: string;
  fermeture: string;
  motif: string;
  info_sup: string;
  proprietes: string;
  genre: string;
  categories: string[];

  constructor(obj: ProductInstance) {
    this.id = obj.id;
    this.reference = obj.reference;
    this.nom = obj.nom;
    this.marque = obj.marque;
    this.prix = obj.prix;
    this.photos = obj.photos;
    this.dessus = obj.dessus;
    this.doublure = obj.doublure;
    this.semelle_proprete = obj.semelle_proprete;
    this.semelle_usure = obj.semelle_usure;
    this.epaisseur_doublure = obj.epaisseur_doublure;
    this.matiere = obj.matiere;
    this.temps = obj.temps;
    this.sport = obj.sport;
    this.bout = obj.bout;
    this.forme_talon = obj.forme_talon;
    this.fermeture = obj.fermeture;
    this.motif = obj.motif;
    this.info_sup = obj.info_sup;
    this.proprietes = obj.proprietes;
    this.genre = obj.genre;
    this.categories = obj.categories;
  }

  static async findByGenre(
    genre: string
  ): Promise<ProductInstance[] | undefined> {
    try {
      const mixte = genre === "femme" || genre === "homme" ? "mixte" : "";
      const { rows } = await db.query(
        ` SELECT produit.*, genre.nom AS genre, cat_agg.categories FROM produit
          JOIN genre ON produit.genre_id = genre.id
          JOIN (
            SELECT produit.id, ARRAY_AGG(categorie.nom) AS categories FROM produit
            JOIN produit_categorie ON produit.id = produit_categorie.produit_id
            JOIN categorie ON produit_categorie.categorie_id = categorie.id
            GROUP BY produit.id) AS cat_agg
          ON produit.id = cat_agg.id
          WHERE genre.nom = $1 OR genre.nom = $2;
        `,
        [genre, mixte]
      );

      if (!rows[0])
        throw new Error(`Aucun produit trouvé pour le genre: ${genre}`);

      return rows.map((row) => new Product(row));
    } catch (error) {
      console.log(error);
      if (error instanceof Error) throw new Error(error.message);
    }
  }

  static async findById(id: number): Promise<ProductInstance | undefined> {
    try {
      const { rows } = await db.query(
        ` SELECT produit.*, genre.nom AS genre, cat_agg.categories FROM produit
          JOIN genre ON produit.genre_id = genre.id
          JOIN (
            SELECT produit.id, ARRAY_AGG(categorie.nom) AS categories FROM produit
            JOIN produit_categorie ON produit.id = produit_categorie.produit_id
            JOIN categorie ON produit_categorie.categorie_id = categorie.id
            GROUP BY produit.id) AS cat_agg
          ON produit.id = cat_agg.id
          WHERE produit.id = $1;
        `,
        [id]
      );

      if (!rows[0]) throw new Error(`Aucun produit trouvé avec l'id: ${id}`);

      const product = new Product(rows[0]);
      return product;
    } catch (error) {
      console.log(error);
      if (error instanceof Error) throw new Error(error.message);
    }
  }
}

export default Product;
