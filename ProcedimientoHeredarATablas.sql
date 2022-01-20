-- PROCEDIMIENTO LLENAR TABLA HIJA
drop table Usuario;
drop table Vendedor;
drop table Cliente;

create table Usuario(
cc number,
nombre varchar(50),
apellido varchar(50),
IdCli number,
IdVendedor number,
CONSTRAINT PK_cc PRIMARY KEY (cc)
);

INSERT INTO Usuario(cc,nombre,apellido,IdCli,IdVendedor) VALUES (2,'Daniel','Puentes',6,7);
INSERT INTO Usuario(cc,nombre,apellido,IdCli,IdVendedor) VALUES (3,'Andres','Ramirez',8,9);
INSERT INTO Usuario(cc,nombre,apellido,IdCli,IdVendedor) VALUES (4,'Paula','Galvan',31,2);

create table Vendedor(
IdVendedor number,
cc number,
nombre varchar(50),
apellido varchar(50),
CONSTRAINT PK_cc_Ven PRIMARY KEY (IdVendedor),
CONSTRAINT FK_cc_ven FOREIGN KEY (cc) REFERENCES Usuario(cc)
);

create table Cliente(
IdCli number,
cc number,
nombre varchar(50),
apellido varchar(50),
CONSTRAINT PK_cc_Cli PRIMARY KEY (IdCli),
CONSTRAINT FK_cc_cli FOREIGN KEY (cc) REFERENCES Usuario(cc)
);

CREATE OR REPLACE PROCEDURE Llenar_Tablas IS 
  CURSOR Cur_1 IS
     SELECT cc,nombre,apellido,IdVendedor
        
     FROM Usuario;
BEGIN
   FOR R  IN Cur_1 LOOP
        INSERT INTO Vendedor(cc, nombre, apellido, IdVendedor)
                        
        VALUES(R.cc, R.nombre, R.apellido, R.IdVendedor);
        
                               
   END LOOP;
END;
/

execute Llenar_Tablas;
select * from Vendedor;
