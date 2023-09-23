
SQL*Plus: Release 10.2.0.1.0 - Production on Mon Feb 20 23:27:50 2023

Copyright (c) 1982, 2005, Oracle.  All rights reserved.

Enter user-name: hr
Enter password:

Connected to:
Oracle Database 10g Express Edition Release 10.2.0.1.0 - Production

SQL> conn
Enter user-name: sys as sysdba
Enter password:
Connected.
SQL> alter user hr account unlock;

User altered.

SQL> conn
Enter user-name: hr
Enter password:
Connected.
SQL> conn
Enter user-name: sys as sysdba
Enter password:
Connected.
SQL> create user haseeb identified by hs
  2  ;

User created.

SQL> conn
Enter user-name: haseeb
Enter password:
ERROR:
ORA-01045: user HASEEB lacks CREATE SESSION privilege; logon denied


Warning: You are no longer connected to ORACLE.
SQL> conn
Enter user-name: sys as sysdba
Enter password:
Connected.
SQL> grant dba to haseeb;

Grant succeeded.

SQL> conn
Enter user-name: haseeb
Enter password:
Connected.
SQL> select * from cat;

no rows selected

SQL> conn
Enter user-name: hr
Enter password:
ERROR:
ORA-01017: invalid username/password; logon denied


Warning: You are no longer connected to ORACLE.
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

SQL> create table dept as select * from departments;

Table created.

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

TABLE_NAME                     TABLE_TYPE
------------------------------ -----------
EMP                            TABLE
DEPT                           TABLE

13 rows selected.

SQL> desc emp
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                                        NUMBER(6)
 FIRST_NAME                                         VARCHAR2(20)
 LAST_NAME                                 NOT NULL VARCHAR2(25)
 EMAIL                                     NOT NULL VARCHAR2(25)
 PHONE_NUMBER                                       VARCHAR2(20)
 HIRE_DATE                                 NOT NULL DATE
 JOB_ID                                    NOT NULL VARCHAR2(10)
 SALARY                                             NUMBER(8,2)
 COMMISSION_PCT                                     NUMBER(2,2)
 MANAGER_ID                                         NUMBER(6)
 DEPARTMENT_ID                                      NUMBER(4)

SQL> set pagesize 200
SQL> set linesize 300
SQL> desc dept
 Name
                                                                               Null?    Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- --------------------------------------------------------------------------------------------------------------------
 DEPARTMENT_ID
                                                                                        NUMBER(4)
 DEPARTMENT_NAME
                                                                               NOT NULL VARCHAR2(30)
 MANAGER_ID
                                                                                        NUMBER(6)
 LOCATION_ID
                                                                                        NUMBER(4)

SQL> desc emp
 Name
                                                                               Null?    Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- --------------------------------------------------------------------------------------------------------------------
 EMPLOYEE_ID
                                                                                        NUMBER(6)
 FIRST_NAME
                                                                                        VARCHAR2(20)
 LAST_NAME
                                                                               NOT NULL VARCHAR2(25)
 EMAIL
                                                                               NOT NULL VARCHAR2(25)
 PHONE_NUMBER
                                                                                        VARCHAR2(20)
 HIRE_DATE
                                                                               NOT NULL DATE
 JOB_ID
                                                                               NOT NULL VARCHAR2(10)
 SALARY
                                                                                        NUMBER(8,2)
 COMMISSION_PCT
                                                                                        NUMBER(2,2)
 MANAGER_ID
                                                                                        NUMBER(6)
 DEPARTMENT_ID
                                                                                        NUMBER(4)

SQL> alter table emp rename column employee_id to eno;

Table altered.

SQL> alter table emp rename column first_name to ename;

Table altered.

SQL> alter table emp drop column last_name;

Table altered.

SQL> alter table emp drop column commission_pct;

Table altered.

SQL> alter table emp drop column phone_number;

Table altered.

SQL> desc emp
 Name
                                                                               Null?    Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- --------------------------------------------------------------------------------------------------------------------
 ENO
                                                                                        NUMBER(6)
 ENAME
                                                                                        VARCHAR2(20)
 EMAIL
                                                                               NOT NULL VARCHAR2(25)
 HIRE_DATE
                                                                               NOT NULL DATE
 JOB_ID
                                                                               NOT NULL VARCHAR2(10)
 SALARY
                                                                                        NUMBER(8,2)
 MANAGER_ID
                                                                                        NUMBER(6)
 DEPARTMENT_ID
                                                                                        NUMBER(4)

SQL> alter table emp drop column hire_date;

Table altered.

SQL> alter table emp drop column email,job_id;
alter table emp drop column email,job_id
                                 *
ERROR at line 1:
ORA-00933: SQL command not properly ended


SQL> alter table emp drop column email;

Table altered.

SQL> alter table emp drop column job_id;

Table altered.

SQL> alter table emp add address varchar2(50);

Table altered.

SQL> desc emp
 Name
                                                                               Null?    Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- --------------------------------------------------------------------------------------------------------------------
 ENO
                                                                                        NUMBER(6)
 ENAME
                                                                                        VARCHAR2(20)
 SALARY
                                                                                        NUMBER(8,2)
 MANAGER_ID
                                                                                        NUMBER(6)
 DEPARTMENT_ID
                                                                                        NUMBER(4)
 ADDRESS
                                                                                        VARCHAR2(50)

SQL> set linesize 100
SQL> desc emp
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 ENO                                                            NUMBER(6)
 ENAME                                                          VARCHAR2(20)
 SALARY                                                         NUMBER(8,2)
 MANAGER_ID                                                     NUMBER(6)
 DEPARTMENT_ID                                                  NUMBER(4)
 ADDRESS                                                        VARCHAR2(50)

SQL> set linesize 70
SQL> desc emp
 Name                                Null?    Type
 ----------------------------------- -------- ------------------------
 ENO                                          NUMBER(6)
 ENAME                                        VARCHAR2(20)
 SALARY                                       NUMBER(8,2)
 MANAGER_ID                                   NUMBER(6)
 DEPARTMENT_ID                                NUMBER(4)
 ADDRESS                                      VARCHAR2(50)

SQL> alter table emp add constraint pk_eno primary key(eno);

Table altered.

SQL> desc emp
 Name                                Null?    Type
 ----------------------------------- -------- ------------------------
 ENO                                 NOT NULL NUMBER(6)
 ENAME                                        VARCHAR2(20)
 SALARY                                       NUMBER(8,2)
 MANAGER_ID                                   NUMBER(6)
 DEPARTMENT_ID                                NUMBER(4)
 ADDRESS                                      VARCHAR2(50)

SQL> select * from emp;

       ENO ENAME                    SALARY MANAGER_ID DEPARTMENT_ID
---------- -------------------- ---------- ---------- -------------
ADDRESS
--------------------------------------------------
       100 Steven                    24000                       90


       101 Neena                     17000        100            90


       102 Lex                       17000        100            90


       103 Alexander                  9000        102            60


       104 Bruce                      6000        103            60


       105 David                      4800        103            60


       106 Valli                      4800        103            60


       107 Diana                      4200        103            60


       108 Nancy                     12000        101           100


       109 Daniel                     9000        108           100


       110 John                       8200        108           100


       111 Ismael                     7700        108           100


       112 Jose Manuel                7800        108           100


       113 Luis                       6900        108           100


       114 Den                       11000        100            30


       115 Alexander                  3100        114            30


       116 Shelli                     2900        114            30


       117 Sigal                      2800        114            30


       118 Guy                        2600        114            30


       119 Karen                      2500        114            30


       120 Matthew                    8000        100            50


       121 Adam                       8200        100            50


       122 Payam                      7900        100            50


       123 Shanta                     6500        100            50


       124 Kevin                      5800        100            50


       125 Julia                      3200        120            50


       126 Irene                      2700        120            50


       127 James                      2400        120            50


       128 Steven                     2200        120            50


       129 Laura                      3300        121            50


       130 Mozhe                      2800        121            50


       131 James                      2500        121            50


       132 TJ                         2100        121            50


       133 Jason                      3300        122            50


       134 Michael                    2900        122            50


       135 Ki                         2400        122            50


       136 Hazel                      2200        122            50


       137 Renske                     3600        123            50


       138 Stephen                    3200        123            50


       139 John                       2700        123            50


       140 Joshua                     2500        123            50


       141 Trenna                     3500        124            50


       142 Curtis                     3100        124            50


       143 Randall                    2600        124            50


       144 Peter                      2500        124            50


       145 John                      14000        100            80


       146 Karen                     13500        100            80


       147 Alberto                   12000        100            80


       148 Gerald                    11000        100            80


       149 Eleni                     10500        100            80


       150 Peter                     10000        145            80


       151 David                      9500        145            80


       152 Peter                      9000        145            80


       153 Christopher                8000        145            80


       154 Nanette                    7500        145            80


       155 Oliver                     7000        145            80


       156 Janette                   10000        146            80


       157 Patrick                    9500        146            80


       158 Allan                      9000        146            80


       159 Lindsey                    8000        146            80


       160 Louise                     7500        146            80


       161 Sarath                     7000        146            80


       162 Clara                     10500        147            80


       163 Danielle                   9500        147            80


       164 Mattea                     7200        147            80



       ENO ENAME                    SALARY MANAGER_ID DEPARTMENT_ID
---------- -------------------- ---------- ---------- -------------
ADDRESS
--------------------------------------------------
       165 David                      6800        147            80


       166 Sundar                     6400        147            80


       167 Amit                       6200        147            80


       168 Lisa                      11500        148            80


       169 Harrison                  10000        148            80


       170 Tayler                     9600        148            80


       171 William                    7400        148            80


       172 Elizabeth                  7300        148            80


       173 Sundita                    6100        148            80


       174 Ellen                     11000        149            80


       175 Alyssa                     8800        149            80


       176 Jonathon                   8600        149            80


       177 Jack                       8400        149            80


       178 Kimberely                  7000        149


       179 Charles                    6200        149            80


       180 Winston                    3200        120            50


       181 Jean                       3100        120            50


       182 Martha                     2500        120            50


       183 Girard                     2800        120            50


       184 Nandita                    4200        121            50


       185 Alexis                     4100        121            50


       186 Julia                      3400        121            50


       187 Anthony                    3000        121            50


       188 Kelly                      3800        122            50


       189 Jennifer                   3600        122            50


       190 Timothy                    2900        122            50


       191 Randall                    2500        122            50


       192 Sarah                      4000        123            50


       193 Britney                    3900        123            50


       194 Samuel                     3200        123            50


       195 Vance                      2800        123            50


       196 Alana                      3100        124            50


       197 Kevin                      3000        124            50


       198 Donald                     2600        124            50


       199 Douglas                    2600        124            50


       200 Jennifer                   4400        101            10


       201 Michael                   13000        100            20


       202 Pat                        6000        201            20


       203 Susan                      6500        101            40


       204 Hermann                   10000        101            70


       205 Shelley                   12000        101           110


       206 William                    8300        205           110



107 rows selected.

SQL> set linesize 300
SQL> select * from emp;

       ENO ENAME                    SALARY MANAGER_ID DEPARTMENT_ID ADDRESS
---------- -------------------- ---------- ---------- ------------- --------------------------------------------------
       100 Steven                    24000                       90
       101 Neena                     17000        100            90
       102 Lex                       17000        100            90
       103 Alexander                  9000        102            60
       104 Bruce                      6000        103            60
       105 David                      4800        103            60
       106 Valli                      4800        103            60
       107 Diana                      4200        103            60
       108 Nancy                     12000        101           100
       109 Daniel                     9000        108           100
       110 John                       8200        108           100
       111 Ismael                     7700        108           100
       112 Jose Manuel                7800        108           100
       113 Luis                       6900        108           100
       114 Den                       11000        100            30
       115 Alexander                  3100        114            30
       116 Shelli                     2900        114            30
       117 Sigal                      2800        114            30
       118 Guy                        2600        114            30
       119 Karen                      2500        114            30
       120 Matthew                    8000        100            50
       121 Adam                       8200        100            50
       122 Payam                      7900        100            50
       123 Shanta                     6500        100            50
       124 Kevin                      5800        100            50
       125 Julia                      3200        120            50
       126 Irene                      2700        120            50
       127 James                      2400        120            50
       128 Steven                     2200        120            50
       129 Laura                      3300        121            50
       130 Mozhe                      2800        121            50
       131 James                      2500        121            50
       132 TJ                         2100        121            50
       133 Jason                      3300        122            50
       134 Michael                    2900        122            50
       135 Ki                         2400        122            50
       136 Hazel                      2200        122            50
       137 Renske                     3600        123            50
       138 Stephen                    3200        123            50
       139 John                       2700        123            50
       140 Joshua                     2500        123            50
       141 Trenna                     3500        124            50
       142 Curtis                     3100        124            50
       143 Randall                    2600        124            50
       144 Peter                      2500        124            50
       145 John                      14000        100            80
       146 Karen                     13500        100            80
       147 Alberto                   12000        100            80
       148 Gerald                    11000        100            80
       149 Eleni                     10500        100            80
       150 Peter                     10000        145            80
       151 David                      9500        145            80
       152 Peter                      9000        145            80
       153 Christopher                8000        145            80
       154 Nanette                    7500        145            80
       155 Oliver                     7000        145            80
       156 Janette                   10000        146            80
       157 Patrick                    9500        146            80
       158 Allan                      9000        146            80
       159 Lindsey                    8000        146            80
       160 Louise                     7500        146            80
       161 Sarath                     7000        146            80
       162 Clara                     10500        147            80
       163 Danielle                   9500        147            80
       164 Mattea                     7200        147            80
       165 David                      6800        147            80
       166 Sundar                     6400        147            80
       167 Amit                       6200        147            80
       168 Lisa                      11500        148            80
       169 Harrison                  10000        148            80
       170 Tayler                     9600        148            80
       171 William                    7400        148            80
       172 Elizabeth                  7300        148            80
       173 Sundita                    6100        148            80
       174 Ellen                     11000        149            80
       175 Alyssa                     8800        149            80
       176 Jonathon                   8600        149            80
       177 Jack                       8400        149            80
       178 Kimberely                  7000        149
       179 Charles                    6200        149            80
       180 Winston                    3200        120            50
       181 Jean                       3100        120            50
       182 Martha                     2500        120            50
       183 Girard                     2800        120            50
       184 Nandita                    4200        121            50
       185 Alexis                     4100        121            50
       186 Julia                      3400        121            50
       187 Anthony                    3000        121            50
       188 Kelly                      3800        122            50
       189 Jennifer                   3600        122            50
       190 Timothy                    2900        122            50
       191 Randall                    2500        122            50
       192 Sarah                      4000        123            50
       193 Britney                    3900        123            50
       194 Samuel                     3200        123            50
       195 Vance                      2800        123            50
       196 Alana                      3100        124            50
       197 Kevin                      3000        124            50
       198 Donald                     2600        124            50
       199 Douglas                    2600        124            50
       200 Jennifer                   4400        101            10
       201 Michael                   13000        100            20
       202 Pat                        6000        201            20
       203 Susan                      6500        101            40
       204 Hermann                   10000        101            70
       205 Shelley                   12000        101           110
       206 William                    8300        205           110

107 rows selected.

SQL> create table emptrc as select * from emp;

Table created.

SQL> select * from emptrc;

       ENO ENAME                    SALARY MANAGER_ID DEPARTMENT_ID ADDRESS
---------- -------------------- ---------- ---------- ------------- --------------------------------------------------
       100 Steven                    24000                       90
       101 Neena                     17000        100            90
       102 Lex                       17000        100            90
       103 Alexander                  9000        102            60
       104 Bruce                      6000        103            60
       105 David                      4800        103            60
       106 Valli                      4800        103            60
       107 Diana                      4200        103            60
       108 Nancy                     12000        101           100
       109 Daniel                     9000        108           100
       110 John                       8200        108           100
       111 Ismael                     7700        108           100
       112 Jose Manuel                7800        108           100
       113 Luis                       6900        108           100
       114 Den                       11000        100            30
       115 Alexander                  3100        114            30
       116 Shelli                     2900        114            30
       117 Sigal                      2800        114            30
       118 Guy                        2600        114            30
       119 Karen                      2500        114            30
       120 Matthew                    8000        100            50
       121 Adam                       8200        100            50
       122 Payam                      7900        100            50
       123 Shanta                     6500        100            50
       124 Kevin                      5800        100            50
       125 Julia                      3200        120            50
       126 Irene                      2700        120            50
       127 James                      2400        120            50
       128 Steven                     2200        120            50
       129 Laura                      3300        121            50
       130 Mozhe                      2800        121            50
       131 James                      2500        121            50
       132 TJ                         2100        121            50
       133 Jason                      3300        122            50
       134 Michael                    2900        122            50
       135 Ki                         2400        122            50
       136 Hazel                      2200        122            50
       137 Renske                     3600        123            50
       138 Stephen                    3200        123            50
       139 John                       2700        123            50
       140 Joshua                     2500        123            50
       141 Trenna                     3500        124            50
       142 Curtis                     3100        124            50
       143 Randall                    2600        124            50
       144 Peter                      2500        124            50
       145 John                      14000        100            80
       146 Karen                     13500        100            80
       147 Alberto                   12000        100            80
       148 Gerald                    11000        100            80
       149 Eleni                     10500        100            80
       150 Peter                     10000        145            80
       151 David                      9500        145            80
       152 Peter                      9000        145            80
       153 Christopher                8000        145            80
       154 Nanette                    7500        145            80
       155 Oliver                     7000        145            80
       156 Janette                   10000        146            80
       157 Patrick                    9500        146            80
       158 Allan                      9000        146            80
       159 Lindsey                    8000        146            80
       160 Louise                     7500        146            80
       161 Sarath                     7000        146            80
       162 Clara                     10500        147            80
       163 Danielle                   9500        147            80
       164 Mattea                     7200        147            80
       165 David                      6800        147            80
       166 Sundar                     6400        147            80
       167 Amit                       6200        147            80
       168 Lisa                      11500        148            80
       169 Harrison                  10000        148            80
       170 Tayler                     9600        148            80
       171 William                    7400        148            80
       172 Elizabeth                  7300        148            80
       173 Sundita                    6100        148            80
       174 Ellen                     11000        149            80
       175 Alyssa                     8800        149            80
       176 Jonathon                   8600        149            80
       177 Jack                       8400        149            80
       178 Kimberely                  7000        149
       179 Charles                    6200        149            80
       180 Winston                    3200        120            50
       181 Jean                       3100        120            50
       182 Martha                     2500        120            50
       183 Girard                     2800        120            50
       184 Nandita                    4200        121            50
       185 Alexis                     4100        121            50
       186 Julia                      3400        121            50
       187 Anthony                    3000        121            50
       188 Kelly                      3800        122            50
       189 Jennifer                   3600        122            50
       190 Timothy                    2900        122            50
       191 Randall                    2500        122            50
       192 Sarah                      4000        123            50
       193 Britney                    3900        123            50
       194 Samuel                     3200        123            50
       195 Vance                      2800        123            50
       196 Alana                      3100        124            50
       197 Kevin                      3000        124            50
       198 Donald                     2600        124            50
       199 Douglas                    2600        124            50
       200 Jennifer                   4400        101            10
       201 Michael                   13000        100            20
       202 Pat                        6000        201            20
       203 Susan                      6500        101            40
       204 Hermann                   10000        101            70
       205 Shelley                   12000        101           110
       206 William                    8300        205           110

107 rows selected.

SQL> truncate table emptrc;

Table truncated.

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
EMPTRC                         TABLE

14 rows selected.

SQL> select * from emptrc;

no rows selected

SQL> drop table emptrc;

Table dropped.

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
BIN$kevVwfPEQYyAxwajuAUClg==$0 TABLE

14 rows selected.

SQL> purge recyclebin;

Recyclebin purged.

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

SQL>