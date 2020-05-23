--CHALLENGE 1

SELECT authors.au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", titles.title as "TITLE", publishers.pub_name as "PUBLISHER"
from authors left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
join publishers
on titles.pub_id = publishers.pub_id;

-- CHALLENGE 2

SELECT authors.au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", publishers.pub_name as "PUBLISHER", count(titles.title) as "TITLE COUNT"
from authors left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
join publishers
on titles.pub_id = publishers.pub_id
group by authors.au_id
order by "TITLE COUNT" desc;

-- CHALLENGE 3

SELECT authors.au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", sales.qty AS "TOTAL"
from authors LEFT join titleauthor 
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
join sales
on titles.title_id = sales.title_id
GROUP BY authors.au_id
order by "TOTAL" desc
limit 3;


-- CHALLENGE 4


SELECT authors.au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", sales.qty AS "TOTAL"
from authors LEFT join titleauthor 
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
LEFT join sales
on titles.title_id = sales.title_id
GROUP BY authors.au_id
order by "TOTAL" desc;

