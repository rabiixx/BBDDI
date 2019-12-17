
create table departamento 
  (
    dept char(2) not null,
    dnombre varchar(40),
    budget number,
    constraint PK_DEP primary key(dept)	
  );

create table empleado 
  (
    empno char(2) not null,
    enombre varchar(55),
    dept char(2) not null,
    salario number,
    constraint PK_EMP primary key(empno),
    constraint FK_DEP foreign key(dept) references departamento(dept)	
  );

create table proyecto 
  (
    nproy smallint not null,
    pnombre varchar(20),
    horaspr number,
    fecini date,
    constraint PK_PROY primary key(nproy)
  );

create table control 
  (
    empno char(2) not null,
    nproy smallint not null,
    horastr number,
    constraint PK_CONT primary key(empno,nproy),
    constraint FK_EMP foreign key(empno) references empleado(empno),
    constraint FK_NPROY foreign key(nproy) references proyecto(nproy)
  );

INSERT INTO DEPARTAMENTO VALUES ('D1','Marketing',10);
INSERT INTO DEPARTAMENTO VALUES ('D2','Contabilidad',12);
INSERT INTO DEPARTAMENTO VALUES ('D3','REcursos Humanos',5);

INSERT INTO empleado VALUES ('E1','López','D2',500);
INSERT INTO empleado VALUES ('E2','Goñi','D3',700);
INSERT INTO empleado VALUES ('E3','Aramburu','D2',350);
INSERT INTO empleado VALUES ('E4','Arraras','D1',1000);

INSERT INTO proyecto VALUES (1,'Albaranes',300,'20/05/2002');
INSERT INTO proyecto VALUES (2,'Acuse de pedidos',220,'05/01/2003');
INSERT INTO proyecto VALUES (3,'FActuras',90,'13/11/2002');

INSERT INTO control VALUES ('E1',1,15);
INSERT INTO control VALUES ('E1',3,30);
INSERT INTO control VALUES ('E2',2,20);
INSERT INTO control VALUES ('E3',1,50);

commit;


