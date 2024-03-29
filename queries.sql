--1. List the following details of each employee: employee number, last name, 
--first name, gender, and salary.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	e.gender,
	s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no=s.emp_no;

--2. List employees who were hired in 1986.
SELECT * FROM employees
WHERE hire_date LIKE '1986%';

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name, and start and end employment dates.
SELECT dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name,
	dept_manager.from_date,
	dept_manager.to_date
FROM ((dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no)
INNER JOIN employees ON dept_manager.emp_no = dept_manager.emp_no);

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM ((employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no)
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no);

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, depts.dept_name
FROM ((employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no)
INNER JOIN departments AS depts ON de.dept_no = depts.dept_no)
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, depts.dept_name FROM ((employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no)
INNER JOIN departments AS depts ON de.dept_no = depts.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)AS Frequency
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;