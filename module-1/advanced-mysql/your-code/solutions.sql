/*CHALLENGE 1

STEP 1
1. Title ID
2. Author ID
3. Advance of each title and author
4. Royalty of each sale


SOLUTION QUERY*/
select 
titles.title_id  as TITLE_ID,
titleauthor.au_id AUTHOR_ID,
(titles.advance * titleauthor.royaltyper/ 100) as ADVANCE,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as SALES_ROYALTIES
FROM 
titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id;

/*STEP2
SOLUTION QUERY*/
with table_step1 as
(
select 
titles.title_id  as TITLE_ID,
titleauthor.au_id AUTHOR_ID,
(titles.advance * titleauthor.royaltyper/ 100) as ADVANCE,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as SALES_ROYALTIES
FROM 
titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id)
select 
titles.title_id  as TITLE_ID,
titleauthor.au_id AUTHOR_ID,
SUM(ADVANCE) AS "TOTAL_ADVANCE",
sum(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as "AGGREGATE_ROYALTIES"
FROM 
titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id
GROUP BY titleauthor.au_id;

/*STEP3
SOLUTION QUERY*/
with table_step2 as
(
select 
titles.title_id  as TITLE_ID,
titleauthor.au_id AUTHOR_ID,
SUM(ADVANCE) AS "TOTAL_ADVANCE",
sum(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as "AGGREGATE_ROYALTIES"
--SUM(SALES_ROYALTIES) as "AGGREGATE_ROYALTIES"
FROM 
titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id
GROUP BY titleauthor.au_id)
select
titleauthor.au_id as AUTHOR_ID,
SUM((titles.advance * titleauthor.royaltyper) / 100)
+
sum(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS "PROFIT"
FROM 
titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id
GROUP BY AUTHOR_ID
ORDER BY PROFIT DESC
limit 3;


--CHALLENGE 2

--STEP 1
--CREATE TEMPORARY TABLE
CREATE TEMPORARY TABLE IF NOT EXISTS TEMP_TABLE_1 AS
SELECT
titles.title_id  as TITLE_ID,
titleauthor.au_id AUTHOR_ID,
(titles.advance * titleauthor.royaltyper/ 100) as ADVANCE,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as SALES_ROYALTIES
FROM 
titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id;

--SELECT *
--FROM TEMP_TABLE_1;

--STEP 2
--CREATE TEMPORARY TABLE
CREATE TEMPORARY TABLE IF NOT EXISTS TEMP_TABLE_TOTALS AS
select 
titles.title_id  as TITLE_ID,
titleauthor.au_id AUTHOR_ID,
SUM(ADVANCE) AS "TOTAL_ADVANCE",
sum(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as "AGGREGATE_ROYALTIES"
FROM 
titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id
GROUP BY titleauthor.au_id;

--SELECT *
--FROM TEMP_TABLE_TOTALS;


--STEP 3
--CREATE TEMPORARY TABLE
CREATE TEMPORARY TABLE IF NOT EXISTS TEMP_TABLE_PROFIT AS
select
titleauthor.au_id as AUTHOR_ID,
SUM((titles.advance * titleauthor.royaltyper) / 100)
+
sum(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS "PROFIT"
FROM 
titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id
GROUP BY AUTHOR_ID
ORDER BY PROFIT DESC
limit 3;

--SELECT *
--FROM TEMP_TABLE_PROFIT;

--CHALLENGE 3
CREATE TABLE most_profiting_authors AS
SELECT *
FROM TEMP_TABLE_PROFIT;