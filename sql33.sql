-- Creating Database sql33

create database sql33;

  use sql33;

-- Creating EmployeeInfo Table 1

create table EmployeeInfo (
Empid int primary key,
EmpFname varchar(50),
EmpLname varchar(50),
Department varchar(20),
Project varchar(10),
Address varchar(100),
DOB Date,
Gender varchar(10));

select * from EmployeeInfo;

-- Inserting values to the table 1

insert into EmployeeInfo
values(1,'Sanjay','Mehra','HR','P1','Hyderabad(HYD)','1976-12-01','M'),
      (2,'Ananya','Mishra','Admin','P2','Delhi(DEL)','1968-05-02','F'),
      (3,'Rohan','Diwan','Account','P3','Mumbai(BOM)','1980-01-01','M'),
      (4,'Sonia','Kulkarni','HR','P1','Hyderabad(HYD)','1992-05-02','F'),
      (5,'Ankit','Kapoor','Admin','P2','Delhi(DEL)','1994-07-03','M');
      
-- Creating Another table  EmployeePosition

create table EmployeePosition (
EmpID int,
EmpPosition varchar(50),
DateOfJoining Date,
Salary int check (salary > 0));

-- inserting values to the EmployeePosition table

insert into EmployeePosition
values(1,'Manager','2024-05-01',500000),
      (2,'Executive','2024-05-02',75000),
      (3,'Manager','2024-05-01',90000),
      (2,'Lead','2024-05-02',85000),
      (1,'Executive','2024-05-01',300000);
      
select * from Employeeposition;

-- Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.
select upper(EmpFname) as EmpName from EmployeeInfo;
select Lower(EmpLname) from Employeeinfo;

-- Write a query to fetch the number of employees working in the department ‘HR’.
select department,count(department) from employeeinfo
where department = 'HR';
-- Write a query to get the current date.
select sysdate();

-- Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
select substring(empfname,1,4) from employeeinfo;
select substr(empfname,2,3) from employeeinfo;

-- Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.
	
SELECT MID(Address, 1, LOCATE( '(',Address)) FROM EmployeeInfo;

-- Write a query to create a new table that consists of data and structure copied from the other table.

create table NewTable as select * from employeeinfo;
select * from NewTable;

-- Write q query to find all the employees whose salary is between 50000 to 100000.
select * from employeeposition
where salary between 50000 and 100000;
-- Write a query to find the names of employees that begin with ‘S’
select * from employeeinfo
where empfname like 's%';
-- Write a query to fetch top N records.
select * from Employeeposition;

select * from Employeeposition
order by salary desc
limit 1 offset 2;
-- Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.

select concat(EmpFname,' ',emplname) as full_name
from employeeinfo;

--  Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender
select Gender,dob from employeeinfo
where DOB between '1970-05-02' and '1985-12-31'
group by Gender,dob;

--  Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.

    select * from employeeinfo
    order by emplname desc, department asc;
    
    select * from employeeinfo
    where empid%2=0;
    
  select * from employeeinfo
  where empFname like 'a%';
  
  -- Q13. Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.
select * from employeeinfo where emplname like '____%A';  

  -- Q14. Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.
  select * from employeeinfo
  where empfname <> 'sanjay' and empfname <> 'sonia';
  
  select * from employeeinfo
  where empfname not in ('sanjay','sonia');
  
  -- Q15. Write a query to fetch details of employees with the address as “DELHI(DEL)”.
  select * from employeeinfo
  where address like 'delhi(del)%';
  
  -- Q16. Write a query to fetch all employees who also hold the managerial position.
  select * from employeeposition
  where EmpPosition like 'manager%';
  
  -- Q17. Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.
  
  select department,count(department) as dept_count
  from employeeinfo
  group by department
  order by dept_count;
  
  -- Q18. Write a query to calculate the even and odd records from a table.
  
  select * from employeeinfo
  where empid % 2 = 0;
  
  select * from employeeinfo
  where empid % 2 <> 0;
  
  -- Q19. Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.
  select * from employeeinfo
  inner join employeeposition
  on employeeinfo.empid = employeeposition.empid;
  -- Q20. Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.
 (select max(salary) as max_sal
 from employeeposition
 order by max_sal desc
 limit 1)
 union all
 (select min(salary) as min_sal
 from employeeposition
 order by min_sal
 limit 1);
  
SELECT DISTINCT Salary FROM EmployeePosition e1
WHERE 2 >= (SELECT COUNT(DISTINCT Salary)FROM EmployeePosition e2
WHERE e1.Salary >= e2.Salary) ORDER BY e1.Salary DESC;
  
SELECT DISTINCT Salary FROM EmployeePosition e1 
WHERE 2 >= (SELECT COUNT(DISTINCT Salary) FROM EmployeePosition e2 
WHERE e1.Salary <= e2.Salary) ORDER BY e1.Salary DESC;
  
  -- Q21. Write a query to find the Nth highest salary from the table without using TOP/limit keyword.
  

  
  -- Q22. Write a query to retrieve duplicate records from a table.
select distinct empid from employeeposition;

  -- Q23. Write a query to retrieve the list of employees working in the same department.
select * from employeeinfo;

 
  -- Q24. Write a query to retrieve the last 3 records from the EmployeeInfo table.
  
  select * from employeeinfo
  order by empid desc
  limit 3;
  
SELECT * FROM EmployeeInfo WHERE
EmpID >=3 UNION SELECT * FROM
(SELECT * FROM EmployeeInfo E ORDER BY E.EmpID DESC) 
AS E1 WHERE E1.EmpID >=3;

  -- Q25. Write a query to find the third-highest salary from the EmpPosition table.
select * from employeeposition;

select * from employeeposition
order by salary desc
limit 1 offset 2;

  -- Q26. Write a query to display the first and the last record from the EmployeeInfo table.
  (select * from employeeinfo
  order by empid 
  limit 1)
  union all
  (select * from employeeinfo
  order by empid desc
  limit 1);
  
  -- Q27. Write a query to add email validation to your database
alter table employeeinfo
add column email varchar(50);

select * from employeeinfo;
update employeeinfo
set email = 'sand24@gmail.com'
where empid = 5;
  -- Q28. Write a query to retrieve Departments who have less than 2 employees working in it.
  
  select Department,count(Department) as dept_count
  from employeeinfo
  group by department
  having dept_count < 2;
   
   -- Q29. Write a query to retrieve EmpPostion along with total salaries paid for each of them.
   select sum(salary),empposition from employeeposition
   group by salary,empposition;
   
   select * from employeeposition;
   
   -- Q30. Write a query to fetch 50% records from the EmployeeInfo table.
   select * from employeeinfo
   where empid <= (select count(empid)/2 from employeeinfo);
   
