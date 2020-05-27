Challenge 1

select
titles.title_id as 'Title ID',
titleauthor.au_id as 'Author ID',
(cast(titleauthor.royaltyper as float) / 100 * titles.advance) as advance,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty,
titles.advance as 'REAL ADVANCE',
titleauthor.royaltyper
from sales
left join titles
on  titles.title_id = sales.title_id
left join titleauthor
on titleauthor.title_id = sales.title_id
group by sales.ord_num, titleauthor.au_id
order by advance desc

