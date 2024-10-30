CREATE DATABASE Alejandro;
USE Alejandro;

CREATE TABLE Martinez (
    id INT,
    nombre VARCHAR(50),
    fecha_nacimiento DATE,
    PRIMARY KEY (id, nombre)  
);

CREATE TABLE Varela (
    identificador BIGINT,
    direccion TEXT,
    salario DECIMAL(10, 2),
    CONSTRAINT pk_identificador PRIMARY KEY (identificador) 
);