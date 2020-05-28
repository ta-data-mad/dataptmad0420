---- CHALLENGE O1 ----

WITH step_1 AS 
(
SELECT
titles.title_id AS Title_ID,
titleauthor.au_id AS Author_ID,
titles.advance * titleauthor.royaltyper / 100 AS Advance_title_author,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS Sales_royalties
FROM titles
JOIN sales 
ON sales.title_id = titles.title_id 
JOIN titleauthor 
ON titleauthor.title_id = titles.title_id
)
,
step_2 AS 
(
SELECT 
Title_ID,
Author_ID,
SUM(Sales_royalties) AS Agregated_sales_royalties,
Advance_title_author
FROM step_1
GROUP BY Title_ID, Author_ID
)
SELECT 
Author_ID AS 'Author ID',
SUM(Agregated_sales_royalties) + Advance_title_author AS 'Profits of each author'
FROM step_2
GROUP BY Author_ID
ORDER BY "Profits of each author" DESC
LIMIT 3
;



---- CHALLENGE O2 ----


CREATE TEMPORARY TABLE step_1 AS
SELECT
titles.title_id AS Title_ID,
titleauthor.au_id AS Author_ID,
titles.advance * titleauthor.royaltyper / 100 AS Advance_title_author,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS Sales_royalties
FROM titles
JOIN sales 
ON sales.title_id = titles.title_id 
JOIN titleauthor 
ON titleauthor.title_id = titles.title_id
;


CREATE TEMPORARY TABLE step_2 AS 
SELECT 
Title_ID,
Author_ID,
SUM(Sales_royalties) AS Agregated_sales_royalties,
Advance_title_author
FROM step_1
GROUP BY Title_ID, Author_ID
;


SELECT 
Author_ID AS 'Author ID',
SUM(Agregated_sales_royalties) + Advance_title_author AS 'Profits of each author'
FROM step_2
GROUP BY Author_ID
ORDER BY "Profits of each author" DESC
LIMIT 3
;



---- CHALLENGE O3 ----

CREATE TABLE IF NOT EXISTS most_profiting_authors AS
SELECT 
Author_ID AS au_id,
SUM(Agregated_sales_royalties) + Advance_title_author AS profits
FROM step_2
GROUP BY au_id
ORDER BY profits DESC
LIMIT 3
;
