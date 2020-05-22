select authors.au_id as author_id, 
authors.au_lname as last_name, 
authors.au_fname as first_name,
titles.title,
publishers.pub_name as publisher
from titles
JOIN titleauthor
on titles.title_id = titleauthor.title_id
JOIN authors
on authors.au_id = titleauthor.au_id
JOIN publishers
on titles.pub_id = publishers.pub_id;

SELECT authors.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
titles.title,
publishers.pub_name as PUBLISHER,
COUNT (*) 
FROM titles
JOIN titleauthor 
on titles.title_id = titleauthor.title_id
JOIN authors 
on authors.au_id = titleauthor.au_id 
JOIN publishers 
on titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name;

SELECT
authors.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
sum(sales.qty) as SALES
FROM titles
LEFT JOIN sales
on titles.title_id = sales.title_id
JOIN titleauthor 
on titles.title_id = titleauthor.title_id
JOIN authors 
on authors.au_id = titleauthor.au_id 
GROUP BY authors.au_id
ORDER BY SALES DESC
LIMIT 3;

SELECT
authors.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
COALESCE(sum(sales.qty),0) as SALES
from authors
LEFT JOIN titleauthor
on authors.au_id = titleauthor.au_id
LEFT JOIN titles
on titles.title_id = titleauthor.title_id
LEFT JOIN sales
on titles.title_id = sales.title_id
group by authors.au_id
ORDER BY SALES DESC;
