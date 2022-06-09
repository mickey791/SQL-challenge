-- 1. Create a Departments table
CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL
);
--Import CSV
SELECT * FROM departments

-- 2. Create Employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
	emp_title varchar,
    birth_date date,
    first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date date
);
--Import CSV
SELECT * FROM employees

-- 3. Create Department Manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR,
    emp_no INT
);
--Import CSV
SELECT * FROM dept_manager

-- 4. Create Department Employee table
CREATE TABLE dept_emp (
    emp_no INT,
	dept_no VARCHAR
);
--Import CSV
SELECT * FROM dept_emp

-- 5. Create Salaries table
CREATE TABLE salaries (
    emp_no INT,
	salary INT
);
--Import CSV
SELECT * FROM salaries

-- 5. Create Titles table
CREATE TABLE titles (
    title_id VARCHAR,
	title VARCHAR
);
--Import CSV
SELECT * FROM titles

--DATA ANALYSIS--

SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
from employees e
    JOIN salaries s on e.emp_no = s.emp_no
--
SELECT
    e.first_name,
    e.last_name,
    e.hire_date
FROM employees e
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31'
--
SELECT 
    d.dept_no,
    d.dept_name,
    dm.emp_no
	
from departments d
    JOIN dept_manager dm on dm.dept_no = d.dept_no

SELECT
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
from employees e
    JOIN dept_emp de on de.emp_no = e.emp_no
    JOIN departments d on d.dept_no = de.dept_no


Select
    e.first_name,
    e.last_name
from employees e
WHERE
e.first_name = 'Hercules' and e.last_name like 'B%'

 
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
from employees e
    JOIN dept_emp de on de.emp_no = e.emp_no
    JOIN departments d on d.dept_no = de.dept_no
Where
	d.dept_name = 'Sales'


SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
from employees e
    JOIN dept_emp de on de.emp_no = e.emp_no
    JOIN departments d on d.dept_no = de.dept_no
Where
	d.dept_name IN ('Sales', 'Development')

 
SELECT
    e.last_name, count(e.last_name) as Last_Name_Count
from employees e
GROUP BY 
e.last_name
ORDER BY 
Last_Name_Count desc 