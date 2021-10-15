Deliverable 1: The number of Retiring Employees by Title

SELECT emp_no, first_name, last_name 
FROM employees
LIMIT 10;

SELECT title, from_date, to_date
FROM titles
LIMIT 10;

-- General Employee Information with Title, Birth DataDatee and Hire Date Info
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_info
FROM employees e
INNER JOIN titles t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_info
LIMIT 10;

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO retirement_cur_emp
FROM retirement_info 
ORDER BY emp_no, from_date DESC;

SELECT * FROM retirement_cur_emp;

SELECT title, count(*) AS "number" 
INTO retirement_cnt_title
FROM retirement_cur_emp
GROUP BY title;

SELECT * FROM retirement_cnt_title;

Deliverable 2: The Employees Eligible for the Mentorship Program

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_info
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

Deliverable 3: A written report on the employee database analysis (Readme.md)


