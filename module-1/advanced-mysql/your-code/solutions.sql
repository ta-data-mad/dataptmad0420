-- CHALLENGE 1 
-- Step 1 
WITH step1 as 
(SELECT titles.title_id, 
titleauthor.au_id, (titles.advance * titleauthor.royaltyper / 100) as advance,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
FROM titles
LEFT JOIN titleauthor on titles.title_id = titleauthor.title_id
LEFT JOIN sales on titles.title_id = sales.title_id 
)

-- Step2
/*
SELECT title_id as 'Title ID', 
au_id as 'Author ID',
SUM (sales_royalty) as aggregate_roy
FROM step1
GROUP by au_id;
*/

-- Step3
-- Profits of each author by aggregating the advance and total royalties of each title
SELECT au_id as 'Author ID',
((SUM (sales_royalty)) + (SUM (advance))) as 'Profits' 
FROM step1
GROUP by au_id
ORDER BY Profits DESC 
LIMIT 3; 


-- CHALLENGE 2
CREATE TABLE if not exists table1 
as
SELECT titles.title_id, 
titleauthor.au_id, (titles.advance * titleauthor.royaltyper / 100) as advance,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
FROM titles
LEFT JOIN titleauthor on titles.title_id = titleauthor.title_id
LEFT JOIN sales on titles.title_id = sales.title_id; 

CREATE TABLE if not exists table2 as
SELECT title_id,
au_id,
SUM (sales_royalty) as aggregate_roy
FROM table1
GROUP by au_id;


CREATE TABLE if not exists table3 as
SELECT table2.au_id as 'Author ID',
(table2.aggregate_roy + SUM (table1.advance)) as 'Profits' 
FROM table1
LEFT JOIN table2 on table1.title_id = table2.title_id
GROUP by table2.au_id 
ORDER BY Profits DESC
LIMIT 3;

-- CHALLENGE 3
CREATE TABLE if not exists most_profiting_authors as
SELECT table2.au_id as 'Author ID',
(table2.aggregate_roy + SUM (table1.advance)) as 'Profits' 
FROM table1
LEFT JOIN table2 on table1.title_id = table2.title_id
GROUP by table2.au_id 
ORDER BY Profits DESC
LIMIT 3;





