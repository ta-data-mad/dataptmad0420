CHALLENGE 1

Step 1 -

select
titles.title_id as Title_ID,
titleauthor.au_id as Author_ID,
(cast(titleauthor.royaltyper as float) / 100 * titles.advance) as advance,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
from sales
left join titles
on  titles.title_id = sales.title_id
left join titleauthor
on titleauthor.title_id = sales.title_id
group by sales.ord_num, titleauthor.au_id

Step 2 -

with royalties_sales_author as
(
select
titles.title_id as Title_ID,
titleauthor.au_id as Author_ID,
sales.ord_num,
(cast(titleauthor.royaltyper as float) / 100 * titles.advance) as advance,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
from sales
left join titles
on  titles.title_id = sales.title_id
left join titleauthor
on titleauthor.title_id = sales.title_id
group by sales.ord_num, titleauthor.au_id
)
select
Title_ID,
Author_ID,
advance + sales_royalty as profits
from royalties_sales_author
group by Title_ID, Author_ID

step 3 -

with total_profits as
(
with royalties_sales_author as
(
select 
titles.title_id as Title_ID,
titleauthor.au_id as Author_ID,
sales.ord_num,
(cast(titleauthor.royaltyper as float) / 100 * titles.advance) as advance,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
from sales
left join titles
on titles.title_id = sales.title_id
left join titleauthor 
on titleauthor.title_id = sales.title_id
group by sales.ord_num, titleauthor.au_id
)
select
Title_ID,
Author_ID,
(advance + sales_royalty) as profits
from royalties_sales_author
group by Title_ID, Author_ID
)
select
Author_ID,
profits
from total_profits
group by author_id
order by profits desc
limit 3

CHALLENGE 2

