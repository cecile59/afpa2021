CREATE USER 'utili1'@'%' IDENTIFIED BY 'mimie59';
GRANT ALL PRIVILEGES ON gescom_afpa.* 
TO 'utili1'@'%' 
IDENTIFIED BY 'mimie59'



CREATE USER 'utili2'@'localhost' IDENTIFIED BY 'mimie25';
GRANT select 
ON gescom_afpa .*
TO 'utili2'@'localhost' 
IDENTIFIED BY 'mimie25'




CREATE USER 'utili3'@'localhost' IDENTIFIED BY 'mimie13';
GRANT select 
ON gescom_afpa .suppliers 
TO 'utili3'@'localhost' 
IDENTIFIED BY 'mimie13'