

select titleauthor.au_id as author_id, titles.title_id,
sum (titleauthor.royaltyper/100*titles.advance) as advance_per_book
from 
titles
join
titleauthor
on titleauthor.title_id =titles.title_id
group by author_id
order by author_id;


select titleauthor.au_id as author_id,titles.title_id,
sum(sales.qty * titles.price * titles.royalty /100 *titleauthor.royaltyper/100) as royalty_per_sale
from 
authors
join titleauthor
on titleauthor.au_id =authors.au_id 
join titles 
on titles.title_id =titleauthor.title_id 
join sales 
on titles.title_id =sales.title_id
group by author_id
order by author_id;