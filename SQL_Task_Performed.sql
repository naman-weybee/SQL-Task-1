
--1) --> Given SQL query will execute successfully: TRUE/FALSE SELECT last_name, job_id, salary AS Sal FROM employees;
-- Ans --> TRUE

--2) -->  Identity errors in the following statement: SELECT employee_id, last_name, sal*12 ANNUAL SALARY FROM employees;
-- SALARY must use instead of sal and AS is missing

--3) -->  Write a query to determine the structure of the table 'DEPARTMENTS'
select * from DEPARTMENTS;

--4) -->  Write a query to determine the unique Job IDs from the EMPLOYEES table.
select distinct JOB_ID
from [employee table];

--5) --> Write a query to display the employee number, lastname, salary (oldsalary), salary increased by 15.5% name it has NewSalary and subtract the (NewSalary from OldSalary) name the column as Increment.
select EMPLOYEE_ID, LAST_NAME, SALARY, SALARY + SALARY * 0.155 as NewSalary, SALARY * 0.155 as Increment
from [employee table];

--6) --> Write a query to display the minimum, maximum, sum and average salary for each job type.
select min(SALARY) as Minimum_SALARY, max(SALARY) as Maximum_SALARY, sum(SALARY) as Total_SALARY, avg(SALARY) as Average_SALARY
from [employee table]
inner join JOBS
on JOBS.JOB_ID = [employee table].JOB_ID
group by [employee table].JOB_ID;

--7) --> The HR department needs to find the names and hire dates of all employees who were hired before their managers, along with their managers’ names and hire dates.
select e.First_Name, e.Last_Name, e.Hire_Date, m.MANAGER_NAME, m.HIRE_DATE
from [employee table] as e
inner join Manager as m
on e.MANAGER_ID = m.MANAGER_ID
where m.HIRE_DATE > e.HIRE_DATE;

--8) --> Create a report for the HR department that displays employee last names, department numbers, and all the employees who work in the same department as a given employee.
select e1.LAST_NAME, e1.DEPARTMENT_ID
from [employee table] as e1, [employee table] as e2
where e1.DEPARTMENT_ID = e2.DEPARTMENT_ID
and e1.EMPLOYEE_ID <> e2.EMPLOYEE_ID;

--9) --> Find the highest, lowest, sum, and average salary of all employees. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.
select max(SALARY) as Maximum, min(SALARY) as Minimum, sum(SALARY) as Sum, avg(SALARY) as Average
from [employee table];

--10) --> Create a report that displays list of employees whose salary is more than the salary of any employee from department 60.
select * from [employee table]
where SALARY > any
(select SALARY from [employee table] where DEPARTMENT_ID = 60);

--11) --> Create a report that displays last name and salary of every employee who reports to King(Use any manager name instead of King).
select e.SALARY, e.LAST_NAME
from [employee table] as e
where e.EMPLOYEE_ID in
(select MANAGER_ID from [employee table] where LAST_NAME = 'shah');

--12) --> Write a query to display the list of department IDs for departments that do not contain the job Id ST_CLERK(Add this job ST_CLERK to Job table). Use SET Operator for this query
select DEPARTMENT_ID
from JOBS
inner join [employee table]
on JOBS.JOB_ID = [employee table].JOB_ID
where JOB_TITLE <> 'ST_CLERK '
union
select DEPARTMENT_ID
from JOBS
inner join [employee table]
on JOBS.JOB_ID = [employee table].JOB_ID
where JOB_TITLE <> 'ST_CLERK ';

--13) --> Write a query to display the list of employees who work in department 50 and 80. Show employee Id, job Id and department Id by using set operators. - Add 50 and 80 department Id to department table
select EMPLOYEE_ID, JOB_ID, DEPARTMENT_ID
from [employee table]
where DEPARTMENT_ID = 50
union
select EMPLOYEE_ID, JOB_ID, DEPARTMENT_ID
from [employee table]
where DEPARTMENT_ID = 80;