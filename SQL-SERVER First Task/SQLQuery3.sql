-----------------------------TASK1-Start

Create Database CompanyDb

use CompanyDb

Create Table Employees 
(
	Id int identity primary key,
	Name nvarchar(100) constraint NN_EMP_NAME Not null,
	SurName nvarchar(100) not null,
	Position nvarchar(100) Constraint POSITION not null,
	Salary money 
)

Insert into Employees(Name, Surname,Position,Salary)
values
('Nurlan','Rahimli','Web Developer',3000),
('Samir','Aliyev','Administrative assistant',5000),
('Elmir','Abdullayev','Project manager',7000)

Select Name,SurName,Salary  From Employees Where Salary  > (Select Avg(Salary) from Employees )

Select  MAX(Salary) 'Maximum Salary' From Employees 

Select  MIN(Salary) 'Minimum Salary' From Employees 


-----------------------------TASK1-End




-----------------------------TASK2-Start

Create Database MarketDb

Use MarketDb

Create Table Products 
(
	Id int identity primary key,
	Name nvarchar(100) constraint NN_PRO_NAME Not null,
	Price money
)

Alter Table Products Add Brand nvarchar(100)

Insert into Products(Name, Price,Brand)
values
('Yogurt',1,'Danone'),
('Juice',4,'Sprite'),
('Shampoo',5,'Palmolive'),
('Soap ',3,'Sunlight '),
('Chocolate ',2,'Nestle'),
('Beauty Soap"',2,'LUX'),
('Deodorants',6,'Dove'),
('major shampoo',4,'Sunsilk'),
('Noodle',3,'Indomie'),
('Coffee',1,'Nescafe')

Select * From Products where Price < (Select Avg(Price) From Products)


Select * From Products where Price > 10

--Mellim mende qiymeti 10-nan yuxari yoxdu diye asagida hecne gormeye bilersiz ama bele duz olmalidi mence

Select 'Name : ' + Name + '  ' + ' Brand : ' + Brand ProductInfo , Price from Products where len(Brand) > 5


-----------------------------TASK2-End




-----------------------------TASK3-Start

Create Database EmployeesAndDepartmentsDb

Use EmployeesAndDepartmentsDb


--Mellim burda one teref department olacaq many teref employees


Create Table Departments
(
	Id int identity primary key,
	Name nvarchar(100) Constraint NN_DEPARTMENTS_NAME Not null Check(Len(Name)>2)
)

Create Table Employees
(
	Id int identity primary key,
	FullName nvarchar(100) Constraint NN_EMPLOYEES_FULLNAME Not null Check(LEN(FullName)>3),
	Salary money Check(Salary>0),
	Email nvarchar(100) Constraint NN_EMPLOYEES_EMAIL Not null unique,
	DepartmentId int Constraint NN_EMPLOYEES_DEPARTMENTID Not null foreign key references Departments(Id)
)


-----------------------------TASK3-End

