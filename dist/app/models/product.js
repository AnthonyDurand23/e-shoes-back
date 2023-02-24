"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const database_1 = __importDefault(require("../database"));
class Product {
    constructor(obj) {
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
    static findByGenre(genre) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const mixte = genre === "femme" || genre === "homme" ? "mixte" : "";
                const { rows } = yield database_1.default.query(` SELECT produit.*, genre.nom AS genre, cat_agg.categories FROM produit
          JOIN genre ON produit.genre_id = genre.id
          JOIN (
            SELECT produit.id, ARRAY_AGG(categorie.nom) AS categories FROM produit
            JOIN produit_categorie ON produit.id = produit_categorie.produit_id
            JOIN categorie ON produit_categorie.categorie_id = categorie.id
            GROUP BY produit.id) AS cat_agg
          ON produit.id = cat_agg.id
          WHERE genre.nom = $1 OR genre.nom = $2;
        `, [genre, mixte]);
                if (!rows[0])
                    throw new Error(`Aucun produit trouvé pour le genre: ${genre}`);
                return rows.map((row) => new Product(row));
            }
            catch (error) {
                console.log(error);
                if (error instanceof Error)
                    throw new Error(error.message);
            }
        });
    }
}
exports.default = Product;
