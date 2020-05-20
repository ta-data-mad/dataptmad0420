SELECT
authors.au_id AS author_id,
authors.au_name AS last_name,
authors.au_fname AS first_name,
titles.title AS title,
publishers.pub_name AS publisher
FROM titles 
JOIN titleauthor
ON titleauthor.title_id = titles.title.id
JOIN authors
ON authors.au_id = titleauthor.au_id 
JOIN publishers 
ON publishers.pub_id  = titles.pub_id 
