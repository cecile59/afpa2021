

create table voiture(
    voi_id int NOT NULL primary key auto_increment,
    voi_ref varchar (50) NOT NULL ,
    voi_lib varchar (50),
    voi_prix numeric NOT NULL,
    voi_descrip LONGTEXT, 
    voi_credit boolean,
    voi_neuf boolean,
    foreign key (pro_id) REFERENCES produits                  
  )


create table service_véhicules(
    servi_id int not null primary key auto_increment,
    servi_reparation boolean, 
    servi_datetime numeric NOT NULL,
    servi_ref varchar (50),
    servi_nom varchar(50),
    servi_prix numericser NOT NULL,
    servi_qte numeric NOT NULL ,
    voi_id int,
    foreign key (voi_id) REFERENCES voiture (voi_id)
)  

create table produits(
    pro_id int NOT  NULL primary key auto_increment,
    pro_nom varchar (50),
    pro_ref varchar (50),
    pro_description LONGTEXT,
    pro_stock int not NULL,
    pro_qte numeric,
    pro_prix numeric,
    servi_id int,
    foreign key (servi_id) REFERENCES service_vehicules(servi_id) 
)

create table emploiye(
    emp_id int NOT NULL primary key auto_increment,
    emp_nom varchar(50),
    emp_prenom varchar(50),
    emp_role varchar(250),
    emp_sex varchar(10),
    clien_nom int,
    foreign key (clien_nom) REFERENCES clients (clien_nom)
)

create table clients(
    clien_id int NOT NULL primary key auto_increment,
    clien_nom varchar (50),
    clien_prenom varchar (50),
    clien_ref numeric ,
    clien_age int,
    clien_sex varchar(10),
   emp_id int,
    foreign key (emp_id ) REFERENCES emploiye(emp_id )
)

create table commande(
    com_id int NOT NULL primary key auto_incremente,
    com_ref numeric,
    com_produit varchar(100),
    com_qte numeric,
    com_prix numeric,
    com_nom varchar(50),
    com_nom_vendeur varchar(50),
    com_description longtext,
   clien_id int
    foreign key (clien_id) REFERENCES  client (clien_id)
)


CREATE INDEX index1
ON commande ( com_ref  ) 