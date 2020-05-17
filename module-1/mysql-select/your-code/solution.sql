--Challenge 1 - Who Have Published What At Where?
SELECT
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
titles.title as TITLE,
publishers.pub_name as PUBLISHER
FROM titles 
JOIN publishers 
ON titles.pub_id = publishers.pub_id 
JOIN titleauthor 
ON titles.title_id = titleauthor.title_id 
JOIN authors 
ON titleauthor .au_id = authors.au_id;

 
