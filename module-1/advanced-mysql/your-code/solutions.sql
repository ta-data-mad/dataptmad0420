Solutions of the lab Advanced-MySQL

CHALLENGE 1: Most Profiting Authors

Step1: Calculate the royalty of each sale for each author and the advance for each author and publication

select 
sales.title_id as Title_ID,
authors.au_id as Author_ID,
titles.advance*titleauthor.royaltyper/100 as advance,
titles.price * sales.qty * titles.royalty/100 * titleauthor.royaltyper/100 as sales_royalty
from titles
join titleauthor on titleauthor.title_id = titles.title_id
join authors on authors.au_id = titleauthor.au_id
join sales on sales.title_id = titles.title_id
ORDER BY author_ID desc;


Step2: Aggregate the total royalties for each title and author

WITH sales_royalty as (
select 
sales.title_id as Title_ID,
authors.au_id as Author_ID,
titles.advance*titleauthor.royaltyper/100 as advance,
titles.price * sales.qty * titles.royalty/100 * titleauthor.royaltyper/100 as sales_royalty
from titles
join titleauthor on titleauthor.title_id = titles.title_id
join authors on authors.au_id = titleauthor.au_id
join sales on sales.title_id = titles.title_id
ORDER BY author_ID DESC 
)
SELECT
Title_ID,
Author_ID,
sum(sales_royalty) as aggregated_royalties_per_title_author
from sales_royalty 
GROUP BY Author_ID;


Step3: Calculate the total profits of each author

WITH sales_royalty as (
select 
sales.title_id as Title_ID,
authors.au_id as Author_ID,
titles.advance*titleauthor.royaltyper/100 as advance,
titles.price * sales.qty * titles.royalty/100 * titleauthor.royaltyper/100 as sales_royalty
from titles
join titleauthor on titleauthor.title_id = titles.title_id
join authors on authors.au_id = titleauthor.au_id
join sales on sales.title_id = titles.title_id
ORDER BY author_ID DESC 
), royalty_per_title_author as (
SELECT
Title_ID,
Author_ID,
advance,
sum(sales_royalty) as aggregated_royalties_per_title_author
from sales_royalty 
GROUP BY Author_ID
)
select
Author_ID,
aggregated_royalties_per_title_author + advance as total_proficts
from royalty_per_title_author
ORDER BY total_proficts DESC 
LIMIT 3;


CHALLENGE 2: Alternative solution

CREATE TEMPORARY TABLE IF NOT EXISTS sales_royalty as
select 
sales.title_id as Title_ID,
authors.au_id as Author_ID,
titles.advance*titleauthor.royaltyper/100 as advance,
titles.price * sales.qty * titles.royalty/100 * titleauthor.royaltyper/100 as sales_royalty
from titles
join titleauthor on titleauthor.title_id = titles.title_id
join authors on authors.au_id = titleauthor.au_id
join sales on sales.title_id = titles.title_id
ORDER BY author_ID DESC;

CREATE TEMPORARY TABLE IF NOT EXISTS royalty_per_title_author as
SELECT
Title_ID,
Author_ID,
advance,
sum(sales_royalty) as aggregated_royalties_per_title_author
from sales_royalty 
GROUP BY Author_ID;

select
Author_ID,
aggregated_royalties_per_title_author + advance as total_proficts
from royalty_per_title_author
ORDER BY total_proficts DESC 
LIMIT 3;


CHALLENGE 3: Create a permanent table into db.

CREATE TABLE IF NOT EXISTS most_profiting_authors as
WITH sales_royalty as (
select 
sales.title_id as Title_ID,
authors.au_id as Author_ID,
titles.advance*titleauthor.royaltyper/100 as advance,
titles.price * sales.qty * titles.royalty/100 * titleauthor.royaltyper/100 as sales_royalty
from titles
join titleauthor on titleauthor.title_id = titles.title_id
join authors on authors.au_id = titleauthor.au_id
join sales on sales.title_id = titles.title_id
ORDER BY author_ID DESC
), royalty_per_title_author as (
SELECT
Title_ID,
Author_ID,
advance,
sum(sales_royalty) as aggregated_royalties_per_title_author
from sales_royalty 
GROUP BY Author_ID
)
select
Author_ID,
aggregated_royalties_per_title_author + advance as total_proficts
from royalty_per_title_author
ORDER BY total_proficts DESC 
LIMIT 3;

select *
from most_profiting_authors;
