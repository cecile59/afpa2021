CREATE TABLE products(
   pro_id VARCHAR(50),
   pro_price CURRENCY NOT NULL,
   pro_reference CHAR(50) NOT NULL,
   pro_photo_file_name VARCHAR(350),
   pro_barcode INT NOT NULL,
   pro_date_of_and_modification DATETIME NOT NULL,
   pro_colour VARCHAR(50) NOT NULL,
   pro_description TEXT NOT NULL,
   nom_du_produit VARCHAR(150) NOT NULL,
   pro_physical_stock SMALLINT NOT NULL,
   pro_stock_alert SMALLINT NOT NULL,
   PRIMARY KEY(pro_id)
);

CREATE TABLE client(
   cus_id VARCHAR(50),
   cus_form_for_adding_a_registered VARCHAR(50),
   cus_password VARCHAR(50) NOT NULL,
   cus_contact_information VARCHAR(50) NOT NULL,
   cus_number_of_children VARCHAR(50),
   cus_addition_date DATE NOT NULL,
   PRIMARY KEY(cus_id)
);

CREATE TABLE employee(
   emp_id COUNTER,
   emp_poste VARCHAR(50) NOT NULL,
   emp_shop VARCHAR(50) NOT NULL,
   emp_service VARCHAR(50) NOT NULL,
   emp_annual_gross_salary VARCHAR(50) NOT NULL,
   emp_number_of_chidren INT,
   emp_seniority VARCHAR(50) NOT NULL,
   emp_sex VARCHAR(50) NOT NULL,
   cus_id VARCHAR(50),
   PRIMARY KEY(emp_id),
   FOREIGN KEY(cus_id) REFERENCES client(cus_id)
);

CREATE TABLE commende(
   ord_id VARCHAR(50),
   remise DECIMAL(4,2),
   ord_address VARCHAR(150) NOT NULL,
   quantité_produit BYTE NOT NULL,
   ord_product_reference INT NOT NULL,
   ord_colour VARCHAR(30),
   PRIMARY KEY(ord_id)
);

CREATE TABLE category(
   cat_id VARCHAR(50),
   cat_sous_category VARCHAR(50),
   PRIMARY KEY(cat_id)
);

CREATE TABLE fournisseur(
   pro_id VARCHAR(50),
   pro_name VARCHAR(50) NOT NULL,
   pro_commercial VARCHAR(50),
   PRIMARY KEY(pro_id)
);

CREATE TABLE share(
   pro_id VARCHAR(50),
   pro_id_1 VARCHAR(50),
   PRIMARY KEY(pro_id, pro_id_1),
   FOREIGN KEY(pro_id) REFERENCES products(pro_id),
   FOREIGN KEY(pro_id_1) REFERENCES fournisseur(pro_id)
);

CREATE TABLE quantiter_produit(
   pro_id VARCHAR(50),
   ord_id VARCHAR(50),
   amount VARCHAR(50),
   PRIMARY KEY(pro_id, ord_id),
   FOREIGN KEY(pro_id) REFERENCES products(pro_id),
   FOREIGN KEY(ord_id) REFERENCES commende(ord_id)
);

CREATE TABLE pouvoir(
   cus_id VARCHAR(50),
   ord_id VARCHAR(50),
   PRIMARY KEY(cus_id, ord_id),
   FOREIGN KEY(cus_id) REFERENCES client(cus_id),
   FOREIGN KEY(ord_id) REFERENCES commende(ord_id)
);

CREATE TABLE interrested(
   pro_id VARCHAR(50),
   cat_id VARCHAR(50),
   PRIMARY KEY(pro_id, cat_id),
   FOREIGN KEY(pro_id) REFERENCES products(pro_id),
   FOREIGN KEY(cat_id) REFERENCES category(cat_id)
);
