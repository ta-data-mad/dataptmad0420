#Challenge 1 - Who Have Published What At Where?
SELECT
authors.au_id AS "Author ID",
authors.au_lname AS "Last Name",
authors.au_fname AS "First Name", 
titles.title AS "Title",
publishers.pub_name AS "Publisher"
FROM authors 
JOIN titleauthor
ON titleauthor.au_id = authors.au_id 
JOIN titles 
ON titleauthor.title_id = titles.title_id
JOIN publishers 
ON titles.pub_id = publishers.pub_id; 

#Challenge 2 - Who Have Published How Many At Where?
SELECT
authors.au_id AS "Author ID",
authors.au_lname AS "Last Name",
authors.au_fname AS "First Name", 
publishers.pub_name AS "Publisher",
COUNT (titles.title_id ) AS "Title Count"
FROM authors 
JOIN titleauthor
ON titleauthor.au_id = authors.au_id 
JOIN titles 
ON titleauthor.title_id = titles.title_id
JOIN publishers 
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id;

#Challenge 3 - Best Selling Authors
SELECT
authors.au_id AS "Author ID",
authors.au_lname AS "Last Name",
authors.au_fname AS "First Name",
SUM(sales.qty) AS "Total"
FROM authors 
JOIN titleauthor
ON titleauthor.au_id = authors.au_id 
JOIN titles 
ON titleauthor.title_id = titles.title_id
JOIN sales 
ON sales.title_id = titles.title_id 
GROUP BY authors.au_id
ORDER BY "Total" DESC
LIMIT 3; 

#Challenge 4 - Best Selling Authors Ranking
SELECT
authors.au_id AS "Author ID",
authors.au_lname AS "Last Name",
authors.au_fname AS "First Name",
COALESCE (SUM(sales.qty),0) AS "Total"
FROM authors 
LEFT JOIN titleauthor
ON titleauthor.au_id = authors.au_id 
LEFT JOIN titles 
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales 
ON sales.title_id = titles.title_id 
GROUP BY authors.au_id
ORDER BY "Total" DESC; 
