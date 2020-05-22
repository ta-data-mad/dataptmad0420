--#####################################################
--Challenge 1 - Who Have Published What At Where?

SELECT 
titleauthor.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
titles.title as TITLE,
publishers.pub_name as PUBLISHER
FROM authors
JOIN titleauthor 
ON authors.au_id = titleauthor.au_id 
JOIN titles 
ON titleauthor.title_id = titles.title_id
JOIN publishers 
ON publishers.pub_id = titles.pub_id ;

--######################################################
-- Chalenge 2 - Who Have Published How Many At Where?

SELECT 
titleauthor.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
publishers.pub_name as PUBLISHER,
COUNT(*) as TITLE_COUNT
FROM authors
JOIN titleauthor 
ON authors.au_id = titleauthor.au_id 
JOIN titles 
ON titleauthor.title_id = titles.title_id
JOIN publishers 
ON publishers.pub_id = titles.pub_id
GROUP BY titleauthor.au_id, publishers.pub_id ;

--#######################################################
-- Challenge 3 - Best Selling Authors

SELECT 
authors.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
SUM(sales.qty) as TOTAL
FROM authors
JOIN titleauthor 
ON authors.au_id = titleauthor.au_id 
JOIN sales 
ON sales.title_id = titleauthor.title_id 
GROUP BY titleauthor.au_id 
ORDER BY TOTAL DESC 
LIMIT 3;

--######################################################
-- Challenge 4 - Best Selling Author Ranking

SELECT 
authors.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
COALESCE(SUM(sales.qty),0) as TOTAL
FROM authors 
LEFT JOIN titleauthor                                 -- LEFT JOIN to keep all authors in the report
ON titleauthor.au_id = authors.au_id  
LEFT JOIN sales                                       -- LEFT JOIN to keep all authors and titles in the report
ON sales.title_id = titleauthor.title_id 
GROUP BY authors.au_id 
ORDER BY TOTAL DESC ;


