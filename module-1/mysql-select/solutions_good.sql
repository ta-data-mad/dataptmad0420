-- Challenge #1
SELECT 
authors.au_id as "Author Id",
authors.au_lname as  "Last Name",
authors.au_fname as "First Name",
titles.title as "Title",
publishers.pub_name as "Publisher"
FROM authors
join titleauthor on authors.au_id = titleauthor.au_id -- primer punto de relacion
join titles on titleauthor.title_id = titles.title_id -- segundo punto de relacion
join publishers on titles.pub_id = publishers.pub_id -- tercer punto de relacion
-------
-- Challenge #2
SELECT
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
publishers.pub_name as "PUBLISHER",
COUNT(*) as "TITLE COUNT"
FROM authors
LEFT JOIN titleauthor on authors.au_id = titleauthor.au_id 
LEFT JOIN titles on titleauthor.title_id = titles.title_id
LEFT JOIN publishers on titles.pub_id = publishers.pub_id
GROUP BY authors.au_id
ORDER BY "TITLE COUNT" DESC
-------
--Challenge 3

SELECT
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
sales.qty as "TOTAL"
FROM authors
LEFT JOIN titleauthor on authors.au_id = titleauthor.au_id 
LEFT JOIN titles on titleauthor.title_id = titles.title_id
LEFT JOIN sales on titles.title_id = sales.title_id
GROUP BY authors.au_id 
ORDER BY sales.qty DESC 
LIMIT 3
------
-- Challenge 4
SELECT
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
COALESCE((sales.qty),case when sales.qty ISNULL THEN 0 END) as "TOTAL"
FROM authors
LEFT JOIN titleauthor on authors.au_id = titleauthor.au_id 
LEFT JOIN titles on titleauthor.title_id = titles.title_id
LEFT JOIN sales on titles.title_id = sales.title_id
GROUP BY authors.au_id 
ORDER BY sales.qty DESC 
LIMIT 23