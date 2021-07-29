-- Alimenter la base de données
-- script Gescom

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




-- Les besoins d'affichage

-- Q1. Afficher dans l'ordre alphabétique et sur une seule colonne, 
-- les noms et prénoms des employés qui ont des enfants. Présenter d'abord ceux qui en ont le plus.
SELECT emp_lastname, emp_firstname,emp_children
FROM employees
WHERE  emp_children > 1
ORDER BY emp_lastname ASC

-- Q2. Y-a-t-il des clients étrangers ? Afficher leur nom, prénom et pays de résidence.
SELECT cus_lastname, cus_firstname, cus_countries_id
FROM  customers 
WHERE cus_countries_id !="FR"


-- Q3. Afficher par ordre alphabétique 
-- les villes de résidence des clients ainsi que le code (ou le nom) du pays.
SELECT cus_city, cus_countries_id 
FROM customers 
ORDER BY cus_city ASC;

-- ou
SELECT cus_city, cus_countries_id ,cou_name
FROM customers ,countries
WHERE cus_countries_id = cou_id
ORDER BY cus_city ,cou_name ASC; 


-- Q4. Afficher le nom des clients dont les fiches ont été modifiées
SELECT cus_lastname , cus_update_date 
FROM customers 
WHERE cus_update_date IS NOT NULL;

-- Q5. La commerciale Coco Merce veut consulter la fiche d'un client, 
-- mais la seule chose dont elle se souvienne est qu'il habite une ville genre 'divos'.
--  Pouvez-vous l'aider ?
SELECT cus_id, cus_city, cus_lastname ,cus_firstname 
FROM customers 
WHERE cus_city LIKE '%divos%';

-- Q6. Quel est le produit dont le prix de vente est le moins cher ? Afficher le prix,
--  l'id et le nom du produit.
SELECT pro_price ,pro_id ,pro_name
FROM products
ORDER by pro_price ASC    
limit 1;


-- Q7. Lister les produits qui n'ont jamais été vendus.
SELECT pro_id , pro_ref , pro_name 
FROM products 
WHERE pro_id NOT IN (SELECT ode_pro_id FROM orders_details WHERE pro_id=ode_pro_id);

-- Q8. Afficher les produits commandés par Madame Pikatchien.
SELECT pro_id, pro_ref, pro_color, pro_name, cus_id, cus_lastname, ord_id, ode_id 
FROM orders_details 
JOIN products ON orders_details.ode_pro_id=products.pro_id 
JOIN orders ON products.pro_id=orders.ord_cus_id 
JOIN customers ON orders.ord_id=customers.cus_id 
WHERE cus_lastname like 'Pikatchien';

-- Q9. Afficher le catalogue des produits par catégorie, 
-- le nom des produits et de la catégorie doivent être affichés.
SELECT cat_id ,cat_name,pro_name 
FROM categories, products;

-- Q10. Afficher l'organigramme du magasin de Compiègne 
-- Afficher le nom et prénom des employés, classés par ordre alphabétique,
-- ainsi que celui de leur supérieur hiérarchique 
-- (et éventuellement leurs postes respectifs, si vous y parvenez).
SELECT sho_city, emp_lastname , emp_firstname 
FROM shops,employees 
WHERE sho_city LIKE '%Compiègne%' 
ORDER BY emp_lastname , emp_firstname ASC;
ou
SELECT sho_city, emp_lastname , emp_firstname ,emp_superior_id ,emp_pos_id,dep_id 
FROM shops 
JOIN employees ON shops.sho_id=employees.emp_sho_id 
JOIN departments ON employees.emp_dep_id=departments.dep_id 
WHERE sho_city LIKE '%Compiègne%' 
ORDER BY employees.emp_lastname ASC

-- Q11. Quel produit a été vendu avec la remise la plus élevée ? 
-- Afficherle numéro et le nom du produit, le numéro de commande,
--  le numéro de ligne de commande, et le montant de la remise.

SELECT max(ode_discount), pro_id, pro_name, pro_ref, ode_id, ord_id
FROM products
JOIN orders_details on products.pro_id=orders_details.ode_pro_id
JOIN orders on orders_details.ode_ord_id=orders.ord_id
WHERE MAX(ode_discount) 
LIMIT 1
-- ( a refaire ne marche pas )

-- Q12. Combien y-a-t-il de clients canadiens ? Afficher dans une colonne intitulée 'Nb clients Canada'

-- Résultat : 2 clients

SELECT COUNT(customers.cus_countries_id) as 'Nb clients Canada' 
FROM customers 
WHERE customers.cus_countries_id ='CA';

-- Q13. Afficher le détail des commandes de 2020.
SELECT ode_id, ode_unit_price, ode_discount, ode_quantity, ode_ord_id, ode_pro_id, ord_order_date
FROM orders 
JOIN orders_details on orders.ord_id=orders_details.ode_ord_id
WHERE orders.ord_order_date BETWEEN '2020-01-01' AND '2020-12-31'
LIMIT 5;


-- Q14. Afficher les coordonnées des fournisseurs pour lesquels des commandes ont été passées.
SELECT sup_name, sup_city, sup_countries_id, sup_address, sup_zipcode, sup_phone, sup_mail ,pro_sup_id 
FROM suppliers 
JOIN products on suppliers.sup_id=products.pro_sup_id ;

-- Q15. Quel est le chiffre d'affaires de 2020 ?
SELECT SUM(ode_unit_price * ode_quantity *(1 - ode_discount / 100)) 
AS TOTAL 
FROM orders_details 
JOIN orders ON orders_details.ode_ord_id=orders.ord_id 
WHERE year(ord_order_date)=2020;

-- Q16. Lister le total de chaque commande par total décroissant. Afficher le numéro de commande,
-- la date, le total et le nom du client).
SELECT ord_id, ord_order_date ,ode_quantity, cus_lastname,
(ode_unit_price * ode_quantity) as total 

FROM orders_details
JOIN orders on orders_details.ode_ord_id=orders.ord_id;
JOIN customers ON orders.ord_cus_id=customers.cus_id ;

-- Q17. Quel est le montant du panier moyen ?
SELECT count (ode_unit_price*ode_ord_id) /(ode_id)
FROM orders_details;
-- ne fonctionne pas

-- Q18. La version 2020 du produit barb004 s'appelle désormais Camper et, 
-- bonne nouvelle, son prix subit une baisse de 10%. Mettre à jour la fiche de ce produit.
UPDATE products 
SET pro_ref= 'Camper', pro_price=pro_price*0.9 
WHERE pro_ref='barb004';

-- Q19. L'inflation en France l'année dernière a été de 1,1%. 
-- Appliquer cette augmentation à la gamme de parasols.

UPDATE products 
SET pro_price = pro_price * 1.01
WHERE pro_cat_id = 25;

-- Q20. Supprimer les produits non vendus de la catégorie "Tondeuses électriques".
--  Vous devez utiliser une sous-requête sans indiquer de valeurs de clés.
