insert into JOBS(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
values(1, 'designer', 2000, 15000),
(2, 'developer', 3000, 18000),
(3, 'qa', 2500, 16000),
(4, 'hardware manager', 4000, 20000),
(5, 'software manager', 5000, 25000);

update JOBS
set JOB_TITLE = 'ST_CLERK '
where JOB_ID = 3;

select * from JOBS;

insert into DEPARTMENTS( DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
values(1, 'compt - a', 1234, '203 bleeker street'),
(2, 'compt - b', 5678, '109 bleeker street'),
(3, 'compt - c', 1357, '405 bleeker street'),
(4, 'compt - d', 2468, '379 bleeker street'),
(5, 'compt - e', 1480, '104 bleeker street');

select * from DEPARTMENTS;

insert into [employee table] (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values(1, 'jonas', 'shah', 'jonas.shah@gmail.com', 8613478956, '1999-09-23', 1, 10000, 0.2, 1234, 1),
(2, 'jay', 'shukla', 'jay.shukla@gmail.com', 4568921476, '2001-12-15', 2, 15000, 0.25, 5678, 2),
(3, 'aman', 'shah', 'aman.shah@gmail.com', 6147856923, '1998-12-23', 3, 12000, 0.15, 1357, 3),
(4, 'amrit', 'pandya', 'amrit.pandya@gmail.com', 7412584578, '2005-06-07', 4, 15000, 0.1, 2468, 4),
(5, 'gojo', 'satoru', 'gojo.satoru@gmail.com', 2346798915, '2004-12-08', 5, 20000, 0.2, 1480, 5);
select * from [employee table];

insert into DEPARTMENTS
values(50, 'compt - f', 1010, '203 operim street'),
(80, 'compt - g', 2020, '199 operim street');

insert into DEPARTMENTS
values(60, 'compt - g', 4568, '582 operim street');

insert into [employee table]
values(6, 'amit', 'joshi', 'amrit.joshi@gmail.com', 4578964512, '2012-06-23', 6, 15000, 0.1, 2468, 50),
(7, 'sukuna', 'satoru', 'sukuna.satoru@gmail.com', 1234758962, '2008-12-05', 7, 20000, 0.2, 1480, 80);

insert into JOBS
values(6, 'front end developer', 2000, 30000),
(7, 'back end developer', 5000, 50000);

insert into JOBS
values(8, 'full stack developer', 4000, 80000);

insert into [employee table]
values(8, 'jayesh', 'joshi', 'jayesh.joshi@gmail.com', 7896412578, '2001-06-03', 8, 5000, 0.15, 4571, 60);
