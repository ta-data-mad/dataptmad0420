Solutions according to the lab

-- 1st challenge:
-- In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author has published at which publishers.
-- If your query is correct, the total rows in your output should be the same as the total number of records in Table titleauthor.

SELECT 
authors.au_id as AUTHOR_ID, 
authors.au_lname as LAST_NAME, 
authors.au_fname as FIRST_NAME, 
titles.title as TITLE, 
publishers.pub_name as PUBLISHER
from titles
join titleauthor on titleauthor.title_id = titles.title_id
join authors on authors.au_id = titleauthor.au_id
join publishers on publishers.pub_id = titles.pub_id;

SELECT count(*)
from titleauthor;

-- 2nd challenge:
-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.
-- To check if your output is correct, sum up the TITLE COUNT column. The sum number should be the same as the total number of records in Table titleauthor.

select 
authors.au_id as AUTHOR_ID, 
authors.au_lname as LAST_NAME, 
authors.au_fname as FIRST_NAME,  
publishers.pub_name as PUBLISHER,
count (titles.pub_id) as TITLE_COUNT
from titles
join titleauthor on titleauthor.title_id = titles.title_id
join authors on authors.au_id = titleauthor.au_id
join publishers on publishers.pub_id = titles.pub_id
GROUP BY authors.au_fname, publishers.pub_name
ORDER BY TITLE_COUNT desc;

SELECT count (*)
from titleauthor;


