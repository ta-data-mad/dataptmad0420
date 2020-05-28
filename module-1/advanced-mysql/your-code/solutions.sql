------------------- Challenge 1 - Most Profiting Authors ----------------------

--Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication
SELECT
titles.title_id AS "Title_ID" ,
titleauthor.au_id AS "Author_ID",
titles.advance * titleauthor.royaltyper / 100 AS "Advance",
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS "Royalty"
FROM titles
LEFT JOIN sales
ON titles.title_id  = sales.title_id 
LEFT JOIN titleauthor 
ON titles.title_id = titleauthor.title_id;


-- Step 2: Aggregate the total royalties for each title and author
WITH complete_table AS
(
SELECT
titles.title_id AS "Title_ID" ,
titleauthor.au_id AS "Author_ID",
titles.advance * titleauthor.royaltyper / 100 AS "Advance",
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS "Royalty"
FROM titles
LEFT JOIN sales
ON titles.title_id  = sales.title_id 
LEFT JOIN titleauthor 
ON titles.title_id = titleauthor.title_id
)
SELECT 
Title_ID,
Author_ID,
SUM(Advance + Royalty)
FROM complete_table
GROUP BY Title_ID, Author_ID
;


-- Step 3: Calculate the total profits of each author
WITH step_3 AS
(
WITH complete_table AS
(
SELECT
titles.title_id AS "Title_ID" ,
titleauthor.au_id AS "Author_ID",
titles.advance * titleauthor.royaltyper / 100 AS "Advance",
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS "Royalty"
FROM titles
LEFT JOIN sales
ON titles.title_id  = sales.title_id 
LEFT JOIN titleauthor 
ON titles.title_id = titleauthor.title_id
)
SELECT 
Title_ID,
Author_ID,
SUM(Advance + Royalty) AS "Aggregated_royalties"
FROM complete_table
GROUP BY Title_ID, Author_ID
)
SELECT 
Author_ID,
SUM(Aggregated_royalties) AS "Profits"
FROM step_3
GROUP BY Author_ID
ORDER BY Profits DESC
LIMIT 3
;

