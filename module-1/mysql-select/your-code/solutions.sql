CHALLENGE 01

SELECT
authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
titles.title AS TITLE,
publishers.pub_name AS PUBLISHER
FROM titles
JOIN titleauthor
ON titleauthor.title_id = titles.title_id
JOIN authors 
ON authors.au_id = titleauthor.au_id
JOIN publishers 
ON publishers.pub_id = titles.pub_id;


CHALLENGE 02

SELECT
authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
publishers.pub_name AS PUBLISHER,
COUNT(titles.title) AS 'TITLE COUNT'
FROM titles
JOIN titleauthor
ON titleauthor.title_id = titles.title_id
JOIN authors 
ON authors.au_id = titleauthor.au_id
JOIN publishers 
ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, publishers.pub_name;

CHALLENGE 03

SELECT
titleauthor.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
count(sales.qty) AS TOTAL
FROM titles
JOIN titleauthor
ON titleauthor.title_id = titles.title_id 
JOIN authors 
ON authors.au_id = titleauthor.au_id 
JOIN sales 
ON sales.title_id = titles.title_id
GROUP BY titleauthor.au_id
ORDER BY TOTAL DESC
LIMIT 3;

CHALLENGE 04

SELECT 
authors.au_id,
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
count(sales.qty) AS TOTAL 
FROM authors
LEFT JOIN titleauthor 
ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles 
ON titles.title_id = titleauthor.title_id 
LEFT JOIN sales
ON sales.title_id = titles.title_id 
GROUP BY authors.au_id
ORDER BY TOTAL DESC;

