#CHALLENGE 1
 -STEP 1
SELECT 
titles.title_id  as Title_ID,
titleauthor.au_id Author_ID,
(titles.advance * titleauthor.royaltyper/ 100) as Advance,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as Royalty
FROM
titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id;

 -STEP 2
WITH table_1 as
(
SELECT
titles.title_id  as Title_ID,
titleauthor.au_id Author_ID,
(titles.advance * titleauthor.royaltyper/ 100) as Advance,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as Royalties
FROM
titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id)
SELECT 
titles.title_id as Title_ID,
titleauthor.au_id Author_ID,
SUM (Advance) as Total_advance,
SUM (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as Aggregated_royalties
FROM 
titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id
GROUP BY titleauthor.au_id;

 -STEP 3
WITH table_2 as
(
SELECT 
titles.title_id as Title_ID,
titleauthor.au_id Author_ID,
SUM (Advance) as Total_advance,
SUM (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as Aggregated_royalties
FROM 
titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id
GROUP BY titleauthor.au_id)
SELECT 
titleauthor.au_id as Author_ID,
SUM (titles.advance * titleauthor.royaltyper / 100)
+
SUM (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as Profit
FROM 
titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id
GROUP BY Author_ID
ORDER BY Profit DESC
limit 3;

#CHALLENGE 2
 -STEP 1
CREATE TEMPORARY TABLE IF NOT EXISTS tab1 as
SELECT
titles.title_id  as Title_ID,
titleauthor.au_id Author_ID,
(titles.advance * titleauthor.royaltyper/ 100) as Advance,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as Royalties
FROM
titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id;

 -STEP 2
CREATE TEMPORARY TABLE IF NOT EXISTS tab2ok as
SELECT 
titles.title_id as Title_ID,
titleauthor.au_id Author_ID,
SUM (Advance) as Total_advance,
SUM (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as Aggregated_royalties
FROM 
titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id
GROUP BY titleauthor.au_id;

 -STEP 3
CREATE TEMPORARY TABLE IF NOT EXISTS tab3 as
SELECT 
titleauthor.au_id as Author_ID,
SUM (titles.advance * titleauthor.royaltyper / 100)
+
SUM (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as Profit
FROM 
titles
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id
GROUP BY Author_ID
ORDER BY Profit DESC
limit 3;

#CHALLENGE 3
CREATE TABLE most_profiting_authors as
SELECT *
FROM tab3;
