
challenge number 1
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

challenge 2

SELECT pub_name,
COUNT((titles.title_id ), 
FROM publishers, 
join titles, 
on publishers.pub_id  = titles.pub_id, 
GROUP BY pub_name, 
ORDER BY titles_published DESC;
#ON THIS QUERY IS SHOWS ME A SYNTAX ERROR EVERY TIME I TRY TO RUN IT

CHALLENGE 3



