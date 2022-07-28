--1) --> Given SQL query will execute successfully: TRUE/FALSE SELECT last_name, job_id, salary AS Sal FROM employees;
-- Ans --> TRUE

--2) -->  Identity errors in the following statement: SELECT employee_id, last_name, sal*12 ANNUAL SALARY FROM employees;
-- Note ------->	SALARY must use instead of sal and error in aliasing, correct query can be write like this...
-- Solution --> SELECT employee_id, last_name, SALARY*12 [ANNUAL SALARY] FROM employees;

--3) -->  Write a query to determine the structure of the table 'DEPARTMENTS'
select * from DEPARTMENTS;

--4) -->  Write a query to determine the unique Job IDs from the EMPLOYEES table.
select distinct JOB_ID
from [employee table];

--5) --> Write a query to display the employee number, lastname, salary (oldsalary), salary increased by 15.5% name it has NewSalary and subtract the (NewSalary from OldSalary) name the column as Increment.
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY AS oldSALARY, (SALARY + SALARY * 0.155) as NewSalary, ((SALARY + SALARY * 0.155) - SALARY) as Increment
from [employee table];

--6) --> Write a query to display the minimum, maximum, sum and average salary for each job type.
select JOBS.JOB_TITLE, min(SALARY) as Minimum_SALARY, max(SALARY) as Maximum_SALARY, sum(SALARY) as Total_SALARY, avg(SALARY) as Average_SALARY
from [employee table]
inner join JOBS
on JOBS.JOB_ID = [employee table].JOB_ID
group by JOBS.JOB_TITLE;

--7) --> The HR department needs to find the names and hire dates of all employees who were hired before their managers, along with their managers’ names and hire dates.
select e1.FIRST_NAME AS [EMPLOYEE NAME], e2.FIRST_NAME AS [MANAGER NAME], e1.HIRE_DATE as [EMPLOYEE DATE], e2.HIRE_DATE as [MANAGER DATE]
from [employee table] as e1
inner join [employee table] as e2
on e1.MANAGER_ID = e2.MANAGER_ID
where e1.HIRE_DATE < e2.HIRE_DATE;

--8) --> Create a report for the HR department that displays employee last names, department numbers, and all the employees who work in the same department as a given employee.
create view HR_Department as
select e1.LAST_NAME as Emp_Name, e1.DEPARTMENT_ID, e2.LAST_NAME as Same_emp, e2.DEPARTMENT_ID as SameID
from [employee table] e1
inner join [employee table] as e2
on e1.DEPARTMENT_ID = e2.DEPARTMENT_ID
where e1.LAST_NAME <> e2.LAST_NAME;
select * from HR_Department;

--9) --> Find the highest, lowest, sum, and average salary of all employees. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.
select round(max(SALARY), 0) as Maximum, round(min(SALARY), 0) as Minimum, round(sum(SALARY), 0) as Sum, round(avg(SALARY), 0) as Average
from [employee table];

--10) --> Create a report that displays list of employees whose salary is more than the salary of any employee from department 60.
create view Salary_Report as
select * from [employee table]
where SALARY > any
(select SALARY from [employee table] where DEPARTMENT_ID = 60);
select * from Salary_Report;

--11) --> Create a report that displays last name and salary of every employee who reports to King(Use any manager name instead of King).
create view King_Report as
select e.LAST_NAME, e.SALARY
from [employee table] as e
where e.EMPLOYEE_ID in
(select MANAGER_ID from [employee table] where LAST_NAME = 'shah');
select * from King_Report;

--12) --> Write a query to display the list of department IDs for departments that do not contain the job Id ST_CLERK(Add this job ST_CLERK to Job table). Use SET Operator for this query
select DEPARTMENT_ID
from JOBS
inner join [employee table]
on JOBS.JOB_ID = [employee table].JOB_ID
where JOB_TITLE <> 'ST_CLERK'
union
select DEPARTMENT_ID
from JOBS
inner join [employee table]
on JOBS.JOB_ID = [employee table].JOB_ID
where JOB_TITLE <> 'ST_CLERK';

--13) --> Write a query to display the list of employees who work in department 50 and 80. Show employee Id, job Id and department Id by using set operators. - Add 50 and 80 department Id to department table
select EMPLOYEE_ID, JOB_ID, DEPARTMENT_ID
from [employee table]
where DEPARTMENT_ID = 50
union
select EMPLOYEE_ID, JOB_ID, DEPARTMENT_ID
from [employee table]
where DEPARTMENT_ID = 80;
