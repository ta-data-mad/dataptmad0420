-- Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication

SELECT 
titles.title_id,
titleauthor.au_id as "Author_ID",
titles.advance * titleauthor.royaltyper/100 as "Advance",
titles.royalty * sales.qty * titles.royalty * titleauthor.royaltyper / 100 as "Sales_royalty"
FROM titles
LEFT JOIN titleauthor on titles.title_id = titleauthor.title_id 
LEFT JOIN sales on titles.title_id = sales.title_id 
;


-- Step 2: Aggregate the total royalties for each title and author

WITH "Royalties" as 
(
SELECT 
titles.title_id as "Title_ID",
titleauthor.au_id as "Author_ID",
titles.advance * titleauthor.royaltyper/100 as "Advance",
titles.royalty * sales.qty * titles.royalty * titleauthor.royaltyper / 100 as "Sales_royalty"
FROM titles
LEFT JOIN titleauthor on titles.title_id = titleauthor.title_id 
LEFT JOIN sales on titles.title_id = sales.title_id 
) 
SELECT 
"Title_ID",
"Author_ID",
sum("Advance" + "Sales_royalty") as "Aggregated royalties"
FROM "Royalties"
GROUP BY "Title_Id"
;


-- Step 3: Calculate the total profits of each author

WITH 
"Total_advance" as (
		SELECT 
		titles.title_id as "Title_ID",
		titleauthor.au_id as "Author_ID",
		titles.advance * titleauthor.royaltyper/100 as "Advance"
		FROM titles
		LEFT JOIN titleauthor on titles.title_id = titleauthor.title_id 
		LEFT JOIN sales on titles.title_id = sales.title_id 
		), 
"Total_royalties" as (
		SELECT 
		titles.title_id as "Title_ID",
		titleauthor.au_id as "Author_ID",
		titles.royalty * sales.qty * titles.royalty * titleauthor.royaltyper / 100 as "Sales_royalty"
		FROM titles
		LEFT JOIN titleauthor on titles.title_id = titleauthor.title_id 
		LEFT JOIN sales on titles.title_id = sales.title_id 
		) 
SELECT 
Total_advance.Author_ID, 
"Advance" + "Sales_royalty" as "Profits"
FROM Total_advance, Total_royalties
GROUP BY Total_advance.Author_ID
ORDER BY Profits DESC
LIMIT 3
;

-- Challenge 2 - Alternative Solution

CREATE TEMPORARY TABLE IF NOT EXISTS "Total_advance" as 
		SELECT 
		titles.title_id as "Title_ID",
		titleauthor.au_id as "Author_ID",
		titles.advance * titleauthor.royaltyper/100 as "Advance"
		FROM titles
		LEFT JOIN titleauthor on titles.title_id = titleauthor.title_id 
		LEFT JOIN sales on titles.title_id = sales.title_id 
		;
	
CREATE TEMPORARY TABLE IF NOT EXISTS "Total_royalties" as
		SELECT 
		titles.title_id as "Title_ID",
		titleauthor.au_id as "Author_ID",
		titles.royalty * sales.qty * titles.royalty * titleauthor.royaltyper / 100 as "Sales_royalty"
		FROM titles
		LEFT JOIN titleauthor on titles.title_id = titleauthor.title_id 
		LEFT JOIN sales on titles.title_id = sales.title_id 
		;
	
	
SELECT 
Total_advance.Author_ID, 
"Advance" + "Sales_royalty" as "Profits"
FROM Total_advance, Total_royalties
GROUP BY Total_advance.Author_ID
ORDER BY Profits DESC
LIMIT 3
;
