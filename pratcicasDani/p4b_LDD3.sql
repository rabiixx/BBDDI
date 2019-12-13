/*Ejercicio 1*/
SELECT *
FROM CLIENTE C
WHERE C.NOMBRE LIKE 'Naiara G�mez'
;

/*Ejercicio 2*/
SELECT COUNT(*) AS ORDENES_DE_VENTA
FROM CLIENTE C, ORDEN O
WHERE C.CODCLI=O.CODCLI AND C.NOMBRE LIKE 'Naiara G�mez'
;

/*Ejercicio 3*/
SELECT SUM(CO.UDS) AS UNIDADES_PEDIDAS
FROM CLIENTE C, ORDEN O, CONTIENE CO
WHERE C.CODCLI=O.CODCLI AND O.COD=CO.COD AND C.NOMBRE LIKE 'Naiara G�mez'
;

/*Ejercicio 4*/
SELECT SUM(CO.UDS_OUT) AS SERVIDAS
FROM CLIENTE C, ORDEN O, CONTIENE CO
WHERE  C.CODCLI=O.CODCLI AND O.COD=CO.COD  AND C.NOMBRE LIKE 'Naiara G�mez'
;

/*Ejercicio 5*/
SELECT SUM(CO.UDS)-SUM(CO.UDS_OUT) AS PENDIENTES
FROM CLIENTE C, ORDEN O, CONTIENE CO
WHERE  C.CODCLI=O.CODCLI AND O.COD=CO.COD  AND C.NOMBRE LIKE 'Naiara G�mez'
;

/*Ejercicio 6*/
SELECT C.NOMBRE, O.FECHA, O.FPAGO, O.COD
FROM CLIENTE C, ORDEN O, CONTIENE CO
WHERE  C.CODCLI=O.CODCLI AND O.COD=CO.COD AND CO.UDS_OUT>0
ORDER BY O.FECHA ASC
;

/*Ejercicio 7*/
SELECT C.NOMBRE, O.FECHA, O.FPAGO, O.COD, CO.CODART
FROM CLIENTE C, ORDEN O, CONTIENE CO
WHERE C.CODCLI=O.CODCLI AND O.COD=CO.COD AND CO.UDS-CO.UDS_OUT=0
;

/*Ejercicio 8*/
SELECT O.COD,C.NOMBRE/*FALTAN DATOS CLIENTE*/,O.FECHA,O.FECHA_ENV 
FROM CLIENTE C, ORDEN O
WHERE C.CODCLI=O.CODCLI AND O.FPAGO LIKE 'A'
;

/*Ejercicio 9*/
SELECT COUNT(COD)
FROM ORDEN
WHERE FECHA_ENV BETWEEN ' 01/12/2018 ' AND '01/03/2019' 
;

/*Ejercicio 10*/
SELECT DISTINCT CO.FECH_ENV, A1.DESCRIP ART_ENVIADO, A2.DESCRIP ART_PRODUCIDO
FROM CONTIENE CO, ARTICULO A1,ARTICULO A2, PRODUCE P
WHERE A1.CODART=CO.CODART AND A2.CODART = P.CODART AND CO.FECH_ENV=P.FECHA
;

/*Ejercicio 11*/
SELECT MAX(RED), MIN(RED)
FROM COLOR
;

/*Ejercicio 12*/
SELECT DISTINCT C.CODCLI, C.NOMBRE
FROM CLIENTE C, ORDEN O, CONTIENE CO, COLOR COL
WHERE C.CODCLI=O.CODCLI AND O.COD=CO.COD AND CO.RAL=COL.RAL AND COL.RED>100 AND COL.GREEN BETWEEN 100 AND 150 OR COL.BLUE<50
--GROUP BY C.CODCLI,C.NOMBRE
;












