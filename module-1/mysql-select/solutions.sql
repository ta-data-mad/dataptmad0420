Solutions Exercises -

CHALLENGE 1

select authors.au_lname as last_name,
authors.au_id as author_id,
authors.au_fname as first_name,
titles.title as title,
publishers.pub_name as publisher_name
from titles
join titleauthor
on titles.title_id = titleauthor.title_id
join authors
on authors.au_id = titleauthor.au_id
join publishers
on titles.pub_id = publishers.pub_id


CHALLENGE 2

select
authors.au_id as author_id,
authors.au_fname as first_name,
authors.au_lname as last_name,
publishers.pub_name as publisher_name,
count(titles.title) as titles_count
from titles
join titleauthor
on titleauthor.title_id = titles.title_id
join publishers
on publishers.pub_id = titles.pub_id
join authors
on authors.au_id = titleauthor.au_id
group by author_id,
publishers.pub_id
order by titles_count desc,
author_id desc


CHALLENGE 3

select
authors.au_id as author_id,
authors.au_fname as first_name,
authors.au_lname as last_name,
count(sales.qty) as total
from titles
join titleauthor
on titleauthor.title_id = titles.title_id
join authors
on authors.au_id = titleauthor.au_id
join sales
on sales.title_id = titles.title_id
group by authors.au_id
order by total desc
limit 3


CHALLENGE 4


select
authors.au_id as author_id,
authors.au_fname as first_name,
authors.au_lname as last_name,
count(sales.qty) as total
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
join sales
on sales.title_id = titles.title_id
group by authors.au_id
order by total desc
