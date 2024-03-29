CREATE TABLE USUARIOS(
    COD_USER VARCHAR(10),
    NOMBRE VARCHAR(15),
    APELLIDO VARCHAR(15) NOT NULL,
    SEXO VARCHAR(1) DEFAULT 'M',
    EDAD NUMBER(3),
    CONSTRAINT PK_USER PRIMARY KEY (COD_USER),
    CONSTRAINT CH_SEXO CHECK (SEXO IN ('M', 'F')),
    CONSTRAINT CH_MIN_EDAD CHECK (EDAD > 14)
);

CREATE TABLE CLASES(
    TIPO VARCHAR(1),
    TIEMPO NUMBER(5),
    CONSTRAINT PK_CLASES PRIMARY KEY (TIPO),
    CONSTRAINT CH_TIPO CHECK (TIPO IN ('A', 'B', 'C', 'D', 'E')),
    CONSTRAINT CH_TIEMPO CHECK (TIEMPO IN (7, 30, 90, 180, 365))
);   

CREATE TABLE LIBROS(
    ISBN VARCHAR(10),
    TITULO VARCHAR(35) NOT NULL,
    AUTOR VARCHAR(15),
    EDITORIAL VARCHAR(15),
    TIPO VARCHAR(1),
    CONSTRAINT PK_LIBROS PRIMARY KEY (ISBN),
    CONSTRAINT UNI_LIBROS UNIQUE (TITULO),
    CONSTRAINT FK_CLASES FOREIGN KEY (TIPO) REFERENCES CLASES (TIPO)
   -- ON DELETE CASCADE
);
    

CREATE TABLE PRESTAMOS(
    --COD_PRESTAMO VARCHAR(10),
    COD_LIBRO VARCHAR(10),
    COD_USER VARCHAR(10),
    IN_FECHA DATE,
    OUT_FECHA DATE,
    CONSTRAINT PK_PRESTAMOS PRIMARY KEY (COD_LIBRO, COD_USER, IN_FECHA),
    CONSTRAINT FK_LIBROS FOREIGN KEY (COD_LIBRO) REFERENCES LIBROS (ISBN),
    CONSTRAINT FK_USUARIOS FOREIGN KEY (COD_USER) REFERENCES USUARIOS (COD_USER),
    CONSTRAINT CH_FECHA CHECK (OUT_FECHA > IN_FECHA)
    --ON DELETE CASCADE
);
    
/* PRESTAMOS DATA */
INSERT INTO CLASES VALUES ('A', 7);
INSERT INTO CLASES VALUES ('B', 30);
INSERT INTO CLASES VALUES ('C', 90);
INSERT INTO CLASES VALUES ('D', 180);
INSERT INTO CLASES VALUES ('E', 365);

/* Ejercicio 1 */
INSERT INTO USUARIOS (COD_USER, NOMBRE, APELLIDO, EDAD) VALUES ('1', 'Antonio', 'Gomez', 20);
INSERT INTO LIBROS (TITULO, ISBN) VALUES ('InfoSec', '4A');
INSERT INTO PRESTAMOS (COD_LIBRO, COD_USER, IN_FECHA) VALUES ('4A', '1', '07-12-2019');

/* Ejercicio 2 */
INSERT INTO USUARIOS (COD_USER, NOMBRE, APELLIDO, EDAD)VALUES ('2', 'Jon', 'Alkorta', 10);
-->> ORA-02290: restricción de control (CHERIF121871.CH_MIN_EDAD) violada

/* Ejercicio 3 */
INSERT INTO LIBROS (TITULO, ISBN, EDITORIAL, TIPO) VALUES ('Ficheros y Bases de Datos 1', '1FBD', 'Anaya', 'A');
INSERT INTO LIBROS (TITULO, ISBN, EDITORIAL, TIPO) VALUES ('Ficheros y Bases de Datos 2', '2FBD', 'Anaya', 'A');
INSERT INTO LIBROS (TITULO, ISBN, EDITORIAL, TIPO) VALUES ('Ficheros y Bases de Datos 3', '3FBD', 'Anaya', 'A');

/* Ejercicio 4 */
INSERT INTO USUARIOS (COD_USER, NOMBRE, APELLIDO, EDAD) VALUES ('2', 'Rosa', 'Perez', 45);
INSERT INTO USUARIOS (COD_USER, NOMBRE, APELLIDO, EDAD) VALUES ('3', 'Lucas', 'Perez', 27);

INSERT INTO PRESTAMOS VALUES ('1FBD', '1', '27-10-2017', '11-11-2017');
INSERT INTO PRESTAMOS VALUES ('2FBD', '2', '27-10-2017', '11-11-2017');
INSERT INTO PRESTAMOS VALUES ('3FBD', '3', '27-10-2017', '11-11-2017');

/* Ejercicio 4 */
INSERT INTO USUARIOS (COD_USER, NOMBRE, APELLIDO, EDAD) VALUES ('50', 'Dia', 'Sexto', 29);
INSERT INTO PRESTAMOS VALUES ('4A', '50', '07-12-2019');

/* Ejercicio 5 */
-- El usuario 50 no existe
-- Fecha inicio?

/* Ejercicio 6 */
DELETE FROM PRESTAMOS 
WHERE OUT_FECHA < '01-08-2014';

/* Ejercicio 7 */
DELETE FROM USUARIOS 
WHERE (NOMBRE = 'Antonio') AND (APELLIDO = 'Gomez'); 

/* Ejercicio 9 */
DELETE FROM PRESTAMOS 
WHERE OUT_FECHA
(SELECT * FROM LIBROS)


/* VARCHAR2: NULL AND EMPTY STRING ARE SAME */
/* VARCHAR: DISTINGUISH BETWEEN NULL AND EMPTY STRING */