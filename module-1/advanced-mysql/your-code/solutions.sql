WITH aggregate_royalties AS
(
SELECT 
titles.title_id  AS "Title ID",
titleauthor.au_id as "Author ID",
titles.advance * titleauthor.royaltyper / 100 as advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty 
FROM titles 
JOIN titleauthor
ON titles.title_id = titleauthor.title_id 
JOIN sales 
ON titles.title_id = sales.title_id 
GROUP BY titles.title_id, titleauthor.au_id
)
SELECT 
aggregate_royalties."Author ID" as "Author ID",
aggregate_royalties.advance + aggregate_royalties.sales_royalty AS Profits
FROM aggregate_royalties
ORDER BY  Profits DESC
LIMIT 3 

--Challenge 2 - Alternative Solution
CREATE TEMPORARY TABLE IF NOT EXISTS aggregate_royalties AS
SELECT 
titles.title_id  AS "Title ID",
titleauthor.au_id as "Author ID",
titles.advance * titleauthor.royaltyper / 100 as advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty 
FROM titles 
JOIN titleauthor
ON titles.title_id = titleauthor.title_id 
JOIN sales 
ON titles.title_id = sales.title_id 
GROUP BY titles.title_id, titleauthor.au_id;

SELECT 
aggregate_royalties."Author ID",
aggregate_royalties.advance + aggregate_royalties.sales_royalty as Profit
FROM aggregate_royalties
ORDER BY Profit DESC
LIMIT 3

--Challenge 3
CREATE TABLE IF NOT EXISTS most_profiting_authors AS
WITH aggregate_royalties AS
(
SELECT 
titles.title_id  AS "Title ID",
titleauthor.au_id as "Author ID",
titles.advance * titleauthor.royaltyper / 100 as advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty 
FROM titles 
JOIN titleauthor
ON titles.title_id = titleauthor.title_id 
JOIN sales 
ON titles.title_id = sales.title_id 
GROUP BY titles.title_id, titleauthor.au_id
)
SELECT 
aggregate_royalties."Author ID" as "Author ID",
aggregate_royalties.advance + aggregate_royalties.sales_royalty AS Profits
FROM aggregate_royalties 
ORDER BY Profits DESC 
LIMIT 3
