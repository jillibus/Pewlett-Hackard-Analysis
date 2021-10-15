-- Create Tables
-- Department Table (Lookup Table) 
CREATE TABLE Departments (
	dept_no      VARCHAR(4)  NOT NULL,
	dept_name    VARCHAR(40) NOT NULL,
        PRIMARY KEY (dept_no),
	unique (dept_name)
);

-- Titles Table (Lookup Table)
CREATE TABLE Titles (         
        emp_no    INT         NOT NULL,
        title     VARCHAR(20) NOT NULL,
        from_date DATE        NOT NULL,
        to_date   DATE,
        PRIMARY KEY (emp_no,title,from_date)
);

-- Employee Table
CREATE TABLE Employees (
	emp_no     INT  NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(15),
	last_name  VARCHAR(20),
	gender     VARCHAR(1),
	hire_date  DATE,
	PRIMARY KEY (emp_no)
);

-- Salary Table
CREATE TABLE Salaries (
	emp_no     INT  NOT NULL,
	salary     INT  NOT NULL,
	from_date  DATE NOT NULL,
	to_date    DATE,
	PRIMARY KEY (emp_no)
);

-- Manager Table
CREATE TABLE Managers (
	dept_no   VARCHAR(4) NOT NULL,
	emp_no    INT        NOT NULL,
	from_date DATE       NOT NULL,
	to_date   DATE,
	PRIMARY KEY (dept_no,emp_no)
);

-- Department Employee Table
CREATE TABLE Dept_Emp (
	emp_no    INT        NOT NULL,
	dept_no   VARCHAR(4) NOT NULL,
	from_date DATE       NOT NULL,
	to_date   DATE,
	PRIMARY KEY (emp_no,dept_no)
);

-- Create new TABLE for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
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
