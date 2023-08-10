DROP TABLE department;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE salaries;
DROP TABLE employees;
DROP TABLE titles;

CREATE TABLE employees (
						emp_no INT NOT NULL PRIMARY KEY,
						emp_title VARCHAR(5) NOT NULL,
						birth_date VARCHAR(10) NOT NULL,
						first_name VARCHAR(50) NOT NULL,
						last_name VARCHAR(50) NOT NULL,
						sex VARCHAR(1) NOT NULL,
						hire_date DATE NOT NULL
						);
CREATE TABLE titles (
						title_id VARCHAR(5) NOT NULL,
						title VARCHAR(50) NOT NULL
						);
CREATE TABLE dept_emp (
						emp_no INT NOT NULL,
						FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
						dept_no VARCHAR(4) NOT NULL
						);
CREATE TABLE dept_manager (
						dept_no VARCHAR(4) NOT NULL,
						emp_no INT NOT NULL,
						FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
						);
CREATE TABLE salaries (
						emp_no INT NOT NULL,
						FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
						salary INT NOT NULL
						);
CREATE TABLE department (
						dept_no VARCHAR(4) NOT NULL,
						dept_name VARCHAR(50) NOT NULL
						)