-- 1. List: employee number, last name, first name, sex, salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;


-- 2. List employees hired in 1986: first name, last name, hire date
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. List department managers with details: dept number, dept name, employee number, last name, first name
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
JOIN department AS d ON dm.dept_no = d.dept_no
JOIN employees AS e ON dm.emp_no = e.emp_no;

-- 4. List employee department details: dept number, employee number, last name, first name, department name
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN employees AS e ON de.emp_no = e.emp_no
JOIN department AS d ON de.dept_no = d.dept_no;

-- 5. List employees with specific name criteria (Hercules in first name, B in last name)
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List employees in the Sales department (employee number, last name, first name)
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN department AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List employees in Sales and Development departments (employee number, last name, first name, department name)
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN department AS d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- 8. List frequency counts of employee last names in descending order
CREATE VIEW employees_freq_count AS
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

SELECT * FROM employees_freq_count;

