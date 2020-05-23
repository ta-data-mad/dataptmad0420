
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

SELECT
authors.au_id as author_id,
authors.au_fname as author_first_name,
authors.au_lname as author_last_name, 
sum(sales.qty) as quantity <--I used sum but it gives the same amount without it
FROM authors 
join titleauthor 
on authors.au_id = titleauthor.au_id
JOIN titles 
on titleauthor.title_id = titles.title_id 
JOIN sales 
on sales.title_id = titleauthor.title_id
GROUP BY authors.au_lname, authors.au_fname, authors.au_id,sales.qty
ORDER BY quantity DESC 
LIMIT 3;

#its giving me double writers I think i tried distinct but it gave me an error.
CHALLENGE 4
SELECT
authors.au_id as author_id,
authors.au_fname as author_first_name,
authors.au_lname as author_last_name, 
SUM(sales.qty) as quantity
FROM authors 
join titleauthor 
on authors.au_id = titleauthor.au_id
JOIN titles 
on titleauthor.title_id = titles.title_id 
JOIN sales 
on sales.title_id = titleauthor.title_id
GROUP BY authors.au_lname, authors.au_fname, authors.au_id,sales.qty
ORDER BY quantity DESC 
LIMIT 28;<-- I used the limit so it only gives us 28 as the exercise asks us to do
--bc it doesnt let me use the sum, or count. it only gave me errors, I dont re
--ally understand the language I think, I've read the sql tutorial 3 times 
--and still dont get it.


