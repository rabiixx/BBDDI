/* Practica 2 */

/* Ejercicio 1 */
SELECT COUNT (*) AS NUMASIGNATURAS
FROM ASIGNATURAS

/* Ejercicio 2 */
SELECT COUNT (*) AS NUMANUALES
FROM ASIGNATURAS A
WHERE A.ANUALIDAD = 'A'

/* Ejercicio 3 */
SELECT MAX(ALUMNOS) AS MAXALUMNOS
FROM ASIGNATURAS

/* Ejercicio 4 */
SELECT ROUND(AVG(ALUMNOS), 4) AS MEDIAALUMNOS
FROM ASIGNATURAS

/* Ejercicio 5 */
SELECT SUM(ALUMNOS)
FROM ASIGNATURAS

/* Ejercicio 6 */
SELECT PROFESOR, COUNT (*) DOCENCIA
FROM DOCENCIA
GROUP BY PROFESOR
ORDER BY PROFESOR


/* Ejercicio 7 */
SELECT PROFESOR, COUNT (*) DOCENCIA
FROM DOCENCIA
GROUP BY PROFESOR
HAVING COUNT (*) > 10
ORDER BY PROFESOR

/* Ejercicio 8: si no se pone la condicion del where cuenta las horas totatel de cada asignatura */
SELECT SUM(A.HORAS_TEORIA) AS TOTALHORASTEORIA, SUM(A.HORAS_PRACTICA) AS TOTALHORASPRACTICA 
FROM ASIGNATURAS A, DOCENCIA D
WHERE A.SIGLAS = D.SIGLAS

/* Ejercicio 9 */
SELECT SUM(A.HORAS_TEORIA) AS TOTALHORASTEORIA, SUM(A.HORAS_PRACTICA) AS TOTALHORASPRACTICA 
FROM ASIGNATURAS A, DOCENCIA D
WHERE (A.SIGLAS = D.SIGLAS) AND (A.ANUALIDAD = 'A') AND (D.PROFESOR > 30) 


/* Ejercicio 10 */
SELECT COUNT (*) ASIGNATURAS, ROUND(AVG(A.HORAS_PRACTICA), 4) AS MEDIAHORASPRACTICAS 
FROM ASIGNATURAS A, DOCENCIA D
WHERE (A.ANUALIDAD = 'A') AND (D.PROFESOR > 30) AND (A.SIGLAS = D.SIGLAS)

/* Ejercicio 11 */
SELECT MAX(CAPACIDAD)
FROM LOCALES

/* Ejercicio 12 */
SELECT MAX(CAPACIDAD) AS MAXCAPACIDAD 
FROM LOCALES L, DOCENCIA D, ASIGNATURAS A
WHERE (A.HORAS_PRACTICA > 0) AND (A.SIGLAS = D.SIGLAS) AND (D.LOCAL = L.CODIGO)

/* Ejercicio 13 */
SELECT COUNT (*) LOCALES
FROM LOCALES L
WHERE (L.SITUACION LIKE 'Planta Primera%')

/* Ejercicio 14 */
SELECT L.SITUACION AS SITUACION, COUNT (*) LOCALES 
FROM LOCALES L
GROUP BY L.SITUACION
ORDER BY L.SITUACION

/* Ejercicio 15 */
SELECT D.DIA, MIN(D.HORA) AS PRIMERA_HORA, MAX(D.HORA) AS ULTIMA_HORA
FROM DOCENCIA D
GROUP BY D.DIA
ORDER BY D.DIA

/* Ejercicio 16 */
SELECT A.ANUALIDAD, COUNT (*) NUM_ASIG, AVG(A.CREDITOS), MIN(A.ALUMNOS) 
FROM ASIGNATURAS A
WHERE (A.ANUALIDAD NOT LIKE 'A') OR (A.ANUALIDAD IS NULL)
GROUP BY A.ANUALIDAD
ORDER BY A.ANUALIDAD

/* Ejercicio 17 */
SELECT A.SIGLAS, A.NOMBRE
FROM ASIGNATURAS A, DOCENCIA D
WHERE (A.SIGLAS = D.SIGLAS)
HAVING COUNT (D.ID) BETWEEN 10 AND 20
GROUP BY A.SIGLAS, A.NOMBRE
ORDER BY A.NOMBRE

/* Ejercicio 18 */
SELECT D.HORA, COUNT (D.DIA) AS NUM_DIAS
FROM  ASIGNATURAS A, DOCENCIA D 
WHERE (A.SIGLAS = D.SIGLAS) AND (A.NOMBRE = 'Algebra')
HAVING COUNT (D.DIA) > 1
GROUP BY D.HORA
ORDER BY NUM_DIAS DESC, D.HORA ASC

/* Ejercicio 19 */
SELECT A.CURSO, MIN(A.ALUMNOS), MAX(A.ALUMNOS), ROUND(AVG(A.ALUMNOS), 4)
FROM ASIGNATURAS A, DOCENCIA D
WHERE (A.SIGLAS = D.SIGLAS)
GROUP BY A.CURSO

/* Ejercicio 20 */
SELECT L.NOMBRE, L.EDIFICIO, MAX(D.CURSO)
FROM LOCALES L, DOCENCIA D
WHERE (D.LOCAL = L.CODIGO)
GROUP BY L.NOMBRE, L.EDIFICIO, D.CURSO
ORDER BY L.NOMBRE

/* Ejercicio 21 */
SELECT A.NOMBRE, D.DIA, COUNT (DISTINCT P.CODIGO) AS PROFESORES_NO_TIEMPO_COMPLETO
FROM  ASIGNATURAS A, DOCENCIA D, PROFESORES P
WHERE (D.SIGLAS = A.SIGLAS) AND (P.CODIGO = D.PROFESOR) AND (P.DEDICACION NOT LIKE '%TC%')
HAVING COUNT (DISTINCT CODIGO) > 1
GROUP BY A.NOMBRE, D.DIA 

/*Ejercicio 22 */
SELECT A.CURSO, A.NOMBRE, A.SIGLAS, SUM(A.GRUPOS_PRACTICA), SUM(A.GRUPOS_TEORIA)
FROM ASIGNATURAS A
WHERE (A.CREDITOS > 9) AND (A.GRUPOS_PRACTICA > 0) AND (A.GRUPOS_TEORIA > 0)
GROUP BY A.CURSO, A.NOMBRE, A.SIGLAS
ORDER BY A.CURSO

/* Ejercicio 23 */
SELECT A.NOMBRE, A.SIGLAS, AVG(A.ALUMNOS)/COUNT(*)
FROM ASIGNATURAS A, DOCENCIA D 
WHERE (D.SIGLAS = A.SIGLAS)
GROUP BY A.NOMBRE, A.SIGLAS

/* Ejercicio 24 */
SELECT G.NOMBRE, COUNT (DISTINCT D.PROFESOR) AS DISTINTOS_PROFES
FROM DOCENCIA D, GRUPOS G
WHERE (D.CURSO = G.CURSO) AND (D.CLASE = G.CLASE) AND (D.GRUPO = G.CODIGO)
GROUP BY G.NOMBRE

/* Ejercicio 25: grupos que solo tiene un profesor */
SELECT G.NOMBRE
FROM GRUPOS G, DOCENCIA D
WHERE (D.CURSO = G.CURSO) AND (D.CLASE = G.CLASE) AND (D.GRUPO = G.CODIGO)
GROUP BY G.NOMBRE
HAVING COUNT (DISTINCT D.PROFESOR) = 1
 
/* Ejercicio 26 */
SELECT P.APELLIDO1, P.APELLIDO2, P.NOMBRE_PILA, COUNT (DISTINCT D.SIGLAS)
FROM PROFESORES P, DOCENCIA D, ASIGNATURAS A
WHERE (P.CODIGO = D.PROFESOR) AND (D.SIGLAS = A.SIGLAS)
GROUP BY P.APELLIDO1, P.APELLIDO2, P.NOMBRE_PILA
ORDER BY P.APELLIDO1, P.APELLIDO2, P.NOMBRE_PILA

/* Ejercicio 27 */
SELECT P.APELLIDO1, P.APELLIDO2, P.NOMBRE_PILA 
FROM PROFESORES P, DOCENCIA D, ASIGNATURAS A
WHERE (P.CODIGO = D.PROFESOR) AND (D.SIGLAS = A.SIGLAS)
HAVING COUNT (DISTINCT D.SIGLAS) > 1
GROUP BY P.APELLIDO1, P.APELLIDO2, P.NOMBRE_PILA
ORDER BY P.APELLIDO1, P.APELLIDO2, P.NOMBRE_PILA

/* Ejercicio 28 */
SELECT L.NOMBRE, L.EDIFICIO, (L.CAPACIDAD - (A.ALUMNOS/COUNT(*))) AS DIF_ALUM_X_CLASE, A.NOMBRE, COUNT (*) AS CLASES
FROM LOCALES L, ASIGNATURAS A, DOCENCIA D
WHERE (A.SIGLAS = D.SIGLAS) AND (D.LOCAL = L.CODIGO) AND (A.HORAS_PRACTICA > 0)
GROUP BY L.NOMBRE, L.EDIFICIO, A.NOMBRE, L.CAPACIDAD, A.ALUMNOS
HAVING (L.CAPACIDAD - (A.ALUMNOS/COUNT(*))) < 1
ORDER BY L.NOMBRE

/* COUNT(*): devuelve el numero de docencias de la asignatura A en el local L */
