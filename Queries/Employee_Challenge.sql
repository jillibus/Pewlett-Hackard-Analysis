Deliverable 1: The number of Retiring Employees by Title

-- General Employee Information with Title, Birth DataDatee and Hire Date Info
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees e
INNER JOIN titles t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles
LIMIT 10;

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, from_date DESC;

SELECT * FROM unique_titles;

SELECT count(title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title;

SELECT * FROM retiring_titles;

Deliverable 2: The Employees Eligible for the Mentorship Program

-- General Employee Information for Mentorship Program
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, 
    de.from_date, de.to_date, t.titles
INTO mentorship_eligability
FROM employees e
INNER JOIN dept_emp de
ON (e.emp_no = de.emp_no)
INNER JOIN titles t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
  AND de.to_date = '9999-01-01'
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligability;

Deliverable 3: A written report on the employee database analysis (Readme.md)


