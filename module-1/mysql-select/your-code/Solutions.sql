--Challenge #1

SELECT
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
titles.title as "TITLE",
publishers.pub_name as "PUBLISHER"
FROM authors
JOIN titleauthor on authors.au_id = titleauthor.au_id 
JOIN titles on titleauthor.title_id = titles.title_id 
JOIN publishers on titles.pub_id = publishers.pub_id;

-- Challenge #2

SELECT
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
publishers.pub_name as "PUBLISHER",
COUNT(titles.title) as title_count
FROM authors
JOIN titleauthor on authors.au_id = titleauthor.au_id 
JOIN titles on titleauthor.title_id = titles.title_id 
JOIN publishers on titles.pub_id = publishers.pub_id
GROUP BY authors.au_id;

-- Challlenge #3

SELECT
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
sales.qty as "TOTAL"
FROM authors
JOIN titleauthor on authors.au_id = titleauthor.au_id 
JOIN titles on titleauthor.title_id = titles.title_id
JOIN sales on titles.title_id = sales.title_id
GROUP BY authors.au_id 
ORDER BY sales.qty DESC 
LIMIT 3
;

--Challenge #4
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
LIMIT 23


