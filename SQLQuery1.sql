use CodedNotionTasks30122024SQL --creating a datbase
go
create schema codedNotion --creating s schema
go 
create table codedNotion.Employees   --creating table 1
(
EmployeeID int primary key identity (1,1),
EmployeeName nvarchar(50),
Position nvarchar(30),
Salary money,
Department_ID int,
Date_of_joining Datetime
)
go
create table codedNotion.Departments --creating table 2
(
DepartmentID int primary key identity (1,1),
DepartmentName varchar(50),
Location varchar(100)
)

drop table codedNotion.Employees -- i forgot to put identity, so i deleted the tables and entered them again
drop table codedNotion.Departments 

insert into codedNotion.Employees --inserting data to table 1
values
('Jhon Doe', 'Manager', 6000, 1, GETDATE()),
('Jane Smith', 'Developer', 4500, 2, GETDATE()),
('Alan Turing', 'Analyst', 4000, 3, GETDATE()),
('Grace Hopper', 'Scientist', 7000, 1, GETDATE()),
('Ada Lovelace', 'Developer', 5000, 2, GETDATE())


insert into codedNotion.Departments --inserting data to table 2
values 
('HR', 'New York'),
('IT', 'San Francisco'),
('Finance', 'Chicago')

insert into codedNotion.Employees --inserting an employee to table employees
values
('Shahad Eissa', 'Officer', 2000, 2, GETDATE())
select * --checking
from codedNotion.Employees

select *--updating salary for jane smith
from codedNotion.Employees
update  codedNotion.Employees
set Salary = 5000
where EmployeeName ='Jane Smith'
select * --checking
from codedNotion.Employees

select *--seeing the table before the change
from codedNotion.Employees
delete from codedNotion.Employees where employeeId = 3 --deleting employee with id = 3
select *  --checking
from codedNotion.Employees

select * -- viewing employee table 
from codedNotion.Employees 
select * -- viewing all employees that work in IT department
from codedNotion.Employees 
where Department_ID = 2 

insert into codedNotion.Departments --inserting a new department
values
('operation', 'Kuwait')
select * --checking
from codedNotion.Departments 

select DepartmentName,location -- viewing all names of all departments located in new york (note: removed the dep id here)
from codedNotion.Departments
where Location = 'New York'


select *--checking table before next step
from codedNotion.Departments 
update codedNotion.Departments --updating the hr location to be in boston
set location = 'Boston'
where DepartmentName  = 'HR'
select * 
from codedNotion.Departments


select *-- viewing table before change
from codedNotion.Employees 
update codedNotion.Employees -- updating salaries to be increased by 10%
set Salary = salary * 1.10
select * -- checking
from codedNotion.Employees 


-- i am going to add this row again because 
--the only finance dep employee was deleted during deleting employee with id=3
insert into codedNotion.employees 
values ('Alan Turing', 'Analyst', 4000, 3, GETDATE())

select * --viewing
from codedNotion.employees
delete from codedNotion.employees 
where Department_ID  --until here it looks the same as usual 
in (select DepartmentID --however here  i used subqueruy, i put dept id because i cannt put dept name as  i cannot compare an int to a varchar
from codedNotion.Departments
where DepartmentName = 'Finance')
select *-- checking
from codedNotion.employees

insert into codedNotion.employees 
values ('estabraq nabeel', 'IT underdevelopment', 1000, 2, GETDATE())
select *-- checking
from codedNotion.employees