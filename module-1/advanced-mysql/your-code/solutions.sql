#################   Challenge 1 - Most Profiting Authors
######  Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication

SELECT sales.title_id, titleauthor.au_id, titles.advance * titleauthor.royaltyper / 100 as advance, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
FROM titles
INNER JOIN titleauthor 
ON titles.title_id = titleauthor.title_id 
INNER JOIN sales 
ON sales.title_id = titles.title_id
ORDER BY titleauthor.au_id DESC 

##### Step 2: Aggregate the total royalties for each title and author

WITH sales_royalty
as 
(SELECT sales.title_id, titleauthor.au_id, titles.advance * titleauthor.royaltyper / 100 as advance, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
FROM titles
INNER JOIN titleauthor 
ON titles.title_id = titleauthor.title_id 
INNER JOIN sales 
ON sales.title_id = titles.title_id
ORDER BY titleauthor.au_id DESC 
)
SELECT sales_royalty.title_id, sales_royalty.au_id, sum(sales_royalty.sales_royalty) as royalty_for_title_and_author
FROM sales_royalty
GROUP BY sales_royalty.au_id;

####### Step 3: Calculate the total profits of each author

WITH sales_royalty
as 
(SELECT sales.title_id, titleauthor.au_id, titles.advance * titleauthor.royaltyper / 100 as advance, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
FROM titles
INNER JOIN titleauthor 
ON titles.title_id = titleauthor.title_id 
INNER JOIN sales 
ON sales.title_id = titles.title_id
ORDER BY titleauthor.au_id DESC 
), royalty_for_title_and_author_table as 
(SELECT sales_royalty.title_id, sales_royalty.au_id, sum(sales_royalty.sales_royalty) as royalty_for_title_and_author, sales_royalty.advance
FROM sales_royalty
GROUP BY sales_royalty.au_id
)
SELECT royalty_for_title_and_author_table.au_id, royalty_for_title_and_author_table.royalty_for_title_and_author + royalty_for_title_and_author_table.advance as total_profits
FROM royalty_for_title_and_author_table
ORDER BY total_profits DESC 
LIMIT 3

#################   Challenge 2 - Alternative Solution

CREATE TEMPORARY TABLE IF NOT EXISTS sales_royalty AS
SELECT sales.title_id, titleauthor.au_id, titles.advance * titleauthor.royaltyper / 100 as advance, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
FROM titles
INNER JOIN titleauthor 
ON titles.title_id = titleauthor.title_id 
INNER JOIN sales 
ON sales.title_id = titles.title_id
ORDER BY titleauthor.au_id DESC;
CREATE TEMPORARY TABLE IF NOT EXISTS royalty_for_title_and_author_table as 
SELECT sales_royalty.title_id, sales_royalty.au_id, sum(sales_royalty.sales_royalty) as royalty_for_title_and_author, sales_royalty.advance
FROM sales_royalty
GROUP BY sales_royalty.au_id;
SELECT royalty_for_title_and_author_table.au_id, royalty_for_title_and_author_table.royalty_for_title_and_author + royalty_for_title_and_author_table.advance as total_profits
FROM royalty_for_title_and_author_table
ORDER BY total_profits DESC 
LIMIT 3;

#####################    Challenge 3

CREATE TABLE IF NOT EXISTS most_profiting_authors as
WITH sales_royalty
as 
(SELECT sales.title_id, titleauthor.au_id, titles.advance * titleauthor.royaltyper / 100 as advance, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
FROM titles
INNER JOIN titleauthor 
ON titles.title_id = titleauthor.title_id 
INNER JOIN sales 
ON sales.title_id = titles.title_id
ORDER BY titleauthor.au_id DESC 
), royalty_for_title_and_author_table as 
(SELECT sales_royalty.title_id, sales_royalty.au_id, sum(sales_royalty.sales_royalty) as royalty_for_title_and_author, sales_royalty.advance
FROM sales_royalty
GROUP BY sales_royalty.au_id
)
SELECT royalty_for_title_and_author_table.au_id, royalty_for_title_and_author_table.royalty_for_title_and_author + royalty_for_title_and_author_table.advance as total_profits
FROM royalty_for_title_and_author_table
ORDER BY total_profits DESC 
LIMIT 3;














