import db from "../database";

type ProductInstance = {
  id: number;
  reference: string;
  name: string;
  brand: string;
  price: number;
  photos: string;
  top: string;
  lining: string;
  sockliner: string;
  outsole: string;
  lining_thickness: string;
  material: string;
  weather: string;
  sport: string;
  end: string;
  heel_shape: string;
  closure: string;
  pattern: string;
  additional_infos: string;
  properties: string;
  gender: string;
  categories: string[];
};

class Product {
  id: number;
  reference: string;
  name: string;
  brand: string;
  price: number;
  photos: string;
  top: string;
  lining: string;
  sockliner: string;
  outsole: string;
  lining_thickness: string;
  material: string;
  weather: string;
  sport: string;
  end: string;
  heel_shape: string;
  closure: string;
  pattern: string;
  additional_infos: string;
  properties: string;
  gender: string;
  categories: string[];

  constructor(obj: ProductInstance) {
    this.id = obj.id;
    this.reference = obj.reference;
    this.name = obj.name;
    this.brand = obj.brand;
    this.price = obj.price;
    this.photos = obj.photos;
    this.top = obj.top;
    this.lining = obj.lining;
    this.sockliner = obj.sockliner;
    this.outsole = obj.outsole;
    this.lining_thickness = obj.lining_thickness;
    this.material = obj.material;
    this.weather = obj.weather;
    this.sport = obj.sport;
    this.end = obj.end;
    this.heel_shape = obj.heel_shape;
    this.closure = obj.closure;
    this.pattern = obj.pattern;
    this.additional_infos = obj.additional_infos;
    this.properties = obj.properties;
    this.gender = obj.gender;
    this.categories = obj.categories;
  }

  static async findAll(): Promise<ProductInstance[] | undefined> {
    try {
      const { rows } = await db.query(
        ` SELECT product.*, gender.name AS gender, cat_agg.categories FROM product
          JOIN gender ON product.gender_id = gender.id
          JOIN (
            SELECT product.id, ARRAY_AGG(category.name) AS categories FROM product
            JOIN product_category ON product.id = product_category.product_id
            JOIN category ON product_category.category_id = category.id
            GROUP BY product.id) AS cat_agg
          ON product.id = cat_agg.id;
        `
      );

      if (!rows[0]) throw new Error(`Aucun produit trouvé`);

      return rows.map((row) => new Product(row));
    } catch (error) {
      console.log(error);
      if (error instanceof Error) throw new Error(error.message);
    }
  }

  static async findByGender(
    gender: string
  ): Promise<ProductInstance[] | undefined> {
    try {
      const mixte = gender === "femme" || gender === "homme" ? "mixte" : "";
      const { rows } = await db.query(
        ` SELECT product.*, gender.name AS gender, cat_agg.categories FROM product
          JOIN gender ON product.gender_id = gender.id
          JOIN (
            SELECT product.id, ARRAY_AGG(category.name) AS categories FROM product
            JOIN product_category ON product.id = product_category.product_id
            JOIN category ON product_category.category_id = category.id
            GROUP BY product.id) AS cat_agg
          ON product.id = cat_agg.id
          WHERE gender.name = $1 OR gender.name = $2;
        `,
        [gender, mixte]
      );

      if (!rows[0])
        throw new Error(`Aucun produit trouvé pour le gender: ${gender}`);

      return rows.map((row) => new Product(row));
    } catch (error) {
      console.log(error);
      if (error instanceof Error) throw new Error(error.message);
    }
  }

  static async findById(id: number): Promise<ProductInstance | undefined> {
    try {
      const { rows } = await db.query(
        ` SELECT product.*, gender.name AS gender, cat_agg.categories FROM product
          JOIN gender ON product.gender_id = gender.id
          JOIN (
            SELECT product.id, ARRAY_AGG(category.name) AS categories FROM product
            JOIN product_category ON product.id = product_category.product_id
            JOIN category ON product_category.category_id = category.id
            GROUP BY product.id) AS cat_agg
          ON product.id = cat_agg.id
          WHERE product.id = $1;
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

  static async findPriceByRefrence(
    reference: string
  ): Promise<{ reference: string; price: number } | undefined> {
    try {
      const { rows } = await db.query(
        `SELECT product.price FROM product WHERE product.reference = $1;`,
        [reference]
      );

      if (!rows[0])
        throw new Error(`Aucun prix trouvé avec la référence: ${reference}`);

      return {
        reference: reference,
        price: rows[0].price,
      };
    } catch (error) {
      console.log(error);
      if (error instanceof Error) throw new Error(error.message);
    }
  }
}

export default Product;
