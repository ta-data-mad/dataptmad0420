#Challenge 1 - Most Profiting Authors
#Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication

SELECT  
titleauthor.au_id AS "author_ID",
titles.title_id AS "title_ID",
(titles.advance * titleauthor.royaltyper / 100) AS "advance",
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS "royalty"
FROM titles
JOIN titleauthor 
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id;

#Step 2: Aggregate the total royalties for each title and author
SELECT author_ID, title_ID, SUM(advance), SUM(royalty)
FROM (
SELECT  
titleauthor.au_id AS "author_ID",
titles.title_id AS "title_ID",
(titles.advance * titleauthor.royaltyper / 100) AS "advance",
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS "royalty"
FROM titles
JOIN titleauthor 
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id
) GROUP BY author_ID, title_ID ;

#Step 3: Calculate the total profits of each author
SELECT author_ID, SUM(total_advance + total_royalty) AS "total_profit"
FROM 
(SELECT author_ID, 
title_ID, 
SUM(advance) AS "total_advance", 
SUM(royalty) AS "total_royalty"
FROM (
SELECT  
titleauthor.au_id AS "author_ID",
titles.title_id AS "title_ID",
(titles.advance * titleauthor.royaltyper / 100) AS "advance",
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS "royalty"
FROM titles
JOIN titleauthor 
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id
) GROUP BY author_ID, title_ID
) 
GROUP BY author_ID 
ORDER BY total_profit DESC
LIMIT 3


#Challenge 2 - Alternative Solution
CREATE TEMPORARY TABLE all_advance_royalties AS
SELECT  
titleauthor.au_id AS "author_ID",
titles.title_id AS "title_ID",
(titles.advance * titleauthor.royaltyper / 100) AS "advance",
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS "royalty"
FROM titles
JOIN titleauthor 
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id;


CREATE TEMPORARY TABLE all_advance_royalties_grouped AS
SELECT author_ID, 
title_ID, 
SUM(advance) AS "total_advance", 
SUM(royalty) AS "total_royalty"
FROM (
SELECT * FROM all_advance_royalties
) GROUP BY author_ID, title_ID ;



CREATE TEMPORARY TABLE most_profitable_authors_3 AS
SELECT author_ID, SUM(total_advance + total_royalty) AS "total_profit"
FROM (
SELECT * FROM all_advance_royalties_grouped
)GROUP BY author_ID 
ORDER BY total_profit DESC
LIMIT 3

SELECT * FROM most_profitable_authors_3



