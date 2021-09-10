-----------------------------------------------------------------
-- Vues --
-----------------------------------------------------------------
CREATE VIEW v_produits_catalogue 
AS 
SELECT pro_id ,pro_ref , pro_name , cat_id , cat_name 
FROM products , categories;

-----------------------------------------------------------------


-- Procédures stockées
   ------------------

CREATE table if not EXISTS commander_article (
    codart INT,
    qte INT,
    date DATE
)

DELIMITER |

CREATE TRIGGER after_products_update
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    
    IF (old.pro_stock_alert > new.pro_stock)
    THEN 
        INSERT INTO commander_article (codart, qte, date) VALUES (NEW.pro_id, old.pro_stock_alert - new.pro_stock, now());

    end IF;

END |
 
    -----------------------------------------------------------------

Procédures stockées
--------------------

Créez la procédure stockée facture qui permet d'afficher 
les informations nécessaires à une facture en fonction d'un numéro de commande. 
Cette procédure doit sortir le montant total de la commande.

=>  /* 1 requête qui va chercher le montant total de la commande */
DELIMITER |

CREATE PROCEDURE facture1 (IN p_order_id INT(10))

BEGIN

DECLARE total DECIMAL(7,2);
SET total = ( SUMcus_lastname, cus_firstname , cus_address, sup_name ); 

SELECT ord_order_date , ord_id ,ord_ pro_price , cus_lastname , cus_firstname, cus_addresscus_id ,  total as total_commande
	FROM customers 
    JOIN  orders on customers.cus_id=orders.ord_cus_id
    JOIN orders_details ON orders.ord_id=orders_details.ode_ord_id
    JOIN products ON  orders_details.ode_pro_id=products.pro_id
    JOIN suppliers ON products .pro_sup_id=suppliers.sup_id ;
    END |

DELIMITER ;
 

    -----------------------------------------------------------------
Triggers
---------

Présentez le déclencheur after_products_update demandé dans la phase 2 de la séance sur les déclencheurs.
                    ----------
=>Créer une table commander_articles constituées de colonnes :

CREATE TABLE commander_article (
    codart INT PRIMARY KEY NOT NULL,
    qte INT,
    date DATE
    )
                    ----------
  
DELIMITER |

CREATE TRIGGER after_products_update
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    
    IF (old.pro_stock_alert > new.pro_stock)
    THEN 
        INSERT INTO commander_article (codart, qte, date) VALUES (NEW.pro_id, old.pro_stock_alert - new.pro_stock, now());

    end IF;

END |


    -----------------------------------------------------------------
    Transactions
    --------------

    -- 1)Ajouter une ligne dans la table posts pour référencer les employés à la retraite.
    INSERT INTO posts  (pos_id , pos_libelle)
    VALUES (null,'employés_retraitée');

    --3)Ecrire les requêtes correspondant à ces opéarations.

    -SELECT emp_enter_date ,emp_sho_id , emp_lastname , sho_city
FROM employees , shops
WHERE sho_id = 2    --conaitre les emploiyer d'arras

    -SELECT emp_id, emp_sho_id ,emp_lastname , sho_city, emp_enter_date ,emp_salary
FROM `gescom_afpa`.`shops`,employees 
WHERE sho_city = 'arras';-- Les emploiyées du shop d'arras du plus ancien au plus récent.

    -SELECT emp_id, emp_enter_date , sho_id , emp_lastname , sho_city, pos_id
FROM shops 
JOIN employees ON shops.sho_id=employees.emp_sho_id
JOIN posts ON employees.emp_pos_id=posts.pos_id
WHERE pos_id =14 AND sho_city = 'arras'  
ORDER BY `employees`.`emp_enter_date` DESC ;
-- les emploiyer de arras au poste de pépiniériste le plus ancien en poste dans ce magasin.
-- se qui va me donner le nom de lemploiyer le plus ancien pour ma requette suivente
------------------------------------------------------------------------------------

SELECT SUM(1.05*emp_salary)
FROM employees
WHERE emp_lastname="MOLETTE";
--augmenter de 5% 
----------------------------------------------------------

--4)Ecrire la transaction

START TRANSACTION;
 INSERT INTO posts  (pos_id , pos_libelle)
    VALUES (null,'employés_retraitée');
    
    
SELECT emp_id, emp_enter_date , sho_id , emp_lastname , sho_city, pos_id
FROM shops 
JOIN employees ON shops.sho_id=employees.emp_sho_id
JOIN posts ON employees.emp_pos_id=posts.pos_id
WHERE pos_id =14 AND sho_city = 'arras'  
ORDER BY `employees`.`emp_enter_date` DESC ;

SELECT SUM(1.05*emp_salary)
FROM employees
WHERE emp_lastname="MOLETTE";

------------------------------------------------





