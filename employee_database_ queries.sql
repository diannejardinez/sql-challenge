
--1. List the following details of each employee: employee number, 
--last name, first name, gender, and salary

--Joining Employees table and Salaries table in Employee ID
--Put in ascending order by employee ID
SELECT Employees.emp_no, Employees.last_name, 
       Employees.first_name, Employees.gender, Salaries.salary
FROM Employees
INNER JOIN Salaries ON
Employees.emp_no = Salaries.emp_no
ORDER BY Employees.emp_no;


--2. List employees who were hired in 1986

--Query from Employees table for hire dates between 1/1/1986 to 12/31/1986
--Put in ascending order by hire date
SELECT emp_no, last_name, first_name, hire_date
FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;


--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates

--Joining Departments, Dept_Manager, and Employees table with Department Number and Employee Number
--Put in ascending order by Department number
SELECT Departments.dept_no, Departments.dept_name, Dept_Manager.emp_no, 
       Employees.last_name, Employees.first_name, Dept_Manager.from_date, Dept_Manager.to_date
FROM Departments
INNER JOIN Dept_Manager ON
Departments.dept_no = Dept_Manager.dept_no
INNER JOIN Employees ON
Dept_Manager.emp_no = Employees.emp_no
ORDER BY Departments.dept_no;


--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name

--Joining Employees, Dept_Emp, and Departments table with Employee number and Department number
--Put in ascending order by Department name
SELECT Employees.emp_no, Employees.last_name, 
       Employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Dept_Emp ON
Employees.emp_no = Dept_Emp.emp_no
INNER JOIN Departments ON
Dept_Emp.dept_no = Departments.dept_no
ORDER BY Departments.dept_name;


--5. List all employees whose first name is "Hercules" and last names begin with "B."

--Query from Employees table for first name Hercules and last 
--name starting with the letter B. Put in ascending order by last name.
SELECT Employees.first_name, Employees.last_name
FROM Employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%' 
ORDER BY last_name;


--6. List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.

--Joining Employees, Dept_Emp, and Departments table with Employee 
--number and Department number and filtering for Sales Department
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees 
INNER JOIN Dept_Emp ON
Employees.emp_no = Dept_Emp.emp_no
INNER JOIN Departments ON
Departments.dept_no = Dept_Emp.dept_no
WHERE Departments.dept_name = 'Sales';


--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

--Joining Employees, Dept_Emp, and Departments table with Employee number 
--and Department number and filtering for Sales and Development Department. 
--Put in ascending order by department name
SELECT Employees.emp_no, Employees.last_name, 
       Employees.first_name, Departments.dept_name
FROM Employees 
INNER JOIN Dept_Emp ON
Employees.emp_no = Dept_Emp.emp_no
INNER JOIN Departments ON
Departments.dept_no = Dept_Emp.dept_no
WHERE Departments.dept_name = 'Sales' 
OR Departments.dept_name = 'Development'
ORDER BY Departments.dept_name;


--8. In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.

--Query from Employees table for frequency of last names in descending order by frequency
SELECT last_name, COUNT(last_name) AS "Last Name Frequency"
FROM Employees 
GROUP BY last_name
ORDER BY "Last Name Frequency" DESC;