# Challenge 1 - Who Have Published What At Where?

WITH
titles_publishers AS
(
SELECT *
FROM titles
INNER JOIN publishers 
ON titles.pub_id = publishers.pub_id 
),
titlesauthors_authors AS
(
SELECT *
FROM authors
INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
),
thegoodone AS
(
SELECT *
FROM titlesauthors_authors
INNER JOIN titles_publishers
ON titlesauthors_authors.title_id = titles_publishers.title_id
)
SELECT au_id as 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', title AS 'TITLE', pub_name AS PUBLISHER from thegoodone;


# Challenge 2 - Who Have Published How Many At Where?


WITH
titles_publishers AS
(
SELECT *
FROM titles
INNER JOIN publishers 
ON titles.pub_id = publishers.pub_id 
),
titlesauthors_authors AS
(
SELECT *
FROM authors
INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
),
thegoodone AS
(
SELECT *
FROM titlesauthors_authors
INNER JOIN titles_publishers
ON titlesauthors_authors.title_id = titles_publishers.title_id
)
SELECT au_id as 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', pub_name AS 'PUBLISHER', COUNT(DISTINCT (title)) AS 'TITLE COUNT' 
FROM thegoodone
GROUP BY au_id, pub_name
ORDER BY au_id DESC, pub_name DESC
;



# Challenge 3 - Best Selling Authors


WITH
titles_publishers AS
(
SELECT *
FROM titles
INNER JOIN publishers 
ON titles.pub_id = publishers.pub_id 
),
quantity_title AS
(
SELECT *
FROM sales 
INNER JOIN titles_publishers
ON sales.title_id = titles_publishers.title_id
),
titlesauthors_authors AS
(
SELECT *
FROM authors
INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
),
thegoodone AS
(
SELECT *
FROM titlesauthors_authors
INNER JOIN quantity_title
ON titlesauthors_authors.title_id = quantity_title.title_id
)
SELECT au_id as 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', pub_name AS 'PUBLISHER', title AS 'TITLE', qty AS 'SALES'
FROM thegoodone
GROUP BY au_id 
ORDER BY qty DESC
LIMIT 3
;


# Challenge 4 - Best Selling Authors Ranking

WITH
titles_publishers AS
(
SELECT *
FROM titles
LEFT JOIN publishers 
ON titles.pub_id = publishers.pub_id 
),
quantity_title AS
(
SELECT *
FROM sales 
LEFT JOIN titles_publishers
ON sales.title_id = titles_publishers.title_id
),
titlesauthors_authors AS
(
SELECT *
FROM authors
LEFT JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
),
thegoodone AS
(
SELECT *
FROM titlesauthors_authors
LEFT JOIN quantity_title
ON titlesauthors_authors.title_id = quantity_title.title_id
)
SELECT au_id as 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', pub_name AS 'PUBLISHER', title AS 'TITLE', COALESCE (qty,0) AS 'SALES'
FROM thegoodone
GROUP BY au_id 
ORDER BY qty DESC
;

