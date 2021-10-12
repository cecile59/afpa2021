CREATE TABLE produit(
   pro_id VARCHAR(50),
   pro_description TEXT,
   pro_ref INT NOT NULL,
   _description_long_ VARCHAR(50) NOT NULL,
   pro_stock INT,
   pro_mise_a__jour VARCHAR(50),
   pro_reduction CURRENCY,
   pro_ref_fournisseur INT,
   pro_prix_hors_taxe CURRENCY NOT NULL,
   PRIMARY KEY(pro_id)
);

CREATE TABLE clients(
   cli_id VARCHAR(50),
   cli_coef DECIMAL(6,2),
   cli_nom VARCHAR(50),
   cli_type_payment LOGICAL,
   cli_prenom VARCHAR(50),
   cli_mail VARCHAR(50),
   cli_ref INT,
   cli_adresse VARCHAR(50),
   cli_ville VARCHAR(50),
   cli_pays VARCHAR(50),
   PRIMARY KEY(cli_id)
);

CREATE TABLE commande(
   com_id VARCHAR(50),
   com_cli_id INT,
   com_ref INT,
   com_service VARCHAR(50),
   com_misse_a_jours VARCHAR(50),
   com_date_payer INT,
   com_date_expédier DATE,
   com_date DATE,
   com_adresse_facture VARCHAR(50),
   com_address_livraison VARCHAR(50),
   com_prix_total_ttc VARCHAR(50),
   com_prix_total_HT CURRENCY,
   com_prix_unitaire_ht VARCHAR(50),
   pro_id VARCHAR(50),
   PRIMARY KEY(com_id),
   FOREIGN KEY(pro_id) REFERENCES produit(pro_id)
);

CREATE TABLE categorie(
   cat_id VARCHAR(50),
   cat_nom VARCHAR(50),
   PRIMARY KEY(cat_id)
);

CREATE TABLE service(
   service__id VARCHAR(50),
   ser_compabiliter VARCHAR(50),
   ser_apres_vente VARCHAR(50),
   ser_commercial VARCHAR(50),
   PRIMARY KEY(service__id)
);

CREATE TABLE sous_categorie(
   sous_cat_id VARCHAR(50),
   sous_cat_nom VARCHAR(50),
   cat_id VARCHAR(50) NOT NULL,
   pro_id VARCHAR(50),
   PRIMARY KEY(sous_cat_id),
   FOREIGN KEY(cat_id) REFERENCES categorie(cat_id),
   FOREIGN KEY(pro_id) REFERENCES produit(pro_id)
);

CREATE TABLE facture(
   fac_id INT,
   fac_cli_id INT,
   fac_com_id INT,
   fac_ref INT,
   fac_date DATE,
   fac_adress VARCHAR(50),
   fac_designation TEXT,
   fac_quantiter INT,
   fac_prix_ht INT,
   fac_total_ht INT,
   fac_tva INT,
   fac_total_ttc INT,
   PRIMARY KEY(fac_id)
);

CREATE TABLE fournisseurs(
   fou_id VARCHAR(50),
   fou_adress VARCHAR(50),
   fou_nom VARCHAR(50),
   fou_mail VARCHAR(50),
   fou_cat LOGICAL,
   com_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(fou_id),
   FOREIGN KEY(com_id) REFERENCES commande(com_id)
);

CREATE TABLE emploiyée(
   emp_id VARCHAR(50),
   emp_service VARCHAR(50),
   emp_nom VARCHAR(50),
   emp_mail VARCHAR(50),
   emp_tel VARCHAR(50),
   emp_cli_id VARCHAR(50),
   emp_prenom VARCHAR(50),
   service__id VARCHAR(50) NOT NULL,
   PRIMARY KEY(emp_id),
   FOREIGN KEY(service__id) REFERENCES service(service__id)
);

CREATE TABLE bon_livraison_(
   bl_id INT,
   bl_com_id VARCHAR(50),
   bl_cli_id VARCHAR(50),
   bl_date DATE,
   bl_ref INT,
   bl_adresse_livraison VARCHAR(50),
   bl_ville VARCHAR(50),
   bl_pays VARCHAR(50),
   bl_quantiter INT,
   bl_designation VARCHAR(50),
   com_id VARCHAR(50) NOT NULL,
   fac_id INT NOT NULL,
   PRIMARY KEY(bl_id),
   FOREIGN KEY(com_id) REFERENCES commande(com_id),
   FOREIGN KEY(fac_id) REFERENCES facture(fac_id)
);

CREATE TABLE facturation_(
   cli_id VARCHAR(50),
   com_id VARCHAR(50),
   PRIMARY KEY(cli_id, com_id),
   FOREIGN KEY(cli_id) REFERENCES clients(cli_id),
   FOREIGN KEY(com_id) REFERENCES commande(com_id)
);

CREATE TABLE vendre(
   cli_id VARCHAR(50),
   emp_id VARCHAR(50),
   PRIMARY KEY(cli_id, emp_id),
   FOREIGN KEY(cli_id) REFERENCES clients(cli_id),
   FOREIGN KEY(emp_id) REFERENCES emploiyée(emp_id)
);
