CREATE ROLE IF NOT EXISTS 'marketing'@'localhost';
GRANT INSERT,UPDATE, DELETE
ON gescom_afpa.products, gescom_afpa.categories
TO"marketing@localhost";

GRANT SELECT
ON gescom_afpa.orders, gescom_afpa.orders_details, gescom_afpa.customers
TO 'marketing'@'localhost';