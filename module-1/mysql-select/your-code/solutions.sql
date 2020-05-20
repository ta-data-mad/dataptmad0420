
SELECT 
authors.au_id as author_id, 
authors.au_lname as last_name, 
authors.au_fname as first_name,
titles.title as title, 
publishers.pub_name as publisher
from titles
join titleauthor 
on titleauthor.title_id = titles.title_id
join authors 
on authors.au_id = titleauthor.au_id 
join publishers
on publishers.pub_id = titles.pub_id; 

SELECT count(*)
FROM  titleauthor



-- 
    AUTHOR ID - the ID of the author
    LAST NAME - author last name
    FIRST NAME - author first name
    TITLE - name of the published title
    PUBLISHER - name of the publisher where the title was published




SELECT title, type, price, 
sum(qty) as units_sold
from titles
join sales 
on sales.title_id = titles.title_id 
group by title, type, price

-- algun titulo no tiene ningun pedido o venta asocisada, entonces se pierde en el left join
-- LEFT JOIN para tener todos titulos en query 
SELECT title, type, price, 
sum(qty) as units_sold
from titles
left join sales 
on sales.title_id = titles.title_id 
group by title, type, price

-- RIGHT right join 
SELECT title , type, price, 
sum(qty) as units_sold
from titles
left join sales
on sales.title_id = titles.title_id 
group by title, type, price; 


--EMPLOYEE
-- emploeados no asiciados a job y jobs no asociados a ningun empleado 
-- ver las tablas que quiero merge
select * from employee; 
select * from jobs; 
-- venga esa query 

select * from employee 
join jobs on jobs.job_id = employee.job_id; 

-- OUTERJOIN pero me falta los empleados sin job id y los trabajos sin empleados 
select * from employee 
left join jobs on jobs.job_id = employee.job_id; 
--
SELECT employee.fname,  employee.hire_date,  jobs.job_desc,  jobs.job_id
FROM jobs
LEFT JOIN employee
on jobs.job_id = employee.job_id
UNION
SELECT employee.fname,  employee.hire_date,  jobs.job_desc,  jobs.job_id
FROM employee
LEFT JOIN jobs
on jobs.job_id = employee.job_id;


-- combined queries (WITH) 
select ventas
from (select title, type, 
ytd_sales as ventas
from titles); 


-- un fig 
select AVG(ventas) 
from (select title, type, 
ytd_sales as ventas
from titles); 

-- dar nombre a consulta 'employees-custom' para que cree una tabla 
WITH 
employees_custom AS 
(
SELECT *
FROM employee
),
jobs_custom AS
(
SELECT *
FROM jobs
JOIN employees_custom
ON employees_custom.job_id = jobs.job_id
)
SELECT * from jobs_custom;



SELECT 
pub_name,
count(titles.title_id) as titles_published
FROM titles
left join publishers 
ON publishers.pub_id = titles.pub_id
GROUP BY pub_name
ORDER BY titles_published DESC;


-- darle la vuelta a la tabla 
-- Some commandds 

-- para seleccionar todo 
SELECT * 
-- Alias de titles - t 
FROM titles
-- Sacar categorias - repetidas por cada libro - ueremos solo una categoria por fila 
SELECT DISTINCT type
FROM titles t
SELECT *
FROM sales 

-- codigo y columna que sea lo que han vendido en total x unidades de ese titulo' 
select title_id, sum(qty)
from sales 
group by title_id 

-- codigo y columna que sea lo que han vendido en media x unidades de ese titulo' 
select title_id, AVG(qty) as avg_ventas
from sales 
group by title_id 

-- Aggregation forms: SUM, AVG. MAX, MIN, MED,   
select title_id, AVG(qty) as avg_ventas
from sales 
group by title_id 



SELECT pub_name from publishers,
count(titles.title_id) as titles.published
from publishers
join titles
on publishers.pub_id = titles.pub_id
group by publishers.pub_name
order by titles_published DESC ; 



SELECT * from titles; 


-- si quiero seleccionar solo las que han publicado 
select DISTINCT publishers.pub_name from publishers
join titles 
on publishers.pub_id = titles.pub_id; 

-- Relaciones entre tableas 
-- inner join 
--- aquello que pertenece tanto a uno como a otro 
-- with 'primary key' par relacionar y con 'foreign key' - columna que hace referencia a clave primaria de otra tabla
-- quedarian filas 
-- list editorials and number titles per editorial 







/* para comentar
-- para comentar
