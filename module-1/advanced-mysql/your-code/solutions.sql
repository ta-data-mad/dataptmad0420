---------CHALLENGE 1------------

STEP 1:

SELECT
titleauthor.title_id as "title_id",
titleauthor.au_id as "author_id",
titles.advance * titleauthor.royaltyper / 100 as "advance",
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as "sales_royalty"
FROM titleauthor
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN sales
ON titles.title_id = sales.title_id
GROUP BY titles.title_id, titleauthor.au_id, sales.qty;

STEP 2:

WITH "totals" AS (
SELECT
titleauthor.title_id as "title_id",
titleauthor.au_id as "author_id",
titles.advance * titleauthor.royaltyper / 100 as "advance",
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as "sales_royalty"
FROM titleauthor
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN sales
ON titles.title_id = sales.title_id
GROUP BY titles.title_id, titleauthor.au_id, sales.qty)
SELECT
title_id,
author_id,
advance,
SUM(sales_royalty) as "total_royalties"
FROM totals
GROUP BY title_id, author_id;

STEP 3:

SELECT author_id,
SUM(advance + total_royalties) AS "profit"
FROM
(WITH "totals" AS (
SELECT
titleauthor.title_id as "title_id",
titleauthor.au_id as "author_id",
titles.advance * titleauthor.royaltyper / 100 as "advance",
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as "sales_royalty"
FROM titleauthor
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN sales
ON titles.title_id = sales.title_id
GROUP BY titles.title_id, titleauthor.au_id, sales.qty)
SELECT
title_id,
author_id,
advance,
SUM(sales_royalty) as "total_royalties"
FROM totals
GROUP BY title_id, author_id
)
GROUP BY author_id
ORDER BY profit DESC
LIMIT 3;



---------CHALLENGE 2------------

CREATE TEMPORARY TABLE IF NOT EXISTS "rev" AS
SELECT
titleauthor.title_id as "title_id",
titleauthor.au_id as "author_id",
titles.advance * titleauthor.royaltyper / 100 as "advance",
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as "sales_royalty"
FROM titleauthor
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN sales
ON titles.title_id = sales.title_id
GROUP BY titles.title_id, titleauthor.au_id, sales.qty;
SELECT * 
FROM rev;


CREATE TEMPORARY TABLE IF NOT EXISTS "titles_rev" AS
WITH "totals" AS (
SELECT
titleauthor.title_id as "title_id",
titleauthor.au_id as "author_id",
titles.advance * titleauthor.royaltyper / 100 as "advance",
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as "sales_royalty"
FROM titleauthor
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN sales
ON titles.title_id = sales.title_id
GROUP BY titles.title_id, titleauthor.au_id, sales.qty)
SELECT
title_id,
author_id,
advance,
SUM(sales_royalty) as "total_royalties"
FROM totals
GROUP BY title_id, author_id;
SELECT *
FROM titles_rev;

CREATE TEMPORARY TABLE IF NOT EXISTS "t_profits" AS
SELECT author_id,
SUM(advance + total_royalties) AS "profit"
FROM
(WITH "totals" AS (
SELECT
titleauthor.title_id as "title_id",
titleauthor.au_id as "author_id",
titles.advance * titleauthor.royaltyper / 100 as "advance",
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as "sales_royalty"
FROM titleauthor
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN sales
ON titles.title_id = sales.title_id
GROUP BY titles.title_id, titleauthor.au_id, sales.qty)
SELECT
title_id,
author_id,
advance,
SUM(sales_royalty) as "total_royalties"
FROM totals
GROUP BY title_id, author_id
)
GROUP BY author_id
ORDER BY profit DESC
LIMIT 3;
SELECT *
FROM t_profits


---------CHALLENGE 3------------

CREATE TABLE IF NOT EXISTS "most_profiting_authors" AS
SELECT author_id, profit
FROM t_profits;

