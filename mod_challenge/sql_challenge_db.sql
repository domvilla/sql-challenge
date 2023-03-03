create table employees (
	emp_no int,
	emp_title_id varchar (50),
	birth_date date,
	first_name varchar (50),
	last_name varchar (50),
	sex varchar (50),
	hire_date date
)
select * from employees

create table departments (
	dept_no varchar (50),
	dept_name varchar (50)

)
select * from departments

create table dept_emp (
	emp_no int ,
	dept_no varchar (50)

)

select * from dept_emp

create table dept_manager (
	dept_no varchar (50),
	emp_no int 
)
select * from dept_manager

create table salaries (
	emp_no int,
	salary int 
)
select * from salaries

create table titles (
	title_id varchar(50),
	title varchar(50)
)

select * from titles

--List the employee number, last name, first name, sex, and salary of each employee 
SELECT salaries.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees 
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;
 
--List the first name, last name, and hire date for the employees who were hired in 1986.
	select employees.last_name, employees.first_name, employees.hire_date
	from employees
	WHERE hire_date >= '1986-01-01'
	AND hire_date < '1987-01-01'
​
---List the manager of each department along with their department number, department name, employee number, last name, and first name.---
	select dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, employees.first_name
	from dept_manager
	left join departments
	on dept_manager.dept_no = departments.dept_no
	left join employees
	on dept_manager.emp_no =  employees.emp_no;
	
	
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
	select departments.dept_no, employees.emp_no, departments.dept_name, employees.last_name, employees.first_name
	from employees
	inner join dept_emp
	on employees.emp_no =  dept_emp.emp_no
	inner join departments
	on dept_emp.dept_no = departments.dept_no

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
	select employees.first_name, employees.last_name, employees.sex
	from employees
	where first_name = 'Hercules'
	AND last_name Like 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
	select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	from employees
	inner join dept_emp
	on employees.emp_no = dept_emp.emp_no
	inner join departments
	on dept_emp.dept_no = departments.dept_no
	where departments.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';



--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
	select last_name, COUNT(last_name) as "Frequency Count of Name"
	from employees
	group by last_name
	order by "Frequency Count of Name" desc