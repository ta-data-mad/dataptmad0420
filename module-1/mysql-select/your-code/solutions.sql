# Challenge 1 - Who Have Published What At Where?
SELECT authors.au_id as AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, title as TITLE, pub_name as PUBLISHER
FROM titles
join titleauthor 
on titles.title_id = titleauthor.title_id 
join publishers 
on titles.pub_id = publishers.pub_id 
join authors 
on authors.au_id = titleauthor.au_id;

# Challenge 2 - Who Have Published How Many At Where?

SELECT authors.au_id as AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, pub_name as PUBLISHER, COUNT(title) as TITLE_COUNT
FROM titles
join titleauthor 
on titles.title_id = titleauthor.title_id 
join publishers 
on titles.pub_id = publishers.pub_id 
join authors 
on authors.au_id = titleauthor.au_id
GROUP BY authors.au_id

# Challenge 3 - Best Selling Authors

SELECT authors.au_id as AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, SUM(sales.qty) as TOTAL
FROM titles
join titleauthor 
on titles.title_id =titleauthor.title_id 
join authors 
on authors.au_id = titleauthor.au_id 
join sales 
on titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC 
limit 3

# Challenge 4 - Best Selling Authors Ranking

SELECT authors.au_id as AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, IFNULL(SUM(sales.qty),0) as TOTAL
FROM authors
left join titleauthor 
on  authors.au_id = titleauthor.au_id
left join titles 
on titles.title_id =titleauthor.title_id 
left join sales 
on titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;



