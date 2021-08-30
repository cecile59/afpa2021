-----------exi n°1---------------
---

--- ne marche pas ------------
SELECT orders_details(*), sup_name
FROM suppliers
JOIN products ON suppliers.sup_id=products.pro_id
JOIN orders_details ON products.pro_id=orders_details.ode_pro_id

--------------------------------------------------------------------
DELIMITER |

CREATE PROCEDURE Lst_Suppliers()
BEGIN
    SELECT sup_id, sup_name
    FROM suppliers
    join products
    on sup_id = pro_sup_id;
END |

DELIMITER ;
---
 CALL Lst_Suppliers;
---
SHOW CREATE PROCEDURE Lst_Suppliers;
---------------------------------------- -- EXO N°2  -----------------------------------
DELIMITER |

CREATE PROCEDURE Lst_Rush_Orders()
BEGIN
SELECT ord_status 
  FROM orders
  WHERE ord_status = 'commande urgente';
  END;

DELIMITER ;
  ------------------exo n°3----------------------
  SELECT pro_sup_id , (ode_unit_price * ode_quantity)
 FROM orders_details
 JOIN products ON orders_details.ode_pro_id=products.pro_id;
 --- ------------------------------------
 SELECT sup_id, (ode_unit_price*ode_quantity)
FROM suppliers,orders_details;





---------------------EXO N°3-----------------------
SELECT sup_id, (ode_unit_price*ode_quantity)
FROM suppliers ,orders_details 

WHERE sup_id=5;

--- OU ---
CREATE PROCEDURE CA_procedure ( IN p_code_f)
SELECT sup_id, (ode_unit_price*ode_quantity) * (100 - ode_discount / 100)   /*j'ai rajouter le calcule pour de la reduction*/ 
FROM suppliers ,orders_details 
WHERE sup_id=p_code_f;


--nouvelle ---
CREATE PROCEDURE CA_procedure ( IN p_code_f INT, IN p_anner_vente year)
SELECT SUM((ode_unit_price * ode_quantity) *(1 - ode_discount))  as total
from orders join  orders_details on ord_id = ode_ord_id 
JOIN   products on pro_id = ode_pro_id 
join suppliers on pro_sup_id = sup_id 
WHERE products.pro_id IN
(SELECT orders_details.ode_pro_id from orders_details) 
AND sup_id = p_code_f 
AND year(pro_add_date) = p_anner_vente;