
challenge number 1
SELECT 
authors.au_id AS author_id,
authors.au_fname AS first_name,
authors.au_lname AS last_name,
sales.title_id AS title ,
publishers.pub_id AS publisher 
FROM titles 
JOIN titleauthor 
ON titleauthor.title_id = titles.title_id 
join sales on    titles.title_id=sales.title_id
JOIN authors 
ON authors.au_id = titleauthor.au_id 
JOIN publishers 
ON publishers.pub_id  = titles.pub_id;

challenge 2

select 
authors.au_id, 
au_lname,
au_fname,
publishers.pub_name,
count(titles.title_id)
from authors
join titleauthor 
on authors.au_id=titleauthor.au_id 
join titles 
on titles.title_id = titleauthor.title_id 
join publishers 
on publishers.pub_id = titles.pub_id 
group by authors.au_id, au_lname, au_fname, pub_name 

CHALLENGE 3



