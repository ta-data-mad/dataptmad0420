CHALLENGE 1

WITH
titleauth AS
(
SELECT *
FROM titles
LEFT JOIN titleauthor ON titles.title_id = titleauthor.title_id 
LEFT JOIN sales ON titles.title_id = sales.title_id 
),
royalty_and_advance AS
(
SELECT title_id, au_id, advance * royaltyper / 100 AS advance, price * qty * royalty / 100 * royaltyper / 100 AS sales_royalty
FROM titleauth
),
royalty_and_advance_agreggated AS
(
SELECT title_id AS "Title ID", au_id AS "Author ID", SUM(sales_royalty) AS "Aggregated royalties", SUM(advance) AS "Aggregated advance"
FROM royalty_and_advance
GROUP BY "Title ID", "Author ID"
)
SELECT "Title ID", "Author ID", "Aggregated royalties" + "Aggregated advance" AS "Profits"
FROM royalty_and_advance_agreggated
GROUP BY "Title ID", "Author ID"
ORDER BY "Profits" DESC
LIMIT 3
;


CHALLENGE 2


