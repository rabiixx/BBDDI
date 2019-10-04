REM PROCESO DE CREACIÓN
create table grupos 
  (
    curso char(1) not null,
    clase char(1) not null,
    codigo char(3) not null,
    nombre char(30),
    constraint PK_GRUPOS primary key (curso,clase,codigo)
   );
REM FINALIZADO PROCESO DE CREACIÓN

REM PROCESO DE INSERCIÓN
INSERT INTO GRUPOS VALUES ('1','T','A','1 Teoria Sistemas - Mananas');                      
INSERT INTO GRUPOS VALUES ('1','T','B','1 Teoria Gestion - Mananas');                      
INSERT INTO GRUPOS VALUES ('1','T','C','1 Teoria Sistemas - Tardes');                  
INSERT INTO GRUPOS VALUES ('1','T','D','1 Teoria Gestion - Tardes');                      
INSERT INTO GRUPOS VALUES ('1','T','CD','1 Teoria Comun - Tardes');                     
INSERT INTO GRUPOS VALUES ('2','T','A','2 Teoria Sistemas');                                                     
INSERT INTO GRUPOS VALUES ('2','T','B','2 Teoria Gestion');                            
INSERT INTO GRUPOS VALUES ('3','T','A','3 Teoria Sistemas');                               
INSERT INTO GRUPOS VALUES ('3','T','B','3 Teoria Gestion');                                 
INSERT INTO GRUPOS VALUES ('1','P','G01','1 Practicas 1');                            
INSERT INTO GRUPOS VALUES ('1','P','G02','1 Practicas 2');                               
INSERT INTO GRUPOS VALUES ('1','P','G03','1 Practicas 3');                            
INSERT INTO GRUPOS VALUES ('1','P','G04','1 Practicas 4');                            
INSERT INTO GRUPOS VALUES ('1','P','G05','1 Practicas 5');                          
INSERT INTO GRUPOS VALUES ('1','P','G06','1 Practicas 6');
INSERT INTO GRUPOS VALUES ('1','P','G07','1 Practicas 7');
INSERT INTO GRUPOS VALUES ('1','P','G08','1 Practicas 8');
INSERT INTO GRUPOS VALUES ('1','P','G09','1 Practicas 9');
INSERT INTO GRUPOS VALUES ('1','P','G10','1 Practicas 10');
INSERT INTO GRUPOS VALUES ('2','P','G01','2 Practicas 1');
INSERT INTO GRUPOS VALUES ('2','P','G02','2 Practicas 2');
INSERT INTO GRUPOS VALUES ('2','P','G03','2 Practicas 3');
INSERT INTO GRUPOS VALUES ('2','P','G04','2 Practicas 4');
INSERT INTO GRUPOS VALUES ('2','P','G05','2 Practicas 5');
INSERT INTO GRUPOS VALUES ('2','P','G06','2 Practicas 6');
INSERT INTO GRUPOS VALUES ('3','P','G01','3 Practicas 1');
INSERT INTO GRUPOS VALUES ('3','P','G02','3 Practicas 2');
INSERT INTO GRUPOS VALUES ('3','P','G03','3 Practicas 3');
INSERT INTO GRUPOS VALUES ('3','P','G04','3 Practicas 4');
INSERT INTO GRUPOS VALUES ('2','T','-','2 Teoria Comun');
INSERT INTO GRUPOS VALUES ('3','T','-','3 Teoria Comun');
INSERT INTO GRUPOS VALUES ('2','T','B1','2 Teoria Gestion 1');
INSERT INTO GRUPOS VALUES ('2','T','B2','2 Teoria Gestion 2');
INSERT INTO GRUPOS VALUES ('2','P','G07','2 Practicas 7');
INSERT INTO GRUPOS VALUES ('3','P','G05','3 Practicas 5');
INSERT INTO GRUPOS VALUES ('3','P','G06','3 Practicas 6');
REM FINALIZADO PROCESO DE INSERCIÓN

REM delete * from grupos;
REM drop table grupos;


