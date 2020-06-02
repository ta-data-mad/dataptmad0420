--Challenge1
WITH
step1 AS
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
),
step2 AS
(
SELECT 
title_id,
au_id,
SUM(sales_royalty)
FROM
step1
GROUP BY au_id, title_id
)
SELECT
au_id,
advance,
sales_royalty
FROM
step1
GROUP BY au_id;

--Challenge2
CREATE TEMPORARY TABLE IF NOT EXISTS challenge2 AS
WITH
step1 AS
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
),
step2 AS
(
SELECT 
title_id,
au_id,
SUM(sales_royalty)
FROM
step1
GROUP BY au_id, title_id
)
SELECT
au_id,
advance,
sales_royalty
FROM
step1
GROUP BY au_id;

--Challenge3
CREATE TABLE IF NOT EXISTS challenge3
AS
SELECT
au_id,
advance + sales_royalty AS profits
FROM
challenge2


