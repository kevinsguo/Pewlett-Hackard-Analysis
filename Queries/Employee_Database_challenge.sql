DROP TABLE unique_titles
DROP TABLE retiring_titles
-- 1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.

SELECT employees.emp_no,
	employees.first_name,
	employees.last_name
FROM employees

-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.

SELECT title.title,
	title.from_date,
	title.to_date
FROM title

-- 3/4. Create a new table using the INTO clause. Join both tables on the primary key.
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	title.title,
	title.from_date,
	title.to_date
INTO employee_title
FROM employees
INNER JOIN title
ON (employees.emp_no = title.emp_no)

SELECT * FROM employee_title

-- 5. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. 
-- 	  Then, order by the employee number.

SELECT et.emp_no,
	et.first_name,
	et.last_name,
	et.title,
	et.from_date,
	et.to_date,
	employees.birth_date
INTO employee_title_birthdate
FROM employee_title AS et
INNER JOIN employees
ON (employees.emp_no = et.emp_no)

SELECT emp_no, first_name, last_name, title, from_date,to_date
INTO retirement_titles
FROM employee_title_birthdate
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no

select * from retirement_titles

-- 8-14
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (employees.emp_no)
	employees.emp_no,
	employees.first_name,
	employees.last_name,
	title.title
INTO unique_titles
FROM employees
INNER JOIN title
ON (employees.emp_no=title.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY employees.emp_no, title.to_date desc
	
select * from unique_titles

-- 15-20. retrieve the number of employees by their most recent job title who are about to retire.

SELECT COUNT(unique_titles.title),
	unique_titles.title
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY count DESC

select*from retiring_titles














