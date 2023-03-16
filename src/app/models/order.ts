import db from "../database";

type OrderInstance = {
  id: number;
  firstname: string;
  lastname: string;
  address: string;
  city: string;
  zipcode: string;
  phone: string;
  email: string;
  cart: JSON;
  payment_status: string;
};

class Order {
  id: number;
  firstname: string;
  lastname: string;
  address: string;
  city: string;
  zipcode: string;
  phone: string;
  email: string;
  cart: JSON;
  payment_status: string;

  constructor(obj: OrderInstance) {
    this.id = obj.id;
    this.firstname = obj.firstname;
    this.lastname = obj.lastname;
    this.address = obj.address;
    this.city = obj.city;
    this.zipcode = obj.zipcode;
    this.phone = obj.phone;
    this.email = obj.email;
    this.cart = obj.cart;
    this.payment_status = obj.payment_status;
  }

  async create(): Promise<OrderInstance | undefined> {
    try {
      const { rows } = await db.query(
        `INSERT INTO "order" (firstname, lastname, address, city, zipcode, phone, email, cart)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id`,
        [
          this.firstname,
          this.lastname,
          this.address,
          this.city,
          this.zipcode,
          this.phone,
          this.email,
          JSON.stringify(this.cart),
        ]
      );
      this.id = rows[0].id;
      return this;
    } catch (error) {
      console.log(error);
      if (error instanceof Error) throw new Error(error.message);
    }
  }

  static async addPaymentStatus(
    id: number,
    payment_status: string
  ): Promise<void> {
    try {
      await db.query(`UPDATE "order" SET payment_status=$1 WHERE id=$2`, [
        payment_status,
        id,
      ]);
    } catch (error) {
      console.log(error);
      if (error instanceof Error) throw new Error(error.message);
    }
  }
}

export default Order;
