CHALLLENGE 1
select authors.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
titles.title as TITLE,
publishers.pub_name as PUBLISHER
from titles
join titleauthor 
on titleauthor.title_id = titles.title_id
join authors 
on authors.au_id = titleauthor.au_id
join publishers 
on publishers.pub_id = titles.pub_id;

select count(*) from titleauthor;

CHALLENGE 2
select
authors.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
publishers.pub_name as PUBLISHER,
count(titles.title) as TITLE_COUNT
from titles
join titleauthor 
on titleauthor.title_id = titles.title_id
join authors 
on authors.au_id = titleauthor.au_id
join publishers 
on publishers.pub_id = titles.pub_id
group by titles.title;

CHALLENGE 3
select
authors.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
SUM(sales.qty ) as TOTAL
from titles
join titleauthor 
on titles.title_id = titleauthor.title_id
join authors 
on authors.au_id = titleauthor.au_id
join sales 
on sales.title_id = titles.title_id
GROUP by authors.au_id
ORDER by TOTAL DESC
LIMIT 3;