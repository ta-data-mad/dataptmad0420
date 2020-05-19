--Challenge 1

SELECT 
authors.au_id as author_id,
authors.au_lname as last_name,
authors.au_fname as first_name,
titles.title,
publishers.pub_name as publisher
FROM titles 
JOIN titleauthor 
on titleauthor.title_id = titles.title_id
JOIN authors 
on authors.au_id = titleauthor.au_id
JOIN publishers 
on publishers.pub_id = titles.pub_id; 

--Challenge 2

SELECT 
authors.au_id as author_id,
authors.au_lname as last_name,
authors.au_fname as first_name,
publishers.pub_name as publisher,
COUNT(*) as title_count
FROM titles 
JOIN titleauthor 
on titleauthor.title_id = titles.title_id
JOIN authors 
on authors.au_id = titleauthor.au_id
JOIN publishers 
on publishers.pub_id = titles.pub_id
GROUP BY author_id, publisher;

--Challenge3

SELECT 
    authors.au_id as author_id,
	authors.au_lname as last_name,
	authors.au_fname as first_name,
	SUM(sales.qty) as total
FROM 
	titles
JOIN 
	titleauthor 
	on titleauthor.title_id = titles.title_id
JOIN 
	authors 
	on authors.au_id = titleauthor.au_id
JOIN 
	sales 
	on sales.title_id = titles.title_id
GROUP BY authors.au_id 
ORDER BY total DESC
LIMIT 3;

/*SELECT *
FROM 
	titleauthor
WHERE 
	au_id = '899-46-2035';

SELECT *
FROM 
	sales
WHERE 
	title_id = 'MC3021' OR title_id = 'PS2091';*/


--Challenge 4

SELECT 
    authors.au_id as author_id,
	authors.au_lname as last_name,
	authors.au_fname as first_name,
	SUM(sales.qty) as total
FROM 
	titles
LEFT JOIN 
	titleauthor 
	on titleauthor.title_id = titles.title_id
LEFT JOIN 
	authors 
	on authors.au_id = titleauthor.au_id
LEFT JOIN 
	sales 
	on sales.title_id = titles.title_id 
GROUP BY authors.au_id 
ORDER BY total DESC;

