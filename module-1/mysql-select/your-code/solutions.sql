/* Exploring the tables and understanding the relationships between each one */

SELECT *
FROM titles;

SELECT *
from titleauthor;


SELECT *
FROM publishers;


SELECT *
FROM authors;

SELECT *
from sales;


/* CHALLENGE 1 */


SELECT 
authors.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
titles.title as TITLE,
publishers.pub_name as PUBLISHER
FROM titles
JOIN titleauthor 
on titles.title_id = titleauthor.title_id
JOIN authors 
on authors.au_id = titleauthor.au_id 
JOIN publishers 
on titles.pub_id = publishers.pub_id;


/* Validating that the number of rows is matching the number that appears on titleauthor's table */


SELECT COUNT(titleauthor.au_id) 
FROM titleauthor;



/* CHALLENGE 2 
 * Calculate the number of titles each author has at each publisher */ 
 
WITH tab as (
SELECT 
authors.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
count(titles.title) as COUNT_TITLE,
publishers.pub_name as PUBLISHER
FROM titles
JOIN titleauthor 
on titles.title_id = titleauthor.title_id
JOIN authors 
on authors.au_id = titleauthor.au_id 
JOIN publishers 
on titles.pub_id = publishers.pub_id
GROUP BY FIRST_NAME,
LAST_NAME,
PUBLISHER, 
AUTHOR_ID
ORDER BY COUNT_TITLE DESC, LAST_NAME ASC)


/* Comprobación */    --> no se si lo estoy haciendo bien, me da error cuando la query está separada de la anterior
SELECT sum(tab.COUNT_TITLE)
FROM tab;



/* CHALLENGE 3 */
SELECT 
authors.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
sum(sales.qty) as TOTAL
FROM authors
left join titleauthor 
on authors.au_id = titleauthor.au_id 
left join sales 
on titleauthor.title_id = sales.title_id
group by AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 3;


/* CHALLENGE 4 */
SELECT 
authors.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
coalesce(sum(sales.qty),0) as TOTAL
FROM authors
left join titleauthor 
on authors.au_id = titleauthor.au_id 
left join sales 
on titleauthor.title_id = sales.title_id
group by AUTHOR_ID
ORDER BY TOTAL DESC;

