CHALLENGE 1

with total_profits as
(
with royalties_sales_author as
(
select 
titles.title_id as Title_ID,
titleauthor.au_id as Author_ID,
sales.ord_num,
(titleauthor.royaltyper * titles.advance / 100) as advance,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
from titles
join sales
on sales.title_id = titles.title_id
join titleauthor 
on titleauthor.title_id = sales.title_id
)
select
Author_ID,
(advance + sales_royalty) as profits
from royalties_sales_author
group by Title_ID, Author_ID
)
select
Author_ID,
profits
from total_profits
order by profits desc
limit 3

CHALLENGE 2

