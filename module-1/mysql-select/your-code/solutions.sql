------- CHALLENGE 1 -------
SELECT 
authors.au_id as "AUTHOR ID", 
authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME", 
titles.title AS "TITLE", 
publishers.pub_name AS "PUBLISHER"
FROM titles
join titleauthor
on titleauthor.title_id = titles.title_id
join authors 
on authors.au_id = titleauthor.au_id 
join publishers 
on titles.pub_id = publishers.pub_id 

------- CHALLENGE 2 -------
SELECT 
authors.au_id as "AUTHOR ID", 
authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME", 
publishers.pub_name AS "PUBLISHER",
count (titles.pub_id) as "TITLE COUNT"
FROM titles 
join titleauthor
on titleauthor.title_id = titles.title_id
join authors 
on authors.au_id = titleauthor.au_id 
join publishers 
on titles.pub_id = publishers.pub_id 
GROUP BY 1,2,3,4

------- CHALLENGE 3 -------
SELECT 
authors.au_id as "AUTHOR ID", 
authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME", 
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

------- CHALLENGE 4 -------

SELECT 
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
COALESCE(SUM(sales.qty),case when sales.qty ISNULL THEN 0 END) as "TOTAL"
FROM authors
JOIN titleauthor
on titleauthor.au_id = authors.au_id
join sales
on sales.title_id = titleauthor.title_id
group BY titleauthor.au_id
order BY total DESC;

