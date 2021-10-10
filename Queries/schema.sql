create table Departments (
	dept_no varchar(4) NOT NULL,
	dept_name varchar(40) NOT NULL,
        primary key (dept_no),
	unique (dept_name)
);

create table Employees (
	emp_no int NOT NULL,
	birth_date date NOT NULL,
	first_name varchar(15),
	last_name varchar(20),
	gender varchar(1),
	hire_date date,
	primary key (emp_no)
);

create table Salaries (
	emp_no int NOT NULL,
	salary int NOT NULL,
	from_date date NOT NULL,
	to_date date,
	primary key (emp_no)
);

create table Managers (
	dept_no varchar(4) NOT NULL,
	emp_no int NOT NULL,
	from_date date NOT NULL,
	to_date date,
	primary key (dept_no,emp_no)
);

create table Dept_Emp (
	emp_no int NOT NULL,
	dept_no varchar(4) NOT NULL,
	from_date date NOT NULL,
	to_date date,
	primary key (emp_no,dept_no)
);

create table Titles (
	emp_no int NOT NULL,
	title varchar(20) NOT NULL,
	from_date date NOT NULL,
	to_date date,
	primary key (emp_no,title,from_date)
);

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


-- Create Foreign Keys
ALTER TABLE Salaries ADD CONSTRAINT salaries_emp_no_fk
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE;
  
ALTER TABLE Managers ADD CONSTRAINT managers_emp_no_fk
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE;

ALTER TABLE Managers ADD CONSTRAINT managers_dept_no_fk
  FOREIGN KEY (dept_no) REFERENCES Departments (dept_no) ON DELETE CASCADE;
  
ALTER TABLE Dept_Emp ADD CONSTRAINT dept_emp_emp_no_fk
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE;

ALTER TABLE Dept_Emp ADD CONSTRAINT dept_emp_dept_no_fk
  FOREIGN KEY (dept_no) REFERENCES Departments (dept_no) ON DELETE CASCADE;
  
ALTER TABLE Titles ADD CONSTRAINT titles_emp_no_fk
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE;
