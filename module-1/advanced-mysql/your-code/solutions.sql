-------------------------------------------------------------------------------
------------------- Challenge 1 - Most Profiting Authors ----------------------
-------------------------------------------------------------------------------

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


----------------------------------------------------------------------------
------------------- Challenge 2 - Alternative Solution ---------------------
----------------------------------------------------------------------------
--Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication
CREATE TEMPORARY TABLE IF NOT EXISTS temp_agregate_table AS
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
CREATE TEMPORARY TABLE IF NOT EXISTS temp_table2 AS
SELECT 
Title_ID,
Author_ID,
SUM(Advance + Royalty) AS "Aggregated_royalties"
FROM temp_agregate_table
GROUP BY Title_ID, Author_ID
;

-- Step 3: Calculate the total profits of each author
SELECT 
Author_ID,
SUM(Aggregated_royalties) AS "Profits"
FROM temp_table2 
GROUP BY Author_ID
ORDER BY Profits DESC
LIMIT 3
;


----------------------------------------------------------------------------
------------------- Challenge 3 - Alternative Solution ---------------------
----------------------------------------------------------------------------

CREATE TABLE most_profiting_authors AS 
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
LIMIT 3;

SELECT *
FROM most_profiting_authors;









