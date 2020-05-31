--Challenge 1
WITH sales_royalty as  --calculate the advance and the royalty of each author and title
(select 
titles.title_id as title_ID,
authors.au_id as Author_ID,
titles.advance * titleauthor.royaltyper / 100 as Advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as Sales_royalty
from titles 
left join titleauthor 
on titleauthor.title_id = titles.title_id 
left join sales 
on sales.title_id =titles.title_id
left join authors 
on authors.au_id =titleauthor.au_id
),
royalty_for_title_and_author_table as --we sum the royalty and group by titles and authors
(select 
title_ID,
Author_ID,
Advance,
sum(Sales_royalty) as Aggregated_royalties
from sales_royalty
group by title_ID, Author_ID
)
select  -- we sum the advance and the royalty and group by authors, order by total profit
Author_ID,
sum(Advance + Aggregated_royalties) as Total_profit
from royalty_for_title_and_author_table
group by Author_ID
order by Total_profit desc
limit 3;


--challenge 2
--create temporary  table 1:
create temporary table if not exists sales_royalty_t as 
select 
titles.title_id as title_ID,
authors.au_id as Author_ID,
titles.advance * titleauthor.royaltyper / 100 as Advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as Sales_royalty
from titles 
left join titleauthor 
on titleauthor.title_id = titles.title_id 
left join sales 
on sales.title_id =titles.title_id
left join authors 
on authors.au_id =titleauthor.au_id;

--create temporary table 2:
create temporary table if not exists royalty_for_title_and_author_table_t as
select 
title_ID,
Author_ID,
Advance,
sum(Sales_royalty) as Aggregated_royalties
from sales_royalty_t
group by title_ID, Author_ID;

--create temporary table 3:
create temporary table if not exists consult_challenge_2 as
select 
Author_ID,
sum(Advance + Aggregated_royalties) as Total_profit
from royalty_for_title_and_author_table_t
group by Author_ID
order by Total_profit desc
limit 3;

-- consult the result in the temporary tables:
SELECT * FROM consult_challenge_2

