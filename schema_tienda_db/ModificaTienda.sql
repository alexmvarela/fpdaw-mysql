USE tienda_db;

/*
Añadir a la tabla STOCK
Una columna de tipo fecha llamada FechaUltimaEntrada que por defecto tome el valor de la fecha actual.
Una columna llamada Beneficio que contendrá el tipo de porcentaje de beneficio que esa tienda aplica en ese producto. Se debe controlar que el valor que almacene sea 1,2, 3, 4 o 5.
*/
ALTER TABLE stock 
	ADD COLUMN fecha_ultima_entrada DATE DEFAULT (CURRENT_DATE),
    ADD COLUMN beneficio ENUM('1', '2', '3', '4', '5');

/*
En la tabla PRODUCTO
Eliminar de la tabla producto la columna Descripción.
Añadir una columna llamada perecedero que únicamente acepte los valores: S o N.
Modificar el tamaño de la columna Denoproducto a 50.
*/
ALTER TABLE producto
	DROP COLUMN descripcion,
    ADD COLUMN perecedero ENUM('S', 'N') NOT NULL,
    MODIFY COLUMN deno_producto VARCHAR(50) NOT NULL;
    
/*
En la tabla FAMILIA
Añadir una columna llamada IVA, que represente el porcentaje de IVA y únicamente pueda contener los valores 21,10,ó 4.
*/
ALTER TABLE familia 
	ADD COLUMN iva ENUM('21', '10', '4') NOT NULL;

/*
EN la tabla tienda
La empresa desea restringir el número de tiendas con las que trabaja, de forma que no pueda haber más de una tienda en una misma zona (la zona se identifica por el código postal).
Definir mediante DDL las restricciones necesarias para que se cumpla en el campo correspondiente.
*/
ALTER TABLE tienda
	ADD UNIQUE (cod_postal);
    
-- REnombra la tabla STOCK por PRODXTIENDAS
RENAME TABLE stock TO prodxtiendas;

-- Elimina la tabla FAMILIA y su contenido si lo tuviera.
ALTER TABLE producto DROP CONSTRAINT producto_codfamilia_fk;
DROP TABLE familia;