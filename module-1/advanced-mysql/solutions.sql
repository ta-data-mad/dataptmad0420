SELECT
authors.au_id as AUTHOR_ID,
titles.title_id as TITLE_ID,
COALESCE((titles.advance * titleauthor.royaltyper / 100),0) AS ADVANCED,
COALESCE((titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100),0) AS SALES_ROYALTY
from authors
LEFT JOIN titleauthor
on authors.au_id = titleauthor.au_id
LEFT JOIN titles
on titles.title_id = titleauthor.title_id
LEFT JOIN sales
on titles.title_id = sales.title_id
GROUP BY AUTHOR_ID;



WITH total_royalties as 
(
SELECT 
titleauthor.au_id as AUTHOR_ID,
titles.title_id as TITLE_ID,
COALESCE((titles.advance * titleauthor.royaltyper / 100),0) AS ADVANCED,
COALESCE((titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100),0) AS SALES_ROYALTY
FROM titles
LEFT JOIN titleauthor
on titles.title_id = titleauthor.title_id
JOIN sales
on titles.title_id = sales.title_id 
GROUP BY AUTHOR_ID
)
SELECT
AUTHOR_ID,
TITLE_ID,
SUM(SALES_ROYALTY) AS SUM_SALES
FROM total_royalties
GROUP BY TITLE_ID
ORDER BY SUM_SALES DESC;


WITH total_royalties as 
(
SELECT 
titleauthor.au_id as AUTHOR_ID,
titles.title_id as TITLE_ID,
COALESCE((titles.advance * titleauthor.royaltyper / 100),0) AS ADVANCED,
COALESCE((titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100),0) AS SALES_ROYALTY
FROM titleauthor 
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN sales
on sales.title_id = titles.title_id
), total_profits AS
(
SELECT
AUTHOR_ID,
TITLE_ID,
ADVANCED,
SUM(SALES_ROYALTY) AS SUM_SALES
FROM total_royalties
GROUP BY TITLE_ID, AUTHOR_ID
ORDER BY SUM_SALES DESC
)
SELECT 
AUTHOR_ID,
SUM(ADVANCED+SUM_SALES) AS PROFITS
FROM total_profits
GROUP BY AUTHOR_ID
ORDER BY PROFITS DESC 
LIMIT 3
;

CREATE TEMPORARY TABLE IF NOT EXISTS temporary_table_royalties AS
WITH total_royalties as 
(
SELECT 
titleauthor.au_id as AUTHOR_ID,
titles.title_id as TITLE_ID,
COALESCE((titles.advance * titleauthor.royaltyper / 100),0) AS ADVANCED,
COALESCE((titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100),0) AS SALES_ROYALTY
FROM titleauthor 
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN sales
on sales.title_id = titles.title_id
), total_profits AS
(
SELECT
AUTHOR_ID,
TITLE_ID,
ADVANCED,
SUM(SALES_ROYALTY) AS SUM_SALES
FROM total_royalties
GROUP BY TITLE_ID, AUTHOR_ID
ORDER BY SUM_SALES DESC
)
SELECT 
AUTHOR_ID,
SUM(ADVANCED+SUM_SALES) AS PROFITS
FROM total_profits
GROUP BY AUTHOR_ID
ORDER BY PROFITS DESC 
LIMIT 3
;

CREATE TABLE IF NOT EXISTS most_profiting_authors AS
WITH total_royalties as 
(
SELECT 
titleauthor.au_id as AUTHOR_ID,
titles.title_id as TITLE_ID,
COALESCE((titles.advance * titleauthor.royaltyper / 100),0) AS ADVANCED,
COALESCE((titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100),0) AS SALES_ROYALTY
FROM titleauthor 
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN sales
on sales.title_id = titles.title_id
), total_profits AS
(
SELECT
AUTHOR_ID,
TITLE_ID,
ADVANCED,
SUM(SALES_ROYALTY) AS SUM_SALES
FROM total_royalties
GROUP BY TITLE_ID, AUTHOR_ID
ORDER BY SUM_SALES DESC
)
SELECT 
AUTHOR_ID,
SUM(ADVANCED+SUM_SALES) AS PROFITS
FROM total_profits
GROUP BY AUTHOR_ID
ORDER BY PROFITS DESC;
