CHALLENGE 1

—Selection of the titles each author has published on each publisher
select authors.au_id as AUTHORID,
authors.au_lname as LASTNAME,
authors.au_fname as FIRSTNAME,
titles.title as TITLE,
publishers.pub_name as PUBLISHER
from titles
join titleauthor 
on titleauthor.title_id = titles.title_id
join authors 
on authors.au_id = titleauthor.au_id
join publishers 
on publishers.pub_id = titles.pub_id;

—We make a select count to see if the number of lines, is the same as the number of records in the table title author
select count (*) from titleauthor;

CHALLENEGE 2
— Count the number of titles each author has published
select authors.au_id as AUTHORID,
authors.au_lname as LASTNAME,
authors.au_fname as FIRSTNAME,
publishers.pub_name as PUBLISHER,
COUNT(titles.title) as TITLECOUNT
from titles
join titleauthor 
on titleauthor.title_id = titles.title_id
join authors 
on authors.au_id = titleauthor.au_id
join publishers 
on publishers.pub_id = titles.pub_id
group BY titles.title;

CHALLENGE 3
SELECT
authors.au_id as AUTHORID,
authors.au_lname as LASTNAME,
authors.au_fname as FIRSTNAME,
SUM(sales.qty) as TOTAL_SALES
from titles
join titleauthor 
on titleauthor.title_id = titles.title_id
join authors 
on authors.au_id = titleauthor.au_id
join sales 
on sales.title_id = titles.title_id
group by AUTHORS.au_id 
order by TOTAL_SALES DESC
limit 3;