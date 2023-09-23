
SQL*Plus: Release 10.2.0.1.0 - Production on Wed Feb 15 20:17:56 2023

Copyright (c) 1982, 2005, Oracle.  All rights reserved.

Enter user-name: secb
Enter password:

Connected to:
Oracle Database 10g Express Edition Release 10.2.0.1.0 - Production

SQL> select * from cat;

TABLE_NAME                     TABLE_TYPE
------------------------------ -----------
STUDENT                        TABLE
COURSE                         TABLE

SQL> select * from student;

       RNO SNAME                          CNIC
---------- ------------------------------ ----------------
ADDRESS                                  DEPARTMENT
---------------------------------------- -------------------------
       130 Hamza Javed                    12345-1223432-3
Swat                                     ICS/IT

        94 Shayan                         12300-1223432-5
Peshawar                                 ICS/IT


SQL> select * from course
  2  ;

CCODE             RNO CNAME                     MARKS
---------- ---------- -------------------- ----------
OS01              130 Operating System             97
CC02              130 Compiler Constrctn           97
OS01               94 Operating System             94

SQL> set pagesize 200
SQL> set linesize 200
SQL> select * from student;

       RNO SNAME                          CNIC             ADDRESS                                  DEPARTMENT
---------- ------------------------------ ---------------- ---------------------------------------- -------------------------
       130 Hamza Javed                    12345-1223432-3  Swat                                     ICS/IT
        94 Shayan                         12300-1223432-5  Peshawar                                 ICS/IT

SQL> desc student
 Name
           Null?    Type
 ----------------------------------------------------------------------------------------------------------------- -------- ----------------------------------------------------------------------------
 RNO
           NOT NULL NUMBER(3)
 SNAME
                    VARCHAR2(30)
 CNIC
                    VARCHAR2(16)
 ADDRESS
                    VARCHAR2(40)
 DEPARTMENT
                    VARCHAR2(25)

SQL> set linesize 120
SQL> insert into student values(&rno,'&sname','&cnic','&address','&department');
Enter value for rno: 119
Enter value for sname: Hasnain Ghani
Enter value for cnic: 12345-8765435-6
Enter value for address: Swabi
Enter value for department: ICS/IT
old   1: insert into student values(&rno,'&sname','&cnic','&address','&department')
new   1: insert into student values(119,'Hasnain Ghani','12345-8765435-6','Swabi','ICS/IT')

1 row created.

SQL> /
Enter value for rno: 123
Enter value for sname: Haseeb
Enter value for cnic: 32443-3445235-3
Enter value for address: Nowshehra
Enter value for department: ICS/IT
old   1: insert into student values(&rno,'&sname','&cnic','&address','&department')
new   1: insert into student values(123,'Haseeb','32443-3445235-3','Nowshehra','ICS/IT')

1 row created.

SQL> commit
  2  ;

Commit complete.

SQL> insert into student(rno,sname) values(&rno,'&sname);
Enter value for rno: 129
Enter value for sname: Kashif Khan
old   1: insert into student(rno,sname) values(&rno,'&sname)
new   1: insert into student(rno,sname) values(129,'Kashif Khan)
ERROR:
ORA-01756: quoted string not properly terminated


SQL> ed
Wrote file afiedt.buf

  1* insert into student(rno,sname) values(&rno,'&sname')
SQL> /
Enter value for rno: 129
Enter value for sname: Kashif Khan
old   1: insert into student(rno,sname) values(&rno,'&sname')
new   1: insert into student(rno,sname) values(129,'Kashif Khan')

1 row created.

SQL> /
Enter value for rno: 115
Enter value for sname: Abdul Hannan
old   1: insert into student(rno,sname) values(&rno,'&sname')
new   1: insert into student(rno,sname) values(115,'Abdul Hannan')

1 row created.

SQL> /
Enter value for rno: 73
Enter value for sname: Muhammad Asim
old   1: insert into student(rno,sname) values(&rno,'&sname')
new   1: insert into student(rno,sname) values(73,'Muhammad Asim')

1 row created.

SQL> commit
  2  ;

Commit complete.

SQL>
SQL> select * from student;

       RNO SNAME                          CNIC             ADDRESS
---------- ------------------------------ ---------------- ----------------------------------------
DEPARTMENT
-------------------------
       130 Hamza Javed                    12345-1223432-3  Swat
ICS/IT

        94 Shayan                         12300-1223432-5  Peshawar
ICS/IT

       119 Hasnain Ghani                  12345-8765435-6  Swabi
ICS/IT

       123 Haseeb                         32443-3445235-3  Nowshehra
ICS/IT

       129 Kashif Khan


       115 Abdul Hannan


        73 Muhammad Asim



7 rows selected.

SQL> select rno,sname,department from student;

       RNO SNAME                          DEPARTMENT
---------- ------------------------------ -------------------------
       130 Hamza Javed                    ICS/IT
        94 Shayan                         ICS/IT
       119 Hasnain Ghani                  ICS/IT
       123 Haseeb                         ICS/IT
       129 Kashif Khan
       115 Abdul Hannan
        73 Muhammad Asim

7 rows selected.

SQL> select * from student where department = 'ICS/IT';

       RNO SNAME                          CNIC             ADDRESS
---------- ------------------------------ ---------------- ----------------------------------------
DEPARTMENT
-------------------------
       130 Hamza Javed                    12345-1223432-3  Swat
ICS/IT

        94 Shayan                         12300-1223432-5  Peshawar
ICS/IT

       119 Hasnain Ghani                  12345-8765435-6  Swabi
ICS/IT

       123 Haseeb                         32443-3445235-3  Nowshehra
ICS/IT


SQL> select rno,sname,department from student where department = 'ICS/IT';

       RNO SNAME                          DEPARTMENT
---------- ------------------------------ -------------------------
       130 Hamza Javed                    ICS/IT
        94 Shayan                         ICS/IT
       119 Hasnain Ghani                  ICS/IT
       123 Haseeb                         ICS/IT

SQL>