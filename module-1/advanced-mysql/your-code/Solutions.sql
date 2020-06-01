WITH
challenge_1 AS
(
SELECT
titles.title_id,
titleauthor.au_id,
titles.advance * titleauthor.royaltyper /100 AS advance,
(titles.price * sales.qty * titles.royalty / 100) * (titleauthor.royaltyper / 100) AS sales_royalty
FROM titles
LEFT JOIN titleauthor ON titles.title_id = titleauthor.title_id
LEFT JOIN authors ON titleauthor.au_id = authors.au_id
LEFT JOIN sales ON titles.title_id = sales.title_id
)
SELECT 
title_id,
au_id,
SUM(sales_royalty)
FROM
challenge_1
GROUP BY au_id
GROUP BY title_id