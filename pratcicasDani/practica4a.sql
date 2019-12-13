CREATE TABLE USUARIO(
NOMBRE VARCHAR2(20), 
APELLIDO VARCHAR2(20) NOT NULL,
SEXO VARCHAR2(1),
EDAD NUMBER(3), 
NUMERO_USUARIO VARCHAR2(10) NOT NULL,

CONSTRAINT NUMERO_USUARIO1 PRIMARY KEY (NUMERO_USUARIO),
CONSTRAINT MAYOR_15_A�OS CHECK (EDAD>15)
);

CREATE TABLE LIBROS(
TITULO VARCHAR2(20) NOT NULL,
AUTOR VARCHAR2(20),
EDITORIAL VARCHAR2(20),
ISBN VARCHAR2(20) NOT NULL,

CONSTRAINT TITULO1 UNIQUE (TITULO),
CONSTRAINT ISBN1 PRIMARY KEY (ISBN)
);

CREATE TABLE CLASES_LIBROS(--�?S


);

CREATE TABLE PRESTAMO(
FECHA_PRESTAMO DATE DEFAULT SYSDATE,
FECHA_DEVOLUCION DATE DEFAULT SYSDATE,

CONSTRAINT PRESTAMO1 FOREIGN KEY (FECHA_PRESTAMO) REFERENCES USUARIO (NUMERO_USUARIO),
--PARA REGISTRARSE SE NECESITA COGER UN LIBRO(ESTA BIEN??)
CONSTRAINT CALENDARIO CHECK (FECHA_PRESTAMO<FECHA_DEVOLUCION)
);