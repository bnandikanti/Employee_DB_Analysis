--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT emp.emp_no, last_name, first_name, gender, salary FROM employee AS emp
INNER JOIN salary AS sal 
ON emp.emp_no = sal.emp_no;

--2. List employees who were hired in 1986.

SELECT last_name, first_name
FROM employee WHERE hire_date BETWEEN to_date('01-01-1986', 'MM-DD-YYYY')
AND to_date('12-12-1986', 'MM-DD-YYYY');

---3. List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT deptmgr.dept_no, dept_name, deptmgr.emp_no, last_name, first_name, from_date, to_date
FROM dept_manager  AS deptmgr
INNER JOIN department AS dept ON deptmgr.dept_no = dept.dept_no
INNER JOIN employee AS emp ON deptmgr.emp_no = emp.emp_no;

----4. List the department of each employee with the following information: 
-----employee number, last name, first name, and department name.

SELECT emp.emp_no, last_name, first_name, dept.dept_name
FROM dept_emp 
INNER JOIN department AS dept ON dept_emp.dept_no = dept.dept_no
INNER JOIN employee AS emp ON dept_emp.emp_no = emp.emp_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT last_name, first_name FROM employee 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT dept_name, dept_emp.emp_no, last_name, first_name
FROM dept_emp 
INNER JOIN department AS dept 
ON dept_emp.dept_no = dept.dept_no
INNER JOIN employee AS emp
ON dept_emp.emp_no = emp.emp_no
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

SELECT dept_name, dept_emp.emp_no, last_name, first_name
FROM dept_emp 
INNER JOIN department AS dept 
ON dept_emp.dept_no = dept.dept_no
INNER JOIN employee AS emp
ON dept_emp.emp_no = emp.emp_no
WHERE dept_name IN('Sales', 'Development');

--8.In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
SELECT  count(last_name) AS count, last_name FROM employee AS emp
GROUP BY last_name
ORDER BY count desc;


