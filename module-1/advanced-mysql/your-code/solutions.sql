-- CHALLENGE 1

-- Step 1
SELECT  
titles.title_id as title_ID,
titleauthor.au_id AS author_ID,
titles.advance * titleauthor.royaltyper / 100 as Advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sale_royalty
FROM titles  
join titleauthor
on titleauthor.title_id = titles.title_id
join sales 
on sales.title_id = titleauthor.title_id
GROUP by titles.title_id,titleauthor.au_id;


--Step 2
with aggregate_royalties as 
(
SELECT 
titles.title_id as title_ID,
titleauthor.au_id AS author_ID,
titles.advance * titleauthor.royaltyper / 100 as Advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sale_royalty
FROM titles 
join titleauthor
on titleauthor.title_id = titles.title_id
join sales 
on sales.title_id = titleauthor.title_id
order by titleauthor.au_id 
)
SELECT 
aggregate_royalties.title_ID,
aggregate_royalties.author_ID,
SUM(aggregate_royalties.sale_royalty) as royalty
FROM aggregate_royalties 
GROUP by aggregate_royalties.author_ID;

--Step 3

with aggregate_royalties as 
(
SELECT 
titles.title_id as title_ID,
titleauthor.au_id AS author_ID,
titles.advance * titleauthor.royaltyper / 100 as Advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sale_royalty
FROM titles 
join titleauthor
on titleauthor.title_id = titles.title_id
join sales 
on sales.title_id = titleauthor.title_id
order by titleauthor.au_id 
), royalty as
(SELECT 
aggregate_royalties.title_ID,
aggregate_royalties.author_ID,
aggregate_royalties.Advance,
SUM(aggregate_royalties.sale_royalty) as royalty
FROM aggregate_royalties 
GROUP by aggregate_royalties.author_ID
)
SELECT 
royalty.author_ID
SUM(royalty.sale_royalty, royalty.advance) as profits
FROM royalty 
order by profits DESC 
limit 3;


-- CHALLENGE 2
CREATE TEMPORARY TABLE aggregate_royalties AS
SELECT 
titles.title_id as title_ID,
titleauthor.au_id AS author_ID,
titles.advance * titleauthor.royaltyper / 100 as Advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sale_royalty
FROM titles 
join titleauthor
on titleauthor.title_id = titles.title_id
join sales 
on sales.title_id = titleauthor.title_id
order by titleauthor.au_id DESC 
CREATE TEMPORARY TABLE royalty AS
SELECT 
ELECT 
aggregate_royalties.title_ID,
aggregate_royalties.author_ID,
aggregate_royalties.Advance,
SUM(aggregate_royalties.sale_royalty) as royalty
FROM aggregate_royalties 
GROUP by aggregate_royalties.author_ID
