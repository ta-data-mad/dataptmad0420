#Challenge 1 - Who Have Published What At Where?
SELECT
authors.au_id AS "Author ID",
authors.au_lname AS "Last Name",
authors.au_fname AS "First Name", 
titles.title AS "Title",
publishers.pub_name AS "Publisher"
FROM authors 
JOIN titleauthor
ON titleauthor.au_id = authors.au_id 
JOIN titles 
ON titleauthor.title_id = titles.title_id
JOIN publishers 
ON titles.pub_id = publishers.pub_id 

#Challenge 2 - Who Have Published How Many At Where?

