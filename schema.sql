-- DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
	emp_no INT PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender VARCHAR(10),
	hire_date DATE
	
);
SELECT * FROM employee;

--DROP TABLE IF EXISTS department;
CREATE TABLE department (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(30)
);
SELECT * FROM department;
CREATE TABLE salary (
	emp_no INTEGER NOT NULL,
	salary INTEGER,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);
SELECT * FROM salary;

CREATE TABLE title (
	emp_no INTEGER NOT NULL,
	title VARCHAR(40),
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);
SELECT * FROM title;

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	from_date DATE,
	to_date DATE,
	PRIMARY KEY(emp_no, dept_no)
);

SELECT * FROM dept_emp;

CREATE TABLE dept_manager (
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	from_date DATE,
	to_date DATE,
	PRIMARY KEY(dept_no, emp_no)
);
SELECT * FROM dept_manager;