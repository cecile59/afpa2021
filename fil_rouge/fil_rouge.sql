-- -----------------------------------------------------------------------------------------------------------------
-- |                                   2.2.2 - Créer la base de données                                              |                                                                                                                                     
-- -----------------------------------------------------------------------------------------------------------------
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
   cli_coeff VARCHAR(50),
   cli_nom VARCHAR(50),
   mode_de_payment LOGICAL,
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
   com_ref INT,
   com_date_payer INT,
   com_service VARCHAR(50),
   com_misse_a_jours VARCHAR(50),
   com_prix_total_HT CURRENCY,
   com_date_expédier DATE,
   pro_id VARCHAR(50),
   PRIMARY KEY(com_id),
   FOREIGN KEY(pro_id) REFERENCES produit(pro_id)
);

CREATE TABLE categorie(
   cat_id VARCHAR(50),
   cat_nom VARCHAR(50),
   PRIMARY KEY(cat_id)
);

CREATE TABLE emp_cli_id(
   emp_id VARCHAR(50),
   emp_service VARCHAR(50),
   emp_nom VARCHAR(50),
   emp_prenom VARCHAR(50),
   PRIMARY KEY(emp_id)
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
   PRIMARY KEY(sous_cat_id),
   FOREIGN KEY(cat_id) REFERENCES categorie(cat_id)
);

CREATE TABLE livraison_(
   liv_id VARCHAR(50),
   lid_adresse VARCHAR(50),
   liv_ville VARCHAR(50),
   liv_pays VARCHAR(50),
   liv_cli_nom VARCHAR(50),
   liv_com_id VARCHAR(50),
   PRIMARY KEY(liv_id)
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

CREATE TABLE gérer(
   pro_id VARCHAR(50),
   fou_id VARCHAR(50),
   PRIMARY KEY(pro_id, fou_id),
   FOREIGN KEY(pro_id) REFERENCES produit(pro_id),
   FOREIGN KEY(fou_id) REFERENCES fournisseurs(fou_id)
);

CREATE TABLE facturation_(
   cli_id VARCHAR(50),
   com_id VARCHAR(50),
   PRIMARY KEY(cli_id, com_id),
   FOREIGN KEY(cli_id) REFERENCES clients(cli_id),
   FOREIGN KEY(com_id) REFERENCES commande(com_id)
);

CREATE TABLE appartenir(
   emp_id VARCHAR(50),
   service__id VARCHAR(50),
   PRIMARY KEY(emp_id, service__id),
   FOREIGN KEY(emp_id) REFERENCES emp_cli_id(emp_id),
   FOREIGN KEY(service__id) REFERENCES service(service__id)
);

CREATE TABLE présier_(
   pro_id VARCHAR(50),
   sous_cat_id VARCHAR(50),
   PRIMARY KEY(pro_id, sous_cat_id),
   FOREIGN KEY(pro_id) REFERENCES produit(pro_id),
   FOREIGN KEY(sous_cat_id) REFERENCES sous_categorie(sous_cat_id)
);
---------------------------------------------------------------------------------------------------------------------
-- |                                   2.2.3- Créer la base de données                                              |--                                                                                                                                     
-- ------------------------------------------------------------------------------------------------------------------


