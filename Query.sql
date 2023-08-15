--1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees  AS e
JOIN salaries As s 
ON e.emp_no = s.emp_no;


--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM Employees
WHERE extract (YEAR from hire_date) = 1986;


--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dmgr.dept_no, dpt.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager AS dmgr
JOIN departments as dpt
ON dmgr.dept_no = dpt.dept_no
JOIN employees AS e
ON dmgr.emp_no = e.emp_no;


--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dmgr.dept_no, em.emp_no, em.last_name, em.first_name, dpt.dept_name
FROM employees as em
JOIN dept_manager as dmgr
ON em.emp_no = dmgr.emp_no
JOIN departments AS dpt
ON dpt.dept_no = dmgr.dept_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE e.first_name = 'Hercules'
AND e.last_name like 'B%';


--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT dpt.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN dept_emp AS dept_emp
ON dept_emp.emp_no = e.emp_no
JOIN departments as dpt
ON dept_emp.dept_no = dpt.dept_no
WHERE dpt.dept_name in ('Sales');


--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dpt.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN dept_emp AS dept_emp
ON dept_emp.emp_no = e.emp_no
JOIN departments as dpt
ON dept_emp.dept_no = dpt.dept_no
WHERE dpt.dept_name in ('Sales', 'Development');


--L8.ist the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name)
DESC;