--Challenge 1 - Who Have Published What At Where?

SELECT
authors.au_id as 'AUTHORS ID',
authors.au_lname as 'LAST NAME',
authors.au_fname as 'FIRST NAME',
titles.title as 'TITLE',
publishers.pub_name as 'PUBLISHER'
FROM authors
JOIN titleauthor 
ON titleauthor.au_id = authors.au_id 
JOIN titles 
ON titles.title_id =  titleauthor.title_id 
JOIN publishers 
ON publishers.pub_id = titles.pub_id ;


--Challenge 2 - Who Have Published How Many At Where?
SELECT 
authors.au_id as 'AUTHORS_ID',
authors.au_lname as 'LAST NAME',
authors.au_fname as 'FIRST NAME',
publishers.pub_name as 'PUBLISHER',
COUNT(titles.title_id ) AS 'TITLE COUNT'
FROM titles
JOIN titleauthor 
ON titleauthor.title_id = titles.title_id 
JOIN authors 
ON authors.au_id =  titleauthor.au_id 
JOIN publishers 
ON publishers.pub_id = titles.pub_id 
GROUP BY AUTHORS_ID, 'LAST NAME', 'FIRST NAME','PUBLISHER'
;

--Challenge 3 - Best Selling Authors
SELECT
authors.au_id  AS 'AUTHOR_ID',
authors.au_lname AS 'LAST_NAME',
authors.au_fname AS 'FIRST_NAME',
SUM(sales.qty ) AS 'TOTAL'
FROM authors
JOIN titleauthor 
ON titleauthor.au_id = authors.au_id 
JOIN sales 
ON sales.title_id = titleauthor.title_id
GROUP BY AUTHOR_ID, LAST_NAME
ORDER BY TOTAL DESC
LIMIT 3;

--Challenge 4 - Best Selling Authors Ranking
SELECT
authors.au_id  AS 'AUTHOR_ID',
authors.au_lname AS 'LAST_NAME',
authors.au_fname AS 'FIRST_NAME',
COALESCE (sales.qty,0) AS 'TOTAL'
FROM authors
LEFT JOIN titleauthor
ON titleauthor.au_id = authors.au_id 
LEFT JOIN sales 
ON sales.title_id = titleauthor.title_id
GROUP BY AUTHOR_ID
;






