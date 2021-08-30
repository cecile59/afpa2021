--------------------------------------------------------------

Use gescom_afpa


ALTER TABLE products  ENGINE=InnoDB 

DELIMITER |

CREATE TRIGGER majStock AFTER INSERT ON orders_details 
FOR EACH ROW BEGIN UPDATE products SET pro_stock = pro_stock-1 WHERE id = NEW.ode_id; 
END |

DELIMITER ;

------------------------------------------
