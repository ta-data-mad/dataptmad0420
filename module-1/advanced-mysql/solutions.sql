--In this query  I calculate the total ammount of advances per author

select  titles.title_id, titleauthor.au_id as author_id, titleauthor.royaltyper, titles.advance,
(titleauthor.royaltyper*titles.advance)/100 as advance_per_book
from 
titles
join
titleauthor
on titleauthor.title_id =titles.title_id
order by titles.title_id;


-- I put the results in the form of a subquery with the variables I want

select author_id, (advance_per_book) from (
select  titles.title_id, titleauthor.au_id as author_id, titleauthor.royaltyper, titles.advance,
(titleauthor.royaltyper*titles.advance)/100 as advance_per_book
from 
titles
join
titleauthor
on titleauthor.title_id =titles.title_id
order by titles.title_id);


--In this query  I calculate the total ammount of royalties per author

select titleauthor.au_id as author_id,titles.title_id,sales.qty ,titles.price,titles.royalty,titleauthor.royaltyper,
(sales.qty * titles.price * titles.royalty /100 *titleauthor.royaltyper/100) as royalty_per_sale
from 
authors
join titleauthor
on titleauthor.au_id =authors.au_id 
join titles 
on titles.title_id =titleauthor.title_id 
join sales 
on titles.title_id =sales.title_id
;


--I put the results in the form of a subquery with the variables I want

select author_id,(royalty_per_sale) from (
select titleauthor.au_id as author_id,titles.title_id,sales.qty ,titles.price,titles.royalty,titleauthor.royaltyper,
(sales.qty * titles.price * titles.royalty /100 *titleauthor.royaltyper/100) as royalty_per_sale
from 
authors
join titleauthor
on titleauthor.au_id =authors.au_id 
join titles 
on titles.title_id =titleauthor.title_id 
join sales 
on titles.title_id =sales.title_id)
order by author_id 
;

--Then I create two tables to keep those results toguether
--author_royalties
create table if not exists author_royalties as
select author_id,(royalty_per_sale) from (
select titleauthor.au_id as author_id,titles.title_id,sales.qty ,titles.price,titles.royalty,titleauthor.royaltyper,
(sales.qty * titles.price * titles.royalty /100 *titleauthor.royaltyper/100) as royalty_per_sale
from 
authors
join titleauthor
on titleauthor.au_id =authors.au_id 
join titles 
on titles.title_id =titleauthor.title_id 
join sales 
on titles.title_id =sales.title_id)
order by author_id 
;


--author_advances
create table if not exists author_advances as
select author_id, (advance_per_book) from (
select  titles.title_id, titleauthor.au_id as author_id, titleauthor.royaltyper, titles.advance,
(titleauthor.royaltyper*titles.advance)/100 as advance_per_book
from 
titles
join
titleauthor
on titleauthor.title_id =titles.title_id
order by titles.title_id);


--And I try yo put together the data in a query that doesn't work
select author_advances.author.id, author_advances.advance_per_book
from author_advances
join author_royalties 
on author_advances.author_id=author_royalties.author_id; 

