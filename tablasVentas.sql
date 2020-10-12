CREATE DATABASE ventas
GO
USE ventas
GO

CREATE TABLE productos(
    ID INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    stockMinimo INT,
    stockMaximo INT,
    existencia INT,
    continente CHAR(1),
    PRIMARY KEY(id)
)
GO
CREATE TABLE ventas(
    folio INT NOT NULL,
    idProducto INT NOT NULL,
    NoUnidades INT NOT NULL,
    CONSTRAINT PK_UserGroup PRIMARY KEY NONCLUSTERED (folio, idProducto)
)
GO



INSERT INTO productos VALUES(1,'Lapiz',22,120,80,1)
Go
INSERT INTO productos VALUES(2,'Borrador',15,90,50,1)
GO
INSERT INTO productos VALUES(3,'Sacapuntas',25,100,70,1)
GO
INSERT INTO productos VALUES(4,'Plumon',20,90,60,1)


INSERT INTO productos VALUES(20,'Silla',22,120,80,2)
Go
INSERT INTO productos VALUES(21,'Cama',15,90,50,2)
GO
INSERT INTO productos VALUES(22,'Armario',25,100,70,2)
GO
INSERT INTO productos VALUES(23,'Escritorio',20,90,60,2)
GO


INSERT INTO productos VALUES(40,'Refrigerador',22,120,80,3)
Go
INSERT INTO productos VALUES(41,'Computadora',15,90,50,3)
GO
INSERT INTO productos VALUES(42,'Celular',25,100,70,3)
GO
INSERT INTO productos VALUES(43,'Television',20,90,60,3)
Go

INSERT INTO productos VALUES(60,'Bicleta',22,120,80,4)
Go
INSERT INTO productos VALUES(61,'Carrito',15,90,50,4)
GO
INSERT INTO productos VALUES(62,'Peluche',25,100,70,4)
GO
INSERT INTO productos VALUES(63,'Juego de Mesa',20,90,60,4)
Go


INSERT INTO ventas VALUES(1200,1,15)
Go
INSERT INTO ventas VALUES(1200,2,5)
Go
INSERT INTO ventas VALUES(1200,3,7)
Go

INSERT INTO ventas VALUES(600,1,10)
Go
INSERT INTO ventas VALUES(600,2,12)
Go


INSERT INTO ventas VALUES(1500,21,10)
Go
INSERT INTO ventas VALUES(1500,22,13)
Go
INSERT INTO ventas VALUES(1500,23,10)
Go

INSERT INTO ventas VALUES(1700,40,20)
Go
INSERT INTO ventas VALUES(1700,42,12)
Go
INSERT INTO ventas VALUES(1700,43,9)
Go

INSERT INTO ventas VALUES(1900,61,5)
Go
INSERT INTO ventas VALUES(1900,62,9)
Go
INSERT INTO ventas VALUES(1900,63,11)
Go


