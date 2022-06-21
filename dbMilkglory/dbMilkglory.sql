/* Crear mi BD */
CREATE DATABASE dbMilkglory;

/* Poner en uso la BD */
USE dbMilkglory;

/* Crear tabla CATEGORÍA */
CREATE TABLE CATEGORIA
(
    CODCAT char(6),
    NOMCAT varchar(60),
    CONSTRAINT CODCAT_PK PRIMARY KEY (CODCAT)
);

/* Crear tabla UBIGEO */
CREATE TABLE UBIGEO
(
    CODUBI char(6),
    DEPUBI varchar(80),
    PROVUBI varchar(80),
    DISTUBI varchar(80),
    CONSTRAINT CODUBI_PK PRIMARY KEY (CODUBI)
);

/* Crear tabla PRODUCTO */
CREATE TABLE PRODUCTO
(
    CODPRO char(6),
    NOMPRO varchar(50),
    PREPRO decimal(8,2),
    STOCKPRO int,
    CODCAT char(6),
    CONSTRAINT CODPRO_PK PRIMARY KEY (CODPRO)
);

/* Crear tabla CLIENTE */
CREATE TABLE CLIENTE
(
    CODCLI char(6),
    DNICLI char(8),
    NOMCLI varchar(40),
    APECLI varchar(80),
    CELCLI char(9),
    EMACLI varchar(50),
	FECNACCLI date,
    UBICLI char(6),
    CONSTRAINT CODCLI_PK PRIMARY KEY (CODCLI)
);

/* Crear tabla VENDEDOR */
CREATE TABLE VENDEDOR
(
    CODVEND char(6),
    NOMVEND varchar(50),
    APEVEND varchar(50),
    DNIVEND char(8),
    CELVEND char(9),
    DOMVEND varchar(80),
    UBIVEND char(6),
    CONSTRAINT CODVEND_PK PRIMARY KEY (CODVEND)
);

/* Crear tabla VENTA */
CREATE TABLE VENTA
(
    IDVENT int AUTO_INCREMENT,
    FECVENT date,
    CODVEND char(6),
    CODCLI char(6),
    TIPVENT char(1),
    CONSTRAINT IDVENT_PK PRIMARY KEY (IDVENT)
);

/* Crear tabla VENTA_DETALLE */
CREATE TABLE VENTA_DETALLE
(
    IDVENTDET int AUTO_INCREMENT,
    IDVENT int,
    CODPRO char(6),
    CANTVENTDET int,
    CONSTRAINT IDVENTDET_PK PRIMARY KEY (IDVENTDET)
);

/* Relacionar CLIENTE - UBIGEO */
ALTER TABLE CLIENTE
	ADD CONSTRAINT CLIENTE_UBIGEO FOREIGN KEY (UBICLI) REFERENCES UBIGEO (CODUBI);

/* Relacionar VENDEDOR - UBIGEO */
ALTER TABLE VENDEDOR
	ADD CONSTRAINT VENDEDOR_UBIGEO FOREIGN KEY (UBIVEND) REFERENCES UBIGEO (CODUBI);

/* Relacionar PRODUCTO - CATEGORIA */
ALTER TABLE PRODUCTO
	ADD CONSTRAINT PRODUCTO_CATEGORIA FOREIGN KEY (CODCAT) REFERENCES CATEGORIA (CODCAT);
    
/* Relacionar VENTA - CLIENTE */
ALTER TABLE VENTA
	ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY (CODCLI) REFERENCES CLIENTE (CODCLI);

/* Relacionar VENTA - VENDEDOR */
ALTER TABLE VENTA
	ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY (CODVEND) REFERENCES VENDEDOR (CODVEND);

/* Relacionar VENTA_DETALLE - VENTA */
ALTER TABLE VENTA_DETALLE
	ADD CONSTRAINT VENTA_DETALLE_VENTA FOREIGN KEY (IDVENT) REFERENCES VENTA (IDVENT);

/* Relacionar VENTA_DETALLE - PRODUCTO */
ALTER TABLE VENTA_DETALLE
	ADD CONSTRAINT VENTA_DETALLE_PRODUCTO FOREIGN KEY (CODPRO) REFERENCES PRODUCTO (CODPRO);

/* Listar tablas de la base de datos */
SHOW TABLES FROM dbMilkglory;

/* Listar relaciones */
SELECT 
  CONSTRAINT_NAME,
  `TABLE_NAME`,                            -- Foreign key table
  `COLUMN_NAME`,                           -- Foreign key column
  `REFERENCED_TABLE_NAME`,                 -- Origin key table
  `REFERENCED_COLUMN_NAME`                 -- Origin key column
FROM
  `INFORMATION_SCHEMA`.`KEY_COLUMN_USAGE`  -- Will fail if user don't have privilege
WHERE
  `TABLE_SCHEMA` = SCHEMA()                -- Detect current schema in USE 
  AND `REFERENCED_TABLE_NAME` IS NOT NULL; -- Only tables with foreign keys;

/* Ver estructura tabla CATEGORIA */
DESCRIBE CATEGORIA;

/* Insertar registros CATEGORIA */
INSERT INTO CATEGORIA
(CODCAT, NOMCAT)
VALUES
('CA0001', 'Leches'),
('CA0002', 'Yogurt'),
('CA0003', 'Mezclas Lácteas'),
('CA0004', 'Mantequilla'),
('CA0005', 'Leche Condensada'),
('CA0006', 'Paneton'),
('CA0007', 'Shake');

/* Listar registros CATEGORIA */
SELECT * FROM CATEGORIA;

/* Ver estructura UBIGEO */
DESCRIBE UBIGEO;

/* Insertar registros en la tabla UBIGEO */
INSERT INTO UBIGEO
(CODUBI, DEPUBI, PROVUBI, DISTUBI)
VALUES
('140401', 'Lima', 'Cañete', 'San Vicente de Cañete'),
('140402', 'Lima', 'Cañete', 'Calango'),
('140403', 'Lima', 'Cañete', 'Cerro Azul'),
('140404', 'Lima', 'Cañete', 'Coayllo'),
('140405', 'Lima', 'Cañete', 'Chilca'),
('140406', 'Lima', 'Cañete', 'Imperial'),
('140407', 'Lima', 'Cañete', 'Lunahuaná'),
('140408', 'Lima', 'Cañete', 'Mala'),
('140409', 'Lima', 'Cañete', 'Nuevo Imperial'),
('140410', 'Lima', 'Cañete', 'Pacarán'),
('140411', 'Lima', 'Cañete', 'Quilmaná'),
('140412', 'Lima', 'Cañete', 'San Antonio'),
('140413', 'Lima', 'Cañete', 'San Luis'),
('140414', 'Lima', 'Cañete', 'Santa Cruz de Flores'),
('140415', 'Lima', 'Cañete', 'Zúñiga'),
('140416', 'Lima', 'Cañete', 'Asia');

/* Listar registros de UBIGEO */
SELECT * FROM UBIGEO;

/* Ver estructura tabla CLIENTE */
DESCRIBE CLIENTE;

/* Insertar registro tabla CLIENTE */
INSERT INTO CLIENTE
(CODCLI, DNICLI, NOMCLI, APECLI, CELCLI, EMACLI, FECNACCLI, UBICLI)
VALUES
('CL0001','45781233','Alicia','García Campos','929185236','agarcia@gmail.com','1977/01/01','140409'),
('CL0002','15487922','Juana','Ávila Chumpitaz','923568741','javila@gmail.com','1980/07/15','140402'),
('CL0003','15253588','Oscar','Coronado Vásquez','932615478','ocoronado@gmail.com','1975/06/12','140403'),
('CL0004','85213566','Luis','Barrios Palomino','932817645','lbarrios@outlook.com','1981/03/24','140409'),
('CL0005','15482566','María','Tarazona Mendoza','978400123','mtarazona@outlook.com','1975/08/16','140407'),
('CL0006','15428211','Pedro','Sánchez Dávila','941533268','psanchez@yahoo.com','1970/09/10','140402'),
('CL0007','47129533','Aldo','Torres Zavala','958866221','atorres@yahoo.com','1980/02/20','140405'),
('CL0008','48171533','Fiorella','Monteza Alzamora','992255441','fmonteza@gmail.com','1979/04/30','140408'),
('CL0009','15429866','Gloria','Linares Rodríguez','954415950','glinares@hotmail.com','1981/09/23','140403'),
('CL0010','85251592','Esperanza','Stark Parker','901133258','estark@yahoo.com','1978/10/24','140405');

/* Listar registros de tabla CLIENTE */
SELECT * FROM CLIENTE;

/* Insertar registro tabla CLIENTE */
INSERT INTO PRODUCTO
(CODPRO, NOMPRO, PREPRO, STOCKPRO, CODCAT)
VALUES
('P00001','Leche Evaporada','3.50','100','CA0001'),
('P00002','Leche Light','4.00','100','CA0001'),
('P00003','Leche Descremada','3.00','100','CA0001'),
('P00004','Leche Gloria Niños','5.00','100','CA0001'),
('P00005','Leche Sin Lactosa','3.50','100','CA0001'),
('P00006','Yogurt Vainilla','7.00','100','CA0002'),
('P00007','Yogurt Fresa','7.00','100','CA0002'),
('P00008','Yogurt Lúcuma','7.00','100','CA0002'),
('P00009','Yogurt Durazno ','7.00','100','CA0002'),
('P00010','Yogurt Piña','7.00','100','CA0002'),
('P00011','Yogurt Mango','6.50','100','CA0002'),
('P00012','Bonlé Cremosa','3.50','100','CA0003'),
('P00013','Pura Vida','4.00','100','CA0003'),
('P00014','Bonlé Familiar','21.00','100','CA0003'),
('P00015','Bonlé Bajo en Grasa','19.50','100','CA0003'),
('P00016','Bonlé Sin Lactosa','19.00','100','CA0003'),
('P00017','Bonlé Polvo','2,50.','100','CA0003'),
('P00018','Mantequilla','8.00','100','CA0004'),
('P00019','Leche Condensada','5.00','100','CA0005'),
('P00020','Dulce de Leche','3.00','100','CA0005'),
('P00021','Gloria','20.00','100','CA0006'),
('P00022','Pasión','18.00','100','CA0006'),
('P00023','Dolcci','18.50','100','CA0006'),
('P00024','Capuccino','4.00','100','CA0007'),
('P00025','Mocaccino','3.50','100','CA0007');

/* Listar registros de tabla PRODUCTO */
SELECT * FROM PRODUCTO;

/* Ver la estructura de la tabla VENDEDOR */
DESCRIBE VENDEDOR;

/* Listar registros tabla VENDEDOR */
INSERT INTO VENDEDOR
(CODVEND, NOMVEND, APEVEND, DNIVEND, CELVEND, DOMVEND, UBIVEND)
VALUES
('V00001','Jeferson','Mauricio Sanchez','73954835','918304550','Anex.San Jeronimo','140401'),
('V00002','Erick','Portuguez Zavala','72530589','928116200','Herbay alto','140404'),
('V00003','Maria','Guando Campos','76519749','930722103','Fundo el conde','140401');

/* Listar registros tabla VENDEDOR */
SELECT * FROM VENDEDOR;

/* Listando registros de las tablas maestras: UBIGEO, PRODUCTO, CLIENTE, VENDEDOR, CATEGORIA */
SELECT * FROM UBIGEO;
SELECT * FROM PRODUCTO; 
SELECT * FROM CLIENTE;
SELECT * FROM VENDEDOR; 
SELECT * FROM CATEGORIA;

/* Ver estructura VENTA */
DESCRIBE VENTA;

/* Ver formato de fecha en el servidor */
SELECT CURDATE();

/* Insertar la primera VENTA (1) */
INSERT INTO VENTA
(FECVENT, CODVEND, CODCLI, TIPVENT)
VALUES
('2021/12/21','V00002','CL0001','D');

/* Listar registros tabla VENTA */
SELECT * FROM VENTA;

/* Ver estructura de tabla VENTA_DETALLE */
DESCRIBE VENTA_DETALLE;

/* Insertar detalles de la VENTA (1) */
INSERT INTO VENTA_DETALLE
(IDVENT, CODPRO, CANTVENTDET)
VALUES
(1, 'P00001', 5);

/* Listar registros VENTA_DETALLE */
SELECT * FROM VENTA_DETALLE;

/* Listar VENTA (1) con sus respectivos DETALLES */
SELECT * FROM VENTA WHERE IDVENT = 1;
SELECT * FROM VENTA_DETALLE WHERE IDVENT = 1;

/* Insertar la segunda VENTA (2) */
INSERT INTO VENTA
(FECVENT, CODVEND, CODCLI, TIPVENT)
VALUES
('2021/07/11','V00001','CL0003','R');

/* Listar registros tabla VENTA */
SELECT * FROM VENTA;

/* Ver estructura de tabla VENTA_DETALLE */
DESCRIBE VENTA_DETALLE;

/* Insertar detalles de la VENTA (2) */
INSERT INTO VENTA_DETALLE
(IDVENT, CODPRO, CANTVENTDET)
VALUES
(2, 'P00003', 7),
(2, 'P00005', 3),
(2, 'P00007', 3),
(2, 'P00002', 6);

/* Listar registros tabla VENTA_DETALLE */
SELECT * FROM VENTA_DETALLE;

/* Listar VENTA (2) con sus respectivos DETALLES */
SELECT * FROM VENTA WHERE IDVENT = 2;
SELECT * FROM VENTA_DETALLE WHERE IDVENT = 2;

/* Insertar la tercera VENTA (3) */
INSERT INTO VENTA
(FECVENT, CODVEND, CODCLI, TIPVENT)
VALUES
('2021/03/05','V00001','CL0004','D');

/* Listar registros tabla VENTA */
SELECT * FROM VENTA;

/* Ver estructura de tabla VENTA_DETALLE */
DESCRIBE VENTA_DETALLE;

/* Insertar detalles de la VENTA (3) */
INSERT INTO VENTA_DETALLE
(IDVENT, CODPRO, CANTVENTDET)
VALUES
(3, 'P00004', 10),
(3, 'P00006', 5),
(3, 'P00001', 4),
(3, 'P00008', 6),
(3, 'P00009', 3),
(3, 'P00005', 8);

/* Listar VENTA (3) con sus respectivos DETALLES */
SELECT * FROM VENTA WHERE IDVENT = 3;
SELECT * FROM VENTA_DETALLE WHERE IDVENT = 3;

/* Listar registros de tablas MAESTRAS */
SELECT * FROM UBIGEO;
SELECT * FROM CLIENTE;
SELECT * FROM VENDEDOR;
SELECT * FROM CATEGORIA;

/* Listar registros de tablas TRANSACCIONALES */
SELECT * FROM VENTA;
SELECT * FROM VENTA_DETALLE;

/* Ver estructura de la tabla CLIENTE */
DESCRIBE CLIENTE;

/* Agregar columna ESTCLI estado del cliente A (activo) / I (inactivo) */
ALTER TABLE CLIENTE
	ADD ESTCLI CHAR(1) DEFAULT('A'); 
    
/* Listar registros tabla CLIENTE */
SELECT * FROM CLIENTE;

/* Listar registros de tabla VENDEDOR */
SELECT * FROM VENDEDOR;

/* Ver estructura tabla VENDEDOR */
DESCRIBE VENDEDOR;

/* Agregar campo ESTVEND donde A es activo / I es inactivo */
ALTER TABLE VENDEDOR
	ADD ESTVEND CHAR(1) DEFAULT('A'); -- A (activo) I (inactivo)

/* Agregar campo ESTVEND donde A es activo / I es inactivo */
ALTER TABLE VENDEDOR
	ADD ESTVEND CHAR(1) DEFAULT('A'); -- A (activo) I (inactivo)

/* Listar registros de tabla VENDEDOR */
SELECT * FROM VENDEDOR;

/* Listar registros tabla VENTA */
SELECT * FROM VENTA;

/* Eliminar la columna FECVENT */
ALTER TABLE VENTA
	DROP COLUMN FECVENT;

/* Listar registros tabla VENTA */
SELECT * FROM VENTA;

/* Agregar campo en VENTA que permita capturar fecha y hora del servidor de base de datos */
ALTER TABLE VENTA
	ADD FECVENT DATETIME DEFAULT CURRENT_TIMESTAMP(); -- Agregar FECVENT (Fecha y hora por default)

/* Listar registros tabla VENTA */
SELECT * FROM VENTA;

/* Listar registros tabla VENTA */
SELECT * FROM VENTA;

/* Insertar la tercera VENTA (4) */
INSERT INTO VENTA
(CODVEND, CODCLI, TIPVENT)
VALUES
('V00003','CL0006','R');

/* Listar registros tabla VENTA */
SELECT * FROM VENTA;

/* Insertar detalles de la VENTA (4) */
INSERT INTO VENTA_DETALLE
(IDVENT, CODPRO, CANTVENTDET)
VALUES
(4, 'P00001', 10),
(4, 'P00009', 5),
(4, 'P00007', 4);

/* Listar VENTA (4) con sus respectivos DETALLES */
SELECT * FROM VENTA WHERE IDVENT = 4;
SELECT * FROM VENTA_DETALLE WHERE IDVENT = 4;

/* Crear tabla Pedido */
CREATE TABLE PEDIDO
(
     IDPED int AUTO_INCREMENT,
     USERPED varchar(80),
     EMAUSPED varchar(80),
     CELUSPED char(9),
     PRODPED varchar(80),
     MSGPED   varchar(250),
     PRIMARY KEY (IDPED)
);

/* Insertar registros */
INSERT INTO PEDIDO
(USERPED, EMAUSPED, CELUSPED, PRODPED, MSGPED)
VALUES
('Erick Zavala', 'Erick.zavala@outlook.com', '974815236', 'leche gloria', 'Por favor enviar a la dirección herbay alto, San Vicente de Cañete'),
('Maria guando', 'Maria.guando@gmail.com', '981526321', 'Mantequilla', 'Necesito 4');

/* Listar los registros de la tabla PEDIDO */
SELECT * FROM PEDIDO;
