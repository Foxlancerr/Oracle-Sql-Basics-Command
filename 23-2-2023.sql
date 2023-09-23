
SQL*Plus: Release 10.2.0.1.0 - Production on Thu Feb 23 08:18:00 2023

Copyright (c) 1982, 2005, Oracle.  All rights reserved.

SQL> conn
Enter user-name: hr
Enter password:
ERROR:
ORA-01017: invalid username/password; logon denied


SQL> con
SP2-0042: unknown command "con" - rest of line ignored.
SQL>
SQL> conn
Enter user-name: hr
Enter password:
ERROR:
ORA-01017: invalid username/password; logon denied


SQL> conn
Enter user-name: sys as sysdba
Enter password:
Connected.
SQL> alter user hr identified by hr;

User altered.

SQL> conn
Enter user-name: hr
Enter password:
Connected.
SQL> create user asim identified by a;
create user asim identified by a
                               *
ERROR at line 1:
ORA-01031: insufficient privileges


SQL> conn
Enter user-name: sys as sysdba
Enter password:
Connected.
SQL> create user asim identified by a;

User created.

SQL> conn
Enter user-name: asim
Enter password:
ERROR:
ORA-01045: user ASIM lacks CREATE SESSION privilege; logon denied


Warning: You are no longer connected to ORACLE.
SQL> conn
Enter user-name: sys as sysdba
Enter password:
Connected.
SQL> grant create session to asim;

Grant succeeded.

SQL> conn
Enter user-name: asim
Enter password:
Connected.
SQL> create table mytable(
  2  rno number(3) primary key,
  3  name varchar2(30)
  4  );
create table mytable(
*
ERROR at line 1:
ORA-01031: insufficient privileges


SQL> conn
Enter user-name: sys as sysdba
Enter password:
Connected.
SQL> grant create table,select,insert,delete,update to asim;
grant create table,select,insert,delete,update to asim
                   *
ERROR at line 1:
ORA-01919: role 'SELECT' does not exist


SQL> grant create table,insert,delete,update to asim;
grant create table,insert,delete,update to asim
                   *
ERROR at line 1:
ORA-01919: role 'INSERT' does not exist


SQL> grant create table to asim;

Grant succeeded.

SQL> conn
Enter user-name: sys as sysdba
Enter password:
Connected.
SQL> create user sami identified by s;

User created.

SQL> grant create session to sami;

Grant succeeded.

SQL> grant create table to sami;

Grant succeeded.

SQL> conn
Enter user-name: hr
Enter password:
Connected.
SQL> select * from cat;

TABLE_NAME                     TABLE_TYPE
------------------------------ -----------
REGIONS                        TABLE
COUNTRIES                      TABLE
LOCATIONS                      TABLE
LOCATIONS_SEQ                  SEQUENCE
DEPARTMENTS                    TABLE
DEPARTMENTS_SEQ                SEQUENCE
JOBS                           TABLE
EMPLOYEES                      TABLE
EMPLOYEES_SEQ                  SEQUENCE
JOB_HISTORY                    TABLE
EMP_DETAILS_VIEW               VIEW

11 rows selected.

SQL> create table emp as select * from employees;

Table created.

SQL> alter table emp rename employee_id to eno;
alter table emp rename employee_id to eno
                       *
ERROR at line 1:
ORA-14155: missing PARTITION or SUBPARTITION keyword


SQL> alter table emp rename column employee_id to eno;

Table altered.

SQL> alter table emp add constraint pk_eno primary key(eno);

Table altered.

SQL> conn
Enter user-name: sys as sysdba
Enter password:
Connected.
SQL> grant select on hr.emp to sami;

Grant succeeded.

SQL> conn
Enter user-name: hr
Enter password:
Connected.
SQL> create table dept as select * from departments;

Table created.

SQL> conn
Enter user-name: sami
Enter password:
Connected.
SQL> select * from cat;

no rows selected

SQL> select * from hr.dept;
select * from hr.dept
                 *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> select * from hr.emp;

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
       100 Steven               King
SKING                     515.123.4567         17-JUN-87 AD_PRES         24000
                                     90

       101 Neena                Kochhar
NKOCHHAR                  515.123.4568         21-SEP-89 AD_VP           17000
                      100            90

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

       102 Lex                  De Haan
LDEHAAN                   515.123.4569         13-JAN-93 AD_VP           17000
                      100            90

       103 Alexander            Hunold
AHUNOLD                   590.423.4567         03-JAN-90 IT_PROG          9000

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      102            60

       104 Bruce                Ernst
BERNST                    590.423.4568         21-MAY-91 IT_PROG          6000
                      103            60

       105 David                Austin

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
DAUSTIN                   590.423.4569         25-JUN-97 IT_PROG          4800
                      103            60

       106 Valli                Pataballa
VPATABAL                  590.423.4560         05-FEB-98 IT_PROG          4800
                      103            60


       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
       107 Diana                Lorentz
DLORENTZ                  590.423.5567         07-FEB-99 IT_PROG          4200
                      103            60

       108 Nancy                Greenberg
NGREENBE                  515.124.4569         17-AUG-94 FI_MGR          12000
                      101           100

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

       109 Daniel               Faviet
DFAVIET                   515.124.4169         16-AUG-94 FI_ACCOUNT       9000
                      108           100

       110 John                 Chen
JCHEN                     515.124.4269         28-SEP-97 FI_ACCOUNT       8200

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      108           100

       111 Ismael               Sciarra
ISCIARRA                  515.124.4369         30-SEP-97 FI_ACCOUNT       7700
                      108           100

       112 Jose Manuel          Urman

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
JMURMAN                   515.124.4469         07-MAR-98 FI_ACCOUNT       7800
                      108           100

       113 Luis                 Popp
LPOPP                     515.124.4567         07-DEC-99 FI_ACCOUNT       6900
                      108           100


       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
       114 Den                  Raphaely
DRAPHEAL                  515.127.4561         07-DEC-94 PU_MAN          11000
                      100            30

       115 Alexander            Khoo
AKHOO                     515.127.4562         18-MAY-95 PU_CLERK         3100
                      114            30

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

       116 Shelli               Baida
SBAIDA                    515.127.4563         24-DEC-97 PU_CLERK         2900
                      114            30

       117 Sigal                Tobias
STOBIAS                   515.127.4564         24-JUL-97 PU_CLERK         2800

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      114            30

       118 Guy                  Himuro
GHIMURO                   515.127.4565         15-NOV-98 PU_CLERK         2600
                      114            30

       119 Karen                Colmenares

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
KCOLMENA                  515.127.4566         10-AUG-99 PU_CLERK         2500
                      114            30

       120 Matthew              Weiss
MWEISS                    650.123.1234         18-JUL-96 ST_MAN           8000
                      100            50


       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
       121 Adam                 Fripp
AFRIPP                    650.123.2234         10-APR-97 ST_MAN           8200
                      100            50

       122 Payam                Kaufling
PKAUFLIN                  650.123.3234         01-MAY-95 ST_MAN           7900
                      100            50

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

       123 Shanta               Vollman
SVOLLMAN                  650.123.4234         10-OCT-97 ST_MAN           6500
                      100            50

       124 Kevin                Mourgos
KMOURGOS                  650.123.5234         16-NOV-99 ST_MAN           5800

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      100            50

       125 Julia                Nayer
JNAYER                    650.124.1214         16-JUL-97 ST_CLERK         3200
                      120            50

       126 Irene                Mikkilineni

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
IMIKKILI                  650.124.1224         28-SEP-98 ST_CLERK         2700
                      120            50

       127 James                Landry
JLANDRY                   650.124.1334         14-JAN-99 ST_CLERK         2400
                      120            50


       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
       128 Steven               Markle
SMARKLE                   650.124.1434         08-MAR-00 ST_CLERK         2200
                      120            50

       129 Laura                Bissot
LBISSOT                   650.124.5234         20-AUG-97 ST_CLERK         3300
                      121            50

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

       130 Mozhe                Atkinson
MATKINSO                  650.124.6234         30-OCT-97 ST_CLERK         2800
                      121            50

       131 James                Marlow
JAMRLOW                   650.124.7234         16-FEB-97 ST_CLERK         2500

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      121            50

       132 TJ                   Olson
TJOLSON                   650.124.8234         10-APR-99 ST_CLERK         2100
                      121            50

       133 Jason                Mallin

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
JMALLIN                   650.127.1934         14-JUN-96 ST_CLERK         3300
                      122            50

       134 Michael              Rogers
MROGERS                   650.127.1834         26-AUG-98 ST_CLERK         2900
                      122            50


       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
       135 Ki                   Gee
KGEE                      650.127.1734         12-DEC-99 ST_CLERK         2400
                      122            50

       136 Hazel                Philtanker
HPHILTAN                  650.127.1634         06-FEB-00 ST_CLERK         2200
                      122            50

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

       137 Renske               Ladwig
RLADWIG                   650.121.1234         14-JUL-95 ST_CLERK         3600
                      123            50

       138 Stephen              Stiles
SSTILES                   650.121.2034         26-OCT-97 ST_CLERK         3200

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      123            50

       139 John                 Seo
JSEO                      650.121.2019         12-FEB-98 ST_CLERK         2700
                      123            50

       140 Joshua               Patel

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
JPATEL                    650.121.1834         06-APR-98 ST_CLERK         2500
                      123            50

       141 Trenna               Rajs
TRAJS                     650.121.8009         17-OCT-95 ST_CLERK         3500
                      124            50


       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
       142 Curtis               Davies
CDAVIES                   650.121.2994         29-JAN-97 ST_CLERK         3100
                      124            50

       143 Randall              Matos
RMATOS                    650.121.2874         15-MAR-98 ST_CLERK         2600
                      124            50

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

       144 Peter                Vargas
PVARGAS                   650.121.2004         09-JUL-98 ST_CLERK         2500
                      124            50

       145 John                 Russell
JRUSSEL                   011.44.1344.429268   01-OCT-96 SA_MAN          14000

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
            .4        100            80

       146 Karen                Partners
KPARTNER                  011.44.1344.467268   05-JAN-97 SA_MAN          13500
            .3        100            80

       147 Alberto              Errazuriz

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
AERRAZUR                  011.44.1344.429278   10-MAR-97 SA_MAN          12000
            .3        100            80

       148 Gerald               Cambrault
GCAMBRAU                  011.44.1344.619268   15-OCT-99 SA_MAN          11000
            .3        100            80


       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
       149 Eleni                Zlotkey
EZLOTKEY                  011.44.1344.429018   29-JAN-00 SA_MAN          10500
            .2        100            80

       150 Peter                Tucker
PTUCKER                   011.44.1344.129268   30-JAN-97 SA_REP          10000
            .3        145            80

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

       151 David                Bernstein
DBERNSTE                  011.44.1344.345268   24-MAR-97 SA_REP           9500
           .25        145            80

       152 Peter                Hall
PHALL                     011.44.1344.478968   20-AUG-97 SA_REP           9000

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
           .25        145            80

       153 Christopher          Olsen
COLSEN                    011.44.1344.498718   30-MAR-98 SA_REP           8000
            .2        145            80

       154 Nanette              Cambrault

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
NCAMBRAU                  011.44.1344.987668   09-DEC-98 SA_REP           7500
            .2        145            80

       155 Oliver               Tuvault
OTUVAULT                  011.44.1344.486508   23-NOV-99 SA_REP           7000
           .15        145            80


       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
       156 Janette              King
JKING                     011.44.1345.429268   30-JAN-96 SA_REP          10000
           .35        146            80

       157 Patrick              Sully
PSULLY                    011.44.1345.929268   04-MAR-96 SA_REP           9500
           .35        146            80

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

       158 Allan                McEwen
AMCEWEN                   011.44.1345.829268   01-AUG-96 SA_REP           9000
           .35        146            80

       159 Lindsey              Smith
LSMITH                    011.44.1345.729268   10-MAR-97 SA_REP           8000

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
            .3        146            80

       160 Louise               Doran
LDORAN                    011.44.1345.629268   15-DEC-97 SA_REP           7500
            .3        146            80

       161 Sarath               Sewall

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
SSEWALL                   011.44.1345.529268   03-NOV-98 SA_REP           7000
           .25        146            80

       162 Clara                Vishney
CVISHNEY                  011.44.1346.129268   11-NOV-97 SA_REP          10500
           .25        147            80


       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
       163 Danielle             Greene
DGREENE                   011.44.1346.229268   19-MAR-99 SA_REP           9500
           .15        147            80

       164 Mattea               Marvins
MMARVINS                  011.44.1346.329268   24-JAN-00 SA_REP           7200
            .1        147            80

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

       165 David                Lee
DLEE                      011.44.1346.529268   23-FEB-00 SA_REP           6800
            .1        147            80

       166 Sundar               Ande
SANDE                     011.44.1346.629268   24-MAR-00 SA_REP           6400

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
            .1        147            80

       167 Amit                 Banda
ABANDA                    011.44.1346.729268   21-APR-00 SA_REP           6200
            .1        147            80

       168 Lisa                 Ozer

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
LOZER                     011.44.1343.929268   11-MAR-97 SA_REP          11500
           .25        148            80

       169 Harrison             Bloom
HBLOOM                    011.44.1343.829268   23-MAR-98 SA_REP          10000
            .2        148            80


       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
       170 Tayler               Fox
TFOX                      011.44.1343.729268   24-JAN-98 SA_REP           9600
            .2        148            80

       171 William              Smith
WSMITH                    011.44.1343.629268   23-FEB-99 SA_REP           7400
           .15        148            80

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

       172 Elizabeth            Bates
EBATES                    011.44.1343.529268   24-MAR-99 SA_REP           7300
           .15        148            80

       173 Sundita              Kumar
SKUMAR                    011.44.1343.329268   21-APR-00 SA_REP           6100

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
            .1        148            80

       174 Ellen                Abel
EABEL                     011.44.1644.429267   11-MAY-96 SA_REP          11000
            .3        149            80

       175 Alyssa               Hutton

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
AHUTTON                   011.44.1644.429266   19-MAR-97 SA_REP           8800
           .25        149            80

       176 Jonathon             Taylor
JTAYLOR                   011.44.1644.429265   24-MAR-98 SA_REP           8600
            .2        149            80


       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
       177 Jack                 Livingston
JLIVINGS                  011.44.1644.429264   23-APR-98 SA_REP           8400
            .2        149            80

       178 Kimberely            Grant
KGRANT                    011.44.1644.429263   24-MAY-99 SA_REP           7000
           .15        149

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

       179 Charles              Johnson
CJOHNSON                  011.44.1644.429262   04-JAN-00 SA_REP           6200
            .1        149            80

       180 Winston              Taylor
WTAYLOR                   650.507.9876         24-JAN-98 SH_CLERK         3200

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      120            50

       181 Jean                 Fleaur
JFLEAUR                   650.507.9877         23-FEB-98 SH_CLERK         3100
                      120            50

       182 Martha               Sullivan

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
MSULLIVA                  650.507.9878         21-JUN-99 SH_CLERK         2500
                      120            50

       183 Girard               Geoni
GGEONI                    650.507.9879         03-FEB-00 SH_CLERK         2800
                      120            50


       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
       184 Nandita              Sarchand
NSARCHAN                  650.509.1876         27-JAN-96 SH_CLERK         4200
                      121            50

       185 Alexis               Bull
ABULL                     650.509.2876         20-FEB-97 SH_CLERK         4100
                      121            50

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

       186 Julia                Dellinger
JDELLING                  650.509.3876         24-JUN-98 SH_CLERK         3400
                      121            50

       187 Anthony              Cabrio
ACABRIO                   650.509.4876         07-FEB-99 SH_CLERK         3000

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      121            50

       188 Kelly                Chung
KCHUNG                    650.505.1876         14-JUN-97 SH_CLERK         3800
                      122            50

       189 Jennifer             Dilly

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
JDILLY                    650.505.2876         13-AUG-97 SH_CLERK         3600
                      122            50

       190 Timothy              Gates
TGATES                    650.505.3876         11-JUL-98 SH_CLERK         2900
                      122            50


       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
       191 Randall              Perkins
RPERKINS                  650.505.4876         19-DEC-99 SH_CLERK         2500
                      122            50

       192 Sarah                Bell
SBELL                     650.501.1876         04-FEB-96 SH_CLERK         4000
                      123            50

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

       193 Britney              Everett
BEVERETT                  650.501.2876         03-MAR-97 SH_CLERK         3900
                      123            50

       194 Samuel               McCain
SMCCAIN                   650.501.3876         01-JUL-98 SH_CLERK         3200

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      123            50

       195 Vance                Jones
VJONES                    650.501.4876         17-MAR-99 SH_CLERK         2800
                      123            50

       196 Alana                Walsh

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
AWALSH                    650.507.9811         24-APR-98 SH_CLERK         3100
                      124            50

       197 Kevin                Feeney
KFEENEY                   650.507.9822         23-MAY-98 SH_CLERK         3000
                      124            50


       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
       198 Donald               OConnell
DOCONNEL                  650.507.9833         21-JUN-99 SH_CLERK         2600
                      124            50

       199 Douglas              Grant
DGRANT                    650.507.9844         13-JAN-00 SH_CLERK         2600
                      124            50

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

       200 Jennifer             Whalen
JWHALEN                   515.123.4444         17-SEP-87 AD_ASST          4400
                      101            10

       201 Michael              Hartstein
MHARTSTE                  515.123.5555         17-FEB-96 MK_MAN          13000

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      100            20

       202 Pat                  Fay
PFAY                      603.123.6666         17-AUG-97 MK_REP           6000
                      201            20

       203 Susan                Mavris

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
SMAVRIS                   515.123.7777         07-JUN-94 HR_REP           6500
                      101            40

       204 Hermann              Baer
HBAER                     515.123.8888         07-JUN-94 PR_REP          10000
                      101            70


       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
       205 Shelley              Higgins
SHIGGINS                  515.123.8080         07-JUN-94 AC_MGR          12000
                      101           110

       206 William              Gietz
WGIETZ                    515.123.8181         07-JUN-94 AC_ACCOUNT       8300
                      205           110

       ENO FIRST_NAME           LAST_NAME
---------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------


107 rows selected.

SQL> conn
Enter user-name: sys as sysdba
Enter password:
Connected.
SQL> revoke hr.emp from sami;
revoke hr.emp from sami
       *
ERROR at line 1:
ORA-00990: missing or invalid privilege


SQL> show user
USER is "SYS"
SQL> revoke select on hr.emp from sami;

Revoke succeeded.

SQL> conn
Enter user-name: hr
Enter password:
ERROR:
ORA-01017: invalid username/password; logon denied


Warning: You are no longer connected to ORACLE.
SQL> conn
Enter user-name: sami
Enter password:
ERROR:
ORA-01017: invalid username/password; logon denied


SQL> conn
Enter user-name: sami
Enter password:
Connected.
SQL> select * from hr.emp;
select * from hr.emp
                 *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> set pagesize 500
SQL> set linesize 300
SQL>
SQL> select * from emp;
select * from emp
              *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> conn
Enter user-name: hr
Enter password:
Connected.
SQL> select * from cat;

TABLE_NAME                     TABLE_TYPE
------------------------------ -----------
REGIONS                        TABLE
COUNTRIES                      TABLE
LOCATIONS                      TABLE
LOCATIONS_SEQ                  SEQUENCE
DEPARTMENTS                    TABLE
DEPARTMENTS_SEQ                SEQUENCE
JOBS                           TABLE
EMPLOYEES                      TABLE
EMPLOYEES_SEQ                  SEQUENCE
JOB_HISTORY                    TABLE
EMP_DETAILS_VIEW               VIEW
EMP                            TABLE
DEPT                           TABLE

13 rows selected.

SQL> select * from emp;

       ENO FIRST_NAME           LAST_NAME                 EMAIL
            PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
---------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
       100 Steven               King                      SKING
            515.123.4567         17-JUN-87 AD_PRES         24000
                              90
       101 Neena                Kochhar                   NKOCHHAR
            515.123.4568         21-SEP-89 AD_VP           17000
               100            90
       102 Lex                  De Haan                   LDEHAAN
            515.123.4569         13-JAN-93 AD_VP           17000
               100            90
       103 Alexander            Hunold                    AHUNOLD
            590.423.4567         03-JAN-90 IT_PROG          9000
               102            60
       104 Bruce                Ernst                     BERNST
            590.423.4568         21-MAY-91 IT_PROG          6000
               103            60
       105 David                Austin                    DAUSTIN
            590.423.4569         25-JUN-97 IT_PROG          4800
               103            60
       106 Valli                Pataballa                 VPATABAL
            590.423.4560         05-FEB-98 IT_PROG          4800
               103            60
       107 Diana                Lorentz                   DLORENTZ
            590.423.5567         07-FEB-99 IT_PROG          4200
               103            60
       108 Nancy                Greenberg                 NGREENBE
            515.124.4569         17-AUG-94 FI_MGR          12000
               101           100
       109 Daniel               Faviet                    DFAVIET
            515.124.4169         16-AUG-94 FI_ACCOUNT       9000
               108           100
       110 John                 Chen                      JCHEN
            515.124.4269         28-SEP-97 FI_ACCOUNT       8200
               108           100
       111 Ismael               Sciarra                   ISCIARRA
            515.124.4369         30-SEP-97 FI_ACCOUNT       7700
               108           100
       112 Jose Manuel          Urman                     JMURMAN
            515.124.4469         07-MAR-98 FI_ACCOUNT       7800
               108           100
       113 Luis                 Popp                      LPOPP
            515.124.4567         07-DEC-99 FI_ACCOUNT       6900
               108           100
       114 Den                  Raphaely                  DRAPHEAL
            515.127.4561         07-DEC-94 PU_MAN          11000
               100            30
       115 Alexander            Khoo                      AKHOO
            515.127.4562         18-MAY-95 PU_CLERK         3100
               114            30
       116 Shelli               Baida                     SBAIDA
            515.127.4563         24-DEC-97 PU_CLERK         2900
               114            30
       117 Sigal                Tobias                    STOBIAS
            515.127.4564         24-JUL-97 PU_CLERK         2800
               114            30
       118 Guy                  Himuro                    GHIMURO
            515.127.4565         15-NOV-98 PU_CLERK         2600
               114            30
       119 Karen                Colmenares                KCOLMENA
            515.127.4566         10-AUG-99 PU_CLERK         2500
               114            30
       120 Matthew              Weiss                     MWEISS
            650.123.1234         18-JUL-96 ST_MAN           8000
               100            50
       121 Adam                 Fripp                     AFRIPP
            650.123.2234         10-APR-97 ST_MAN           8200
               100            50
       122 Payam                Kaufling                  PKAUFLIN
            650.123.3234         01-MAY-95 ST_MAN           7900
               100            50
       123 Shanta               Vollman                   SVOLLMAN
            650.123.4234         10-OCT-97 ST_MAN           6500
               100            50
       124 Kevin                Mourgos                   KMOURGOS
            650.123.5234         16-NOV-99 ST_MAN           5800
               100            50
       125 Julia                Nayer                     JNAYER
            650.124.1214         16-JUL-97 ST_CLERK         3200
               120            50
       126 Irene                Mikkilineni               IMIKKILI
            650.124.1224         28-SEP-98 ST_CLERK         2700
               120            50
       127 James                Landry                    JLANDRY
            650.124.1334         14-JAN-99 ST_CLERK         2400
               120            50
       128 Steven               Markle                    SMARKLE
            650.124.1434         08-MAR-00 ST_CLERK         2200
               120            50
       129 Laura                Bissot                    LBISSOT
            650.124.5234         20-AUG-97 ST_CLERK         3300
               121            50
       130 Mozhe                Atkinson                  MATKINSO
            650.124.6234         30-OCT-97 ST_CLERK         2800
               121            50
       131 James                Marlow                    JAMRLOW
            650.124.7234         16-FEB-97 ST_CLERK         2500
               121            50
       132 TJ                   Olson                     TJOLSON
            650.124.8234         10-APR-99 ST_CLERK         2100
               121            50
       133 Jason                Mallin                    JMALLIN
            650.127.1934         14-JUN-96 ST_CLERK         3300
               122            50
       134 Michael              Rogers                    MROGERS
            650.127.1834         26-AUG-98 ST_CLERK         2900
               122            50
       135 Ki                   Gee                       KGEE
            650.127.1734         12-DEC-99 ST_CLERK         2400
               122            50
       136 Hazel                Philtanker                HPHILTAN
            650.127.1634         06-FEB-00 ST_CLERK         2200
               122            50
       137 Renske               Ladwig                    RLADWIG
            650.121.1234         14-JUL-95 ST_CLERK         3600
               123            50
       138 Stephen              Stiles                    SSTILES
            650.121.2034         26-OCT-97 ST_CLERK         3200
               123            50
       139 John                 Seo                       JSEO
            650.121.2019         12-FEB-98 ST_CLERK         2700
               123            50
       140 Joshua               Patel                     JPATEL
            650.121.1834         06-APR-98 ST_CLERK         2500
               123            50
       141 Trenna               Rajs                      TRAJS
            650.121.8009         17-OCT-95 ST_CLERK         3500
               124            50
       142 Curtis               Davies                    CDAVIES
            650.121.2994         29-JAN-97 ST_CLERK         3100
               124            50
       143 Randall              Matos                     RMATOS
            650.121.2874         15-MAR-98 ST_CLERK         2600
               124            50
       144 Peter                Vargas                    PVARGAS
            650.121.2004         09-JUL-98 ST_CLERK         2500
               124            50
       145 John                 Russell                   JRUSSEL
            011.44.1344.429268   01-OCT-96 SA_MAN          14000             .4        100           80
       146 Karen                Partners                  KPARTNER
            011.44.1344.467268   05-JAN-97 SA_MAN          13500             .3        100           80
       147 Alberto              Errazuriz                 AERRAZUR
            011.44.1344.429278   10-MAR-97 SA_MAN          12000             .3        100           80
       148 Gerald               Cambrault                 GCAMBRAU
            011.44.1344.619268   15-OCT-99 SA_MAN          11000             .3        100           80
       149 Eleni                Zlotkey                   EZLOTKEY
            011.44.1344.429018   29-JAN-00 SA_MAN          10500             .2        100           80
       150 Peter                Tucker                    PTUCKER
            011.44.1344.129268   30-JAN-97 SA_REP          10000             .3        145           80
       151 David                Bernstein                 DBERNSTE
            011.44.1344.345268   24-MAR-97 SA_REP           9500            .25        145           80
       152 Peter                Hall                      PHALL
            011.44.1344.478968   20-AUG-97 SA_REP           9000            .25        145           80
       153 Christopher          Olsen                     COLSEN
            011.44.1344.498718   30-MAR-98 SA_REP           8000             .2        145           80
       154 Nanette              Cambrault                 NCAMBRAU
            011.44.1344.987668   09-DEC-98 SA_REP           7500             .2        145           80
       155 Oliver               Tuvault                   OTUVAULT
            011.44.1344.486508   23-NOV-99 SA_REP           7000            .15        145           80
       156 Janette              King                      JKING
            011.44.1345.429268   30-JAN-96 SA_REP          10000            .35        146           80
       157 Patrick              Sully                     PSULLY
            011.44.1345.929268   04-MAR-96 SA_REP           9500            .35        146           80
       158 Allan                McEwen                    AMCEWEN
            011.44.1345.829268   01-AUG-96 SA_REP           9000            .35        146           80
       159 Lindsey              Smith                     LSMITH
            011.44.1345.729268   10-MAR-97 SA_REP           8000             .3        146           80
       160 Louise               Doran                     LDORAN
            011.44.1345.629268   15-DEC-97 SA_REP           7500             .3        146           80
       161 Sarath               Sewall                    SSEWALL
            011.44.1345.529268   03-NOV-98 SA_REP           7000            .25        146           80
       162 Clara                Vishney                   CVISHNEY
            011.44.1346.129268   11-NOV-97 SA_REP          10500            .25        147           80
       163 Danielle             Greene                    DGREENE
            011.44.1346.229268   19-MAR-99 SA_REP           9500            .15        147           80
       164 Mattea               Marvins                   MMARVINS
            011.44.1346.329268   24-JAN-00 SA_REP           7200             .1        147           80
       165 David                Lee                       DLEE
            011.44.1346.529268   23-FEB-00 SA_REP           6800             .1        147           80
       166 Sundar               Ande                      SANDE
            011.44.1346.629268   24-MAR-00 SA_REP           6400             .1        147           80
       167 Amit                 Banda                     ABANDA
            011.44.1346.729268   21-APR-00 SA_REP           6200             .1        147           80
       168 Lisa                 Ozer                      LOZER
            011.44.1343.929268   11-MAR-97 SA_REP          11500            .25        148           80
       169 Harrison             Bloom                     HBLOOM
            011.44.1343.829268   23-MAR-98 SA_REP          10000             .2        148           80
       170 Tayler               Fox                       TFOX
            011.44.1343.729268   24-JAN-98 SA_REP           9600             .2        148           80
       171 William              Smith                     WSMITH
            011.44.1343.629268   23-FEB-99 SA_REP           7400            .15        148           80
       172 Elizabeth            Bates                     EBATES
            011.44.1343.529268   24-MAR-99 SA_REP           7300            .15        148           80
       173 Sundita              Kumar                     SKUMAR
            011.44.1343.329268   21-APR-00 SA_REP           6100             .1        148           80
       174 Ellen                Abel                      EABEL
            011.44.1644.429267   11-MAY-96 SA_REP          11000             .3        149           80
       175 Alyssa               Hutton                    AHUTTON
            011.44.1644.429266   19-MAR-97 SA_REP           8800            .25        149           80
       176 Jonathon             Taylor                    JTAYLOR
            011.44.1644.429265   24-MAR-98 SA_REP           8600             .2        149           80
       177 Jack                 Livingston                JLIVINGS
            011.44.1644.429264   23-APR-98 SA_REP           8400             .2        149           80
       178 Kimberely            Grant                     KGRANT
            011.44.1644.429263   24-MAY-99 SA_REP           7000            .15        149
       179 Charles              Johnson                   CJOHNSON
            011.44.1644.429262   04-JAN-00 SA_REP           6200             .1        149           80
       180 Winston              Taylor                    WTAYLOR
            650.507.9876         24-JAN-98 SH_CLERK         3200
               120            50
       181 Jean                 Fleaur                    JFLEAUR
            650.507.9877         23-FEB-98 SH_CLERK         3100
               120            50
       182 Martha               Sullivan                  MSULLIVA
            650.507.9878         21-JUN-99 SH_CLERK         2500
               120            50
       183 Girard               Geoni                     GGEONI
            650.507.9879         03-FEB-00 SH_CLERK         2800
               120            50
       184 Nandita              Sarchand                  NSARCHAN
            650.509.1876         27-JAN-96 SH_CLERK         4200
               121            50
       185 Alexis               Bull                      ABULL
            650.509.2876         20-FEB-97 SH_CLERK         4100
               121            50
       186 Julia                Dellinger                 JDELLING
            650.509.3876         24-JUN-98 SH_CLERK         3400
               121            50
       187 Anthony              Cabrio                    ACABRIO
            650.509.4876         07-FEB-99 SH_CLERK         3000
               121            50
       188 Kelly                Chung                     KCHUNG
            650.505.1876         14-JUN-97 SH_CLERK         3800
               122            50
       189 Jennifer             Dilly                     JDILLY
            650.505.2876         13-AUG-97 SH_CLERK         3600
               122            50
       190 Timothy              Gates                     TGATES
            650.505.3876         11-JUL-98 SH_CLERK         2900
               122            50
       191 Randall              Perkins                   RPERKINS
            650.505.4876         19-DEC-99 SH_CLERK         2500
               122            50
       192 Sarah                Bell                      SBELL
            650.501.1876         04-FEB-96 SH_CLERK         4000
               123            50
       193 Britney              Everett                   BEVERETT
            650.501.2876         03-MAR-97 SH_CLERK         3900
               123            50
       194 Samuel               McCain                    SMCCAIN
            650.501.3876         01-JUL-98 SH_CLERK         3200
               123            50
       195 Vance                Jones                     VJONES
            650.501.4876         17-MAR-99 SH_CLERK         2800
               123            50
       196 Alana                Walsh                     AWALSH
            650.507.9811         24-APR-98 SH_CLERK         3100
               124            50
       197 Kevin                Feeney                    KFEENEY
            650.507.9822         23-MAY-98 SH_CLERK         3000
               124            50
       198 Donald               OConnell                  DOCONNEL
            650.507.9833         21-JUN-99 SH_CLERK         2600
               124            50
       199 Douglas              Grant                     DGRANT
            650.507.9844         13-JAN-00 SH_CLERK         2600
               124            50
       200 Jennifer             Whalen                    JWHALEN
            515.123.4444         17-SEP-87 AD_ASST          4400
               101            10
       201 Michael              Hartstein                 MHARTSTE
            515.123.5555         17-FEB-96 MK_MAN          13000
               100            20
       202 Pat                  Fay                       PFAY
            603.123.6666         17-AUG-97 MK_REP           6000
               201            20
       203 Susan                Mavris                    SMAVRIS
            515.123.7777         07-JUN-94 HR_REP           6500
               101            40
       204 Hermann              Baer                      HBAER
            515.123.8888         07-JUN-94 PR_REP          10000
               101            70
       205 Shelley              Higgins                   SHIGGINS
            515.123.8080         07-JUN-94 AC_MGR          12000
               101           110
       206 William              Gietz                     WGIETZ
            515.123.8181         07-JUN-94 AC_ACCOUNT       8300
               205           110

107 rows selected.

SQL> set linesize 400
SQL> select * from emp;

       ENO FIRST_NAME           LAST_NAME                 EMAIL
            PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
---------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
       100 Steven               King                      SKING
            515.123.4567         17-JUN-87 AD_PRES         24000
                              90
       101 Neena                Kochhar                   NKOCHHAR
            515.123.4568         21-SEP-89 AD_VP           17000
               100            90
       102 Lex                  De Haan                   LDEHAAN
            515.123.4569         13-JAN-93 AD_VP           17000
               100            90
       103 Alexander            Hunold                    AHUNOLD
            590.423.4567         03-JAN-90 IT_PROG          9000
               102            60
       104 Bruce                Ernst                     BERNST
            590.423.4568         21-MAY-91 IT_PROG          6000
               103            60
       105 David                Austin                    DAUSTIN
            590.423.4569         25-JUN-97 IT_PROG          4800
               103            60
       106 Valli                Pataballa                 VPATABAL
            590.423.4560         05-FEB-98 IT_PROG          4800
               103            60
       107 Diana                Lorentz                   DLORENTZ
            590.423.5567         07-FEB-99 IT_PROG          4200
               103            60
       108 Nancy                Greenberg                 NGREENBE
            515.124.4569         17-AUG-94 FI_MGR          12000
               101           100
       109 Daniel               Faviet                    DFAVIET
            515.124.4169         16-AUG-94 FI_ACCOUNT       9000
               108           100
       110 John                 Chen                      JCHEN
            515.124.4269         28-SEP-97 FI_ACCOUNT       8200
               108           100
       111 Ismael               Sciarra                   ISCIARRA
            515.124.4369         30-SEP-97 FI_ACCOUNT       7700
               108           100
       112 Jose Manuel          Urman                     JMURMAN
            515.124.4469         07-MAR-98 FI_ACCOUNT       7800
               108           100
       113 Luis                 Popp                      LPOPP
            515.124.4567         07-DEC-99 FI_ACCOUNT       6900
               108           100
       114 Den                  Raphaely                  DRAPHEAL
            515.127.4561         07-DEC-94 PU_MAN          11000
               100            30
       115 Alexander            Khoo                      AKHOO
            515.127.4562         18-MAY-95 PU_CLERK         3100
               114            30
       116 Shelli               Baida                     SBAIDA
            515.127.4563         24-DEC-97 PU_CLERK         2900
               114            30
       117 Sigal                Tobias                    STOBIAS
            515.127.4564         24-JUL-97 PU_CLERK         2800
               114            30
       118 Guy                  Himuro                    GHIMURO
            515.127.4565         15-NOV-98 PU_CLERK         2600
               114            30
       119 Karen                Colmenares                KCOLMENA
            515.127.4566         10-AUG-99 PU_CLERK         2500
               114            30
       120 Matthew              Weiss                     MWEISS
            650.123.1234         18-JUL-96 ST_MAN           8000
               100            50
       121 Adam                 Fripp                     AFRIPP
            650.123.2234         10-APR-97 ST_MAN           8200
               100            50
       122 Payam                Kaufling                  PKAUFLIN
            650.123.3234         01-MAY-95 ST_MAN           7900
               100            50
       123 Shanta               Vollman                   SVOLLMAN
            650.123.4234         10-OCT-97 ST_MAN           6500
               100            50
       124 Kevin                Mourgos                   KMOURGOS
            650.123.5234         16-NOV-99 ST_MAN           5800
               100            50
       125 Julia                Nayer                     JNAYER
            650.124.1214         16-JUL-97 ST_CLERK         3200
               120            50
       126 Irene                Mikkilineni               IMIKKILI
            650.124.1224         28-SEP-98 ST_CLERK         2700
               120            50
       127 James                Landry                    JLANDRY
            650.124.1334         14-JAN-99 ST_CLERK         2400
               120            50
       128 Steven               Markle                    SMARKLE
            650.124.1434         08-MAR-00 ST_CLERK         2200
               120            50
       129 Laura                Bissot                    LBISSOT
            650.124.5234         20-AUG-97 ST_CLERK         3300
               121            50
       130 Mozhe                Atkinson                  MATKINSO
            650.124.6234         30-OCT-97 ST_CLERK         2800
               121            50
       131 James                Marlow                    JAMRLOW
            650.124.7234         16-FEB-97 ST_CLERK         2500
               121            50
       132 TJ                   Olson                     TJOLSON
            650.124.8234         10-APR-99 ST_CLERK         2100
               121            50
       133 Jason                Mallin                    JMALLIN
            650.127.1934         14-JUN-96 ST_CLERK         3300
               122            50
       134 Michael              Rogers                    MROGERS
            650.127.1834         26-AUG-98 ST_CLERK         2900
               122            50
       135 Ki                   Gee                       KGEE
            650.127.1734         12-DEC-99 ST_CLERK         2400
               122            50
       136 Hazel                Philtanker                HPHILTAN
            650.127.1634         06-FEB-00 ST_CLERK         2200
               122            50
       137 Renske               Ladwig                    RLADWIG
            650.121.1234         14-JUL-95 ST_CLERK         3600
               123            50
       138 Stephen              Stiles                    SSTILES
            650.121.2034         26-OCT-97 ST_CLERK         3200
               123            50
       139 John                 Seo                       JSEO
            650.121.2019         12-FEB-98 ST_CLERK         2700
               123            50
       140 Joshua               Patel                     JPATEL
            650.121.1834         06-APR-98 ST_CLERK         2500
               123            50
       141 Trenna               Rajs                      TRAJS
            650.121.8009         17-OCT-95 ST_CLERK         3500
               124            50
       142 Curtis               Davies                    CDAVIES
            650.121.2994         29-JAN-97 ST_CLERK         3100
               124            50
       143 Randall              Matos                     RMATOS
            650.121.2874         15-MAR-98 ST_CLERK         2600
               124            50
       144 Peter                Vargas                    PVARGAS
            650.121.2004         09-JUL-98 ST_CLERK         2500
               124            50
       145 John                 Russell                   JRUSSEL
            011.44.1344.429268   01-OCT-96 SA_MAN          14000             .4        100           80
       146 Karen                Partners                  KPARTNER
            011.44.1344.467268   05-JAN-97 SA_MAN          13500             .3        100           80
       147 Alberto              Errazuriz                 AERRAZUR
            011.44.1344.429278   10-MAR-97 SA_MAN          12000             .3        100           80
       148 Gerald               Cambrault                 GCAMBRAU
            011.44.1344.619268   15-OCT-99 SA_MAN          11000             .3        100           80
       149 Eleni                Zlotkey                   EZLOTKEY
            011.44.1344.429018   29-JAN-00 SA_MAN          10500             .2        100           80
       150 Peter                Tucker                    PTUCKER
            011.44.1344.129268   30-JAN-97 SA_REP          10000             .3        145           80
       151 David                Bernstein                 DBERNSTE
            011.44.1344.345268   24-MAR-97 SA_REP           9500            .25        145           80
       152 Peter                Hall                      PHALL
            011.44.1344.478968   20-AUG-97 SA_REP           9000            .25        145           80
       153 Christopher          Olsen                     COLSEN
            011.44.1344.498718   30-MAR-98 SA_REP           8000             .2        145           80
       154 Nanette              Cambrault                 NCAMBRAU
            011.44.1344.987668   09-DEC-98 SA_REP           7500             .2        145           80
       155 Oliver               Tuvault                   OTUVAULT
            011.44.1344.486508   23-NOV-99 SA_REP           7000            .15        145           80
       156 Janette              King                      JKING
            011.44.1345.429268   30-JAN-96 SA_REP          10000            .35        146           80
       157 Patrick              Sully                     PSULLY
            011.44.1345.929268   04-MAR-96 SA_REP           9500            .35        146           80
       158 Allan                McEwen                    AMCEWEN
            011.44.1345.829268   01-AUG-96 SA_REP           9000            .35        146           80
       159 Lindsey              Smith                     LSMITH
            011.44.1345.729268   10-MAR-97 SA_REP           8000             .3        146           80
       160 Louise               Doran                     LDORAN
            011.44.1345.629268   15-DEC-97 SA_REP           7500             .3        146           80
       161 Sarath               Sewall                    SSEWALL
            011.44.1345.529268   03-NOV-98 SA_REP           7000            .25        146           80
       162 Clara                Vishney                   CVISHNEY
            011.44.1346.129268   11-NOV-97 SA_REP          10500            .25        147           80
       163 Danielle             Greene                    DGREENE
            011.44.1346.229268   19-MAR-99 SA_REP           9500            .15        147           80
       164 Mattea               Marvins                   MMARVINS
            011.44.1346.329268   24-JAN-00 SA_REP           7200             .1        147           80
       165 David                Lee                       DLEE
            011.44.1346.529268   23-FEB-00 SA_REP           6800             .1        147           80
       166 Sundar               Ande                      SANDE
            011.44.1346.629268   24-MAR-00 SA_REP           6400             .1        147           80
       167 Amit                 Banda                     ABANDA
            011.44.1346.729268   21-APR-00 SA_REP           6200             .1        147           80
       168 Lisa                 Ozer                      LOZER
            011.44.1343.929268   11-MAR-97 SA_REP          11500            .25        148           80
       169 Harrison             Bloom                     HBLOOM
            011.44.1343.829268   23-MAR-98 SA_REP          10000             .2        148           80
       170 Tayler               Fox                       TFOX
            011.44.1343.729268   24-JAN-98 SA_REP           9600             .2        148           80
       171 William              Smith                     WSMITH
            011.44.1343.629268   23-FEB-99 SA_REP           7400            .15        148           80
       172 Elizabeth            Bates                     EBATES
            011.44.1343.529268   24-MAR-99 SA_REP           7300            .15        148           80
       173 Sundita              Kumar                     SKUMAR
            011.44.1343.329268   21-APR-00 SA_REP           6100             .1        148           80
       174 Ellen                Abel                      EABEL
            011.44.1644.429267   11-MAY-96 SA_REP          11000             .3        149           80
       175 Alyssa               Hutton                    AHUTTON
            011.44.1644.429266   19-MAR-97 SA_REP           8800            .25        149           80
       176 Jonathon             Taylor                    JTAYLOR
            011.44.1644.429265   24-MAR-98 SA_REP           8600             .2        149           80
       177 Jack                 Livingston                JLIVINGS
            011.44.1644.429264   23-APR-98 SA_REP           8400             .2        149           80
       178 Kimberely            Grant                     KGRANT
            011.44.1644.429263   24-MAY-99 SA_REP           7000            .15        149
       179 Charles              Johnson                   CJOHNSON
            011.44.1644.429262   04-JAN-00 SA_REP           6200             .1        149           80
       180 Winston              Taylor                    WTAYLOR
            650.507.9876         24-JAN-98 SH_CLERK         3200
               120            50
       181 Jean                 Fleaur                    JFLEAUR
            650.507.9877         23-FEB-98 SH_CLERK         3100
               120            50
       182 Martha               Sullivan                  MSULLIVA
            650.507.9878         21-JUN-99 SH_CLERK         2500
               120            50
       183 Girard               Geoni                     GGEONI
            650.507.9879         03-FEB-00 SH_CLERK         2800
               120            50
       184 Nandita              Sarchand                  NSARCHAN
            650.509.1876         27-JAN-96 SH_CLERK         4200
               121            50
       185 Alexis               Bull                      ABULL
            650.509.2876         20-FEB-97 SH_CLERK         4100
               121            50
       186 Julia                Dellinger                 JDELLING
            650.509.3876         24-JUN-98 SH_CLERK         3400
               121            50
       187 Anthony              Cabrio                    ACABRIO
            650.509.4876         07-FEB-99 SH_CLERK         3000
               121            50
       188 Kelly                Chung                     KCHUNG
            650.505.1876         14-JUN-97 SH_CLERK         3800
               122            50
       189 Jennifer             Dilly                     JDILLY
            650.505.2876         13-AUG-97 SH_CLERK         3600
               122            50
       190 Timothy              Gates                     TGATES
            650.505.3876         11-JUL-98 SH_CLERK         2900
               122            50
       191 Randall              Perkins                   RPERKINS
            650.505.4876         19-DEC-99 SH_CLERK         2500
               122            50
       192 Sarah                Bell                      SBELL
            650.501.1876         04-FEB-96 SH_CLERK         4000
               123            50
       193 Britney              Everett                   BEVERETT
            650.501.2876         03-MAR-97 SH_CLERK         3900
               123            50
       194 Samuel               McCain                    SMCCAIN
            650.501.3876         01-JUL-98 SH_CLERK         3200
               123            50
       195 Vance                Jones                     VJONES
            650.501.4876         17-MAR-99 SH_CLERK         2800
               123            50
       196 Alana                Walsh                     AWALSH
            650.507.9811         24-APR-98 SH_CLERK         3100
               124            50
       197 Kevin                Feeney                    KFEENEY
            650.507.9822         23-MAY-98 SH_CLERK         3000
               124            50
       198 Donald               OConnell                  DOCONNEL
            650.507.9833         21-JUN-99 SH_CLERK         2600
               124            50
       199 Douglas              Grant                     DGRANT
            650.507.9844         13-JAN-00 SH_CLERK         2600
               124            50
       200 Jennifer             Whalen                    JWHALEN
            515.123.4444         17-SEP-87 AD_ASST          4400
               101            10
       201 Michael              Hartstein                 MHARTSTE
            515.123.5555         17-FEB-96 MK_MAN          13000
               100            20
       202 Pat                  Fay                       PFAY
            603.123.6666         17-AUG-97 MK_REP           6000
               201            20
       203 Susan                Mavris                    SMAVRIS
            515.123.7777         07-JUN-94 HR_REP           6500
               101            40
       204 Hermann              Baer                      HBAER
            515.123.8888         07-JUN-94 PR_REP          10000
               101            70
       205 Shelley              Higgins                   SHIGGINS
            515.123.8080         07-JUN-94 AC_MGR          12000
               101           110
       206 William              Gietz                     WGIETZ
            515.123.8181         07-JUN-94 AC_ACCOUNT       8300
               205           110

107 rows selected.

SQL> set linesize 200
SQL> select eno,first_name,salary from emp;

       ENO FIRST_NAME               SALARY
---------- -------------------- ----------
       100 Steven                    24000
       101 Neena                     17000
       102 Lex                       17000
       103 Alexander                  9000
       104 Bruce                      6000
       105 David                      4800
       106 Valli                      4800
       107 Diana                      4200
       108 Nancy                     12000
       109 Daniel                     9000
       110 John                       8200
       111 Ismael                     7700
       112 Jose Manuel                7800
       113 Luis                       6900
       114 Den                       11000
       115 Alexander                  3100
       116 Shelli                     2900
       117 Sigal                      2800
       118 Guy                        2600
       119 Karen                      2500
       120 Matthew                    8000
       121 Adam                       8200
       122 Payam                      7900
       123 Shanta                     6500
       124 Kevin                      5800
       125 Julia                      3200
       126 Irene                      2700
       127 James                      2400
       128 Steven                     2200
       129 Laura                      3300
       130 Mozhe                      2800
       131 James                      2500
       132 TJ                         2100
       133 Jason                      3300
       134 Michael                    2900
       135 Ki                         2400
       136 Hazel                      2200
       137 Renske                     3600
       138 Stephen                    3200
       139 John                       2700
       140 Joshua                     2500
       141 Trenna                     3500
       142 Curtis                     3100
       143 Randall                    2600
       144 Peter                      2500
       145 John                      14000
       146 Karen                     13500
       147 Alberto                   12000
       148 Gerald                    11000
       149 Eleni                     10500
       150 Peter                     10000
       151 David                      9500
       152 Peter                      9000
       153 Christopher                8000
       154 Nanette                    7500
       155 Oliver                     7000
       156 Janette                   10000
       157 Patrick                    9500
       158 Allan                      9000
       159 Lindsey                    8000
       160 Louise                     7500
       161 Sarath                     7000
       162 Clara                     10500
       163 Danielle                   9500
       164 Mattea                     7200
       165 David                      6800
       166 Sundar                     6400
       167 Amit                       6200
       168 Lisa                      11500
       169 Harrison                  10000
       170 Tayler                     9600
       171 William                    7400
       172 Elizabeth                  7300
       173 Sundita                    6100
       174 Ellen                     11000
       175 Alyssa                     8800
       176 Jonathon                   8600
       177 Jack                       8400
       178 Kimberely                  7000
       179 Charles                    6200
       180 Winston                    3200
       181 Jean                       3100
       182 Martha                     2500
       183 Girard                     2800
       184 Nandita                    4200
       185 Alexis                     4100
       186 Julia                      3400
       187 Anthony                    3000
       188 Kelly                      3800
       189 Jennifer                   3600
       190 Timothy                    2900
       191 Randall                    2500
       192 Sarah                      4000
       193 Britney                    3900
       194 Samuel                     3200
       195 Vance                      2800
       196 Alana                      3100
       197 Kevin                      3000
       198 Donald                     2600
       199 Douglas                    2600
       200 Jennifer                   4400
       201 Michael                   13000
       202 Pat                        6000
       203 Susan                      6500
       204 Hermann                   10000
       205 Shelley                   12000
       206 William                    8300

107 rows selected.

SQL> select * from dept;

DEPARTMENT_ID DEPARTMENT_NAME                MANAGER_ID LOCATION_ID
------------- ------------------------------ ---------- -----------
           10 Administration                        200        1700
           20 Marketing                             201        1800
           30 Purchasing                            114        1700
           40 Human Resources                       203        2400
           50 Shipping                              121        1500
           60 IT                                    103        1400
           70 Public Relations                      204        2700
           80 Sales                                 145        2500
           90 Executive                             100        1700
          100 Finance                               108        1700
          110 Accounting                            205        1700
          120 Treasury                                         1700
          130 Corporate Tax                                    1700
          140 Control And Credit                               1700
          150 Shareholder Services                             1700
          160 Benefits                                         1700
          170 Manufacturing                                    1700
          180 Construction                                     1700
          190 Contracting                                      1700
          200 Operations                                       1700
          210 IT Support                                       1700
          220 NOC                                              1700
          230 IT Helpdesk                                      1700
          240 Government Sales                                 1700
          250 Retail Sales                                     1700
          260 Recruiting                                       1700
          270 Payroll                                          1700

27 rows selected.

SQL> select * from dept;

DEPARTMENT_ID DEPARTMENT_NAME                MANAGER_ID LOCATION_ID
------------- ------------------------------ ---------- -----------
           10 Administration                        200        1700
           20 Marketing                             201        1800
           30 Purchasing                            114        1700
           40 Human Resources                       203        2400
           50 Shipping                              121        1500
           60 IT                                    103        1400
           70 Public Relations                      204        2700
           80 Sales                                 145        2500
           90 Executive                             100        1700
          100 Finance                               108        1700
          110 Accounting                            205        1700
          120 Treasury                                         1700
          130 Corporate Tax                                    1700
          140 Control And Credit                               1700
          150 Shareholder Services                             1700
          160 Benefits                                         1700
          170 Manufacturing                                    1700
          180 Construction                                     1700
          190 Contracting                                      1700
          200 Operations                                       1700
          210 IT Support                                       1700
          220 NOC                                              1700
          230 IT Helpdesk                                      1700
          240 Government Sales                                 1700
          250 Retail Sales                                     1700
          260 Recruiting                                       1700
          270 Payroll                                          1700

27 rows selected.

SQL> select * from department;
select * from department
              *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> conn
Enter user-name: hr
Enter password:
Connected.
SQL> show user
USER is "HR"
SQL> desc hr
ERROR:
ORA-04043: object hr does not exist


SQL> select * from cat;

TABLE_NAME                     TABLE_TYPE
------------------------------ -----------
REGIONS                        TABLE
COUNTRIES                      TABLE
LOCATIONS                      TABLE
LOCATIONS_SEQ                  SEQUENCE
DEPARTMENTS                    TABLE
DEPARTMENTS_SEQ                SEQUENCE
JOBS                           TABLE
EMPLOYEES                      TABLE
EMPLOYEES_SEQ                  SEQUENCE
JOB_HISTORY                    TABLE
EMP_DETAILS_VIEW               VIEW
EMP                            TABLE
DEPT                           TABLE

13 rows selected.

SQL> select departments from hr;
select departments from hr
                        *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> select * from departments
  2
SQL> select * from department;
select * from department
              *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> select table from DEPARTMENTS
  2
SQL> select departments from hr;
select departments from hr
                        *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> select departments from hr
  2
SQL> select * from departments
  2
SQL> select * from departments;

DEPARTMENT_ID DEPARTMENT_NAME                MANAGER_ID LOCATION_ID
------------- ------------------------------ ---------- -----------
           10 Administration                        200        1700
           20 Marketing                             201        1800
           30 Purchasing                            114        1700
           40 Human Resources                       203        2400
           50 Shipping                              121        1500
           60 IT                                    103        1400
           70 Public Relations                      204        2700
           80 Sales                                 145        2500
           90 Executive                             100        1700
          100 Finance                               108        1700
          110 Accounting                            205        1700
          120 Treasury                                         1700
          130 Corporate Tax                                    1700
          140 Control And Credit                               1700
          150 Shareholder Services                             1700
          160 Benefits                                         1700
          170 Manufacturing                                    1700
          180 Construction                                     1700
          190 Contracting                                      1700
          200 Operations                                       1700
          210 IT Support                                       1700
          220 NOC                                              1700
          230 IT Helpdesk                                      1700
          240 Government Sales                                 1700
          250 Retail Sales                                     1700
          260 Recruiting                                       1700
          270 Payroll                                          1700

27 rows selected.

SQL> select * from departments_name=shipping;
select * from departments_name=shipping
                              *
ERROR at line 1:
ORA-00933: SQL command not properly ended


SQL>
SQL> select * from departments where salary>5000;
select * from departments where salary>5000
                                *
ERROR at line 1:
ORA-00904: "SALARY": invalid identifier


SQL> desc departments;
 Name
                                                   Null?    Type
 ----------------------------------------------------------------------------------------------------------------- -------- ----------------------------------------------------------------------------
 DEPARTMENT_ID
                                                   NOT NULL NUMBER(4)
 DEPARTMENT_NAME
                                                   NOT NULL VARCHAR2(30)
 MANAGER_ID
                                                            NUMBER(6)
 LOCATION_ID
                                                            NUMBER(4)

SQL>