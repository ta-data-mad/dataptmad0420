-- CHALLENGE 1
SELECT 
authors.au_id as [AUTHOR ID], 
authors.au_lname AS LAST_NAME, 
authors.au_fname AS FIRST_NAME, 
titles.title AS TITTLE, 
publishers.pub_name AS PUBLISHERS
FROM titles
join titleauthor
on titleauthor.title_id = titles.title_id
join authors 
on authors.au_id = titleauthor.au_id 
join publishers 
on titles.pub_id = publishers.pub_id 

-- CHALLENGE 2 
SELECT 
authors.au_id as [AUTHOR ID], 
authors.au_lname AS LAST_NAME, 
authors.au_fname AS FIRST_NAME,
publishers.pub_name AS PUBLISHERS,
count (titles.pub_id) as TITLE_COUNT
FROM titles 
join titleauthor
on titleauthor.title_id = titles.title_id
join authors 
on authors.au_id = titleauthor.au_id 
join publishers 
on titles.pub_id = publishers.pub_id 
GROUP BY 1,2,3,4
ORDER BY 5 DESC 

--CHALLENGE 3

SELECT
authors.au_id as [AUTHOR ID], 
authors.au_lname AS LAST_NAME, 
authors.au_fname AS FIRST_NAME,
sum(sales.qty)
FROM authors 
join titleauthor 
on titleauthor.au_id = authors.au_id 
join titles 
on titles.title_id = titleauthor.title_id 
join sales 
on sales.title_id = titleauthor.title_id
group by 1,2,3
order by 4 DESC 
limit 3

--CHALLENGE 4

SELECT
authors.au_id as [AUTHOR ID]
authors.au_lname AS LAST_NAME, 
authors.au_fname AS FIRST_NAME,
COALESCE(SUM(sales.qty),0) AS 'TOTAL'
FROM authors 
LEFT Join titleauthor 
on titleauthor.au_id = authors.au_id 
LEFT join titles 
on titles.title_id = titleauthor.title_id 
LEFT join sales 
on sales.title_id = titleauthor.title_id
group by 1,2,3
order by 4 DESC 







