CREATE TABLE admin (
    id_admin SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE category(
   id_category SERIAL,
   name VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_category)
);

CREATE TABLE staff(
   id_staff SERIAL,
   name VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_staff)
);

CREATE TABLE salary_history(
   id_sh SERIAL,
   amount NUMERIC(15,2)   NOT NULL,
   date_salary DATE NOT NULL,
   id_staff INTEGER,
   PRIMARY KEY(id_sh),
   FOREIGN KEY(id_staff) REFERENCES staff(id_staff)
);

CREATE TABLE product(
   id_product SERIAL,
   name VARCHAR(50)  NOT NULL,
   description VARCHAR(250)  NOT NULL,
   image VARCHAR(50),
   id_category INTEGER NOT NULL,
   PRIMARY KEY(id_product),
   FOREIGN KEY(id_category) REFERENCES category(id_category)
);

CREATE TABLE stock(
   id_stock SERIAL,
   sale_qtt INTEGER NOT NULL,
   purchase_qtt INTEGER NOT NULL,
   unitary_purchase_amount NUMERIC(15,2) NOT NULL, -- matiere premiere
   date_inventory TIMESTAMP NOT NULL,
   id_product INTEGER NOT NULL,
   PRIMARY KEY(id_stock),
   FOREIGN KEY(id_product) REFERENCES product(id_product)
);

CREATE TABLE sale_price_history(
   id_price_history SERIAL,
   amount NUMERIC(15,2)   NOT NULL,
   date_history DATE NOT NULL,
   id_product INTEGER NOT NULL,
   PRIMARY KEY(id_price_history),
   FOREIGN KEY(id_product) REFERENCES product(id_product)
);

CREATE TABLE recipe(
   id_recipe SERIAL,
   id_product INTEGER NOT NULL,
   id_product_ingredient INTEGER,
   qtt_ingredient NUMERIC(15,2) NOT NULL,
   PRIMARY KEY(id_recipe),
   FOREIGN KEY(id_product) REFERENCES product(id_product),
   FOREIGN KEY(id_product_ingredient) REFERENCES product(id_product)
);