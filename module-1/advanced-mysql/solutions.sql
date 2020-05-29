-- Challenge 1 - Most Profiting Authors

-- Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication

SELECT 
sales.title_id AS "Title_ID",
titleauthor.au_id AS "Author_ID",
titles.advance * titleauthor.royaltyper / 100 as "Advance",
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as "Sales_royalty"
FROM sales
LEFT JOIN titles ON sales.title_id = titles.title_id 
LEFT JOIN titleauthor on titles.title_id = titleauthor.title_id 
;


-- Step 2: Aggregate the total royalties for each title and author

WITH "Total_revenue" AS 
	(
	SELECT
	sales.title_id AS "Title_ID",
	titleauthor.au_id AS "Author_ID",
	titles.advance * titleauthor.royaltyper / 100 as "Advance",
	titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as "Sales_royalty"
	FROM sales
	LEFT JOIN titles ON sales.title_id = titles.title_id 
	LEFT JOIN titleauthor on titles.title_id = titleauthor.title_id 
	)
SELECT 
Title_ID,
Author_ID,
Advance,
SUM(Sales_royalty) as "Total_royalty"
FROM Total_revenue
GROUP BY Author_ID, Title_id
;


-- Step 3: Calculate the total profits of each author

SELECT 
Author_ID,
Sum(Advance + Total_royalty) AS "Total"
FROM 
	(
	WITH "Total_revenue" AS 
	(
		SELECT
		sales.title_id AS "Title_ID",
		titleauthor.au_id AS "Author_ID",
		titles.advance * titleauthor.royaltyper / 100 as "Advance",
		titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as "Sales_royalty"
		FROM sales
		LEFT JOIN titles ON sales.title_id = titles.title_id 
		LEFT JOIN titleauthor on titles.title_id = titleauthor.title_id 
		)
	SELECT 
	Title_ID,
	Author_ID,
	Advance,
	SUM(Sales_royalty) as "Total_royalty"
	FROM Total_revenue
	GROUP BY Author_ID, Title_id
		)
GROUP BY Author_ID
ORDER BY Total DESC
LIMIT 3
;




-- Challenge 2 - Alternative Solution- Temporary Tables

CREATE TEMPORARY TABLE IF NOT EXISTS "Revenue_breakdown" AS 
	SELECT 
	sales.title_id AS "Title_ID",
	titleauthor.au_id AS "Author_ID",
	titles.advance * titleauthor.royaltyper / 100 as "Advance",
	titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as "Sales_royalty"
	FROM sales
	LEFT JOIN titles ON sales.title_id = titles.title_id 
	LEFT JOIN titleauthor on titles.title_id = titleauthor.title_id 
	;

SELECT * FROM Revenue_breakdown
;

CREATE TEMPORARY TABLE IF NOT EXISTS "Title_revenue" AS	
	SELECT 
	Title_ID,
	Author_ID,
	Advance,
	SUM(Sales_royalty) as "Total_royalty"
	FROM Revenue_breakdown
	GROUP BY Author_ID, Title_id
	;

SELECT * FROM Title_revenue
;

CREATE TEMPORARY TABLE IF NOT EXISTS "Profits" AS 	
	SELECT 
	Author_ID,
	SUM(Advance + Total_royalty) AS "Total_profit"
	FROM Title_revenue
	GROUP BY Author_ID
	;

SELECT * FROM Profits
ORDER BY Total_profit DESC 
LIMIT 3
;




-- Challenge 3 - Table creation

CREATE TABLE IF NOT EXISTS "most_profiting_authors" AS
	SELECT Author_ID, Total_profit
	FROM Profits
	ORDER BY Total_profit DESC 
	LIMIT 3
	;
