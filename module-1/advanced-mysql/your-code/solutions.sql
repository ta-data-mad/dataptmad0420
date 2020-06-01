/* Challenge 1
 */
WITH table_1
AS (
SELECT titles.title as title_id,
titleauthor.au_id as author_id,
titles.advance * titleauthor.royaltyper / 100 AS advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
FROM titleauthor
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales 
ON sales.title_id = titles.title_id 
),
table_2 as (
SELECT title_id,
advance,
author_id,
SUM(sales_royalty) as ag_royalty
FROM table_1 
GROUP BY author_id,
title_id
)
SELECT author_id,
SUM(advance + ag_royalty) as total_profits
FROM table_2 
GROUP BY author_id
ORDER BY total_profits DESC
LIMIT 3;

/* Challenge 2
 */





