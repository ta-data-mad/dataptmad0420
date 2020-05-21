CHALLENGE 1:
select authors.au_id as author_id, 
authors.au_lname as last_name,
authors.au_fname as first_name,
titles.title as title,
publishers.pub_name as publisher
from titles
join titleauthor
on titleauthor.title_id = titles.title_id
join authors 
on authors.au_id = titleauthor.au_id
join publishers
on publishers.pub_id = titles.pub_id

CHALLENGE 2:

CHALLENGE 3:

CHALLENGE 4:
