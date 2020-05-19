/*Challenge 1 - Who Have Published What At Where?*/

SELECT 
authors.au_id 		AS "AUTHOR",
authors.au_lname 	AS "LAST NAME",
authors.au_fname 	AS "FIRST NAME",
titles.title 		AS "TITLE", 
publishers.pub_name 	AS "PUBLISHER"

FROM titles
JOIN titleauthor 	ON titles.title_id = titleauthor.title_id 
JOIN authors 		ON titleauthor.au_id = authors.au_id 
JOIN publishers 	ON titles.pub_id = publishers.pub_id 

ORDER BY "LAST NAME" ASC 
;




/*Challenge 2 - Who Have Published How Many At Where?*/

SELECT 
authors.au_id 			AS "AUTHOR ID",
authors.au_lname 		AS "LAST NAME",
authors.au_fname 		AS "FIRST NAME",
publishers.pub_name 		AS "PUBLISHER",
COUNT(publishers.pub_id)	AS "TITLE COUNT"

FROM titles
JOIN titleauthor 	ON titles.title_id = titleauthor.title_id 
JOIN authors 		ON titleauthor.au_id = authors.au_id 
JOIN publishers 	ON titles.pub_id = publishers.pub_id 

GROUP BY "AUTHOR ID" 
ORDER BY "TITLE COUNT" DESC, "LAST NAME", "FIRST NAME" ASC
;




/*Challenge 3 - Best Selling Authors*/

SELECT 
authors.au_id 		AS "AUTHOR ID",
authors.au_lname 	AS "LAST NAME",
authors.au_fname 	AS "FIRST NAME",
SUM(sales.qty) 	AS "TOTAL"

FROM authors
LEFT JOIN titleauthor 	ON authors.au_id = titleauthor.au_id 
LEFT JOIN sales 	ON titleauthor.title_id = sales.title_id 

GROUP BY "AUTHOR ID" 
ORDER BY "TOTAL" DESC
LIMIT 3
;




/*Challenge 4 - Best Selling Authors Ranking*/

SELECT
authors.au_id 			AS 'AUTHOR ID',
authors.au_lname 		AS 'LAST NAME',
authors.au_fname 		AS 'FIRST NAME',
COALESCE(SUM(sales.qty),0) 	AS 'TOTAL'

FROM authors
LEFT JOIN titleauthor 	ON authors.au_id = titleauthor.au_id 
LEFT JOIN sales 	ON titleauthor.title_id = sales.title_id 

GROUP BY authors.au_id
ORDER BY "TOTAL" DESC
;



