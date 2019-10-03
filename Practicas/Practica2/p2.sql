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










