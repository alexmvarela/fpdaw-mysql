CREATE DATABASE tienda_db;
USE tienda_db;

-- Crear la tabla familia
-- Contiene las familias a las que pertenecen los productos
CREATE TABLE familia (
    cod_familia NUMERIC(3) PRIMARY KEY,
    deno_familia VARCHAR(50) UNIQUE NOT NULL
);

-- Crear la tabla producto
-- Contiene información general sobre los productos que distribuye la empresa a las tiendas
CREATE TABLE producto (
    cod_producto NUMERIC(5) PRIMARY KEY,
    deno_producto VARCHAR(20) NOT NULL,
    descripcion VARCHAR(100),
    precio_base NUMERIC(8 , 2 ) NOT NULL CHECK (precio_base > 0),
    porc_reposicion NUMERIC(3) CHECK (porc_reposicion > 0),
    unidades_minimas NUMERIC(4) NOT NULL CHECK (unidades_minimas > 0),
	cod_familia NUMERIC(3) NOT NULL,
    CONSTRAINT producto_codfamilia_fk FOREIGN KEY (cod_familia) REFERENCES familia (cod_familia)   
);

-- Crear la tabla tienda
-- Contiene información básica sobre las tiendas que distribuyen los productos
CREATE TABLE tienda (
    cod_tienda NUMERIC(3) PRIMARY KEY,
    deno_tienda VARCHAR(20) NOT NULL,
    telefono VARCHAR(11),
    cod_postal VARCHAR(5) NOT NULL,
    provincia VARCHAR(5) NOT NULL
);

-- Crear la tabla stock
--  Contiene para cada tienda el número de unidades disponibles de cada producto
CREATE TABLE stock (
    cod_tienda NUMERIC(3) NOT NULL,
    cod_producto NUMERIC(5) NOT NULL,
    unidades NUMERIC(6) NOT NULL CHECK (unidades > 0),
    PRIMARY KEY (cod_tienda, cod_producto),
    CONSTRAINT stock_codtienda_fk FOREIGN KEY (cod_tienda) REFERENCES tienda (cod_tienda),
    CONSTRAINT stock_codproducto_fk FOREIGN KEY (cod_producto) REFERENCES producto (cod_producto)
);