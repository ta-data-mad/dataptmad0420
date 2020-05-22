Challenge 1

Select authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", titles.title 
as "TITLE", publishers.pub_name as "PUBLISHER"
from authors
join titleauthor
on titleauthor.au_id = authors.au_id
join titles 
on titleauthor.title_id = titles.title_id
join publishers 
on titles.pub_id = publishers.pub_id
order by "AUTHOR ID" asc, "TITLE" desc;

Select Count(*)
from titleauthor;

Challenge 2

Select authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", publishers.pub_name as "PUBLISHER", 
Count (titles.title) as "TITLE COUNT"
from authors
join titleauthor
on titleauthor.au_id = authors.au_id
join titles 
on titleauthor.title_id = titles.title_id
join publishers 
on titles.pub_id = publishers.pub_id
group by publishers.pub_name, authors.au_id
ORDER by "AUTHOR ID" Desc, "TITLE" asc; 

select count("TITLE COUNT")
from authors
join titleauthor
on titleauthor.au_id = authors.au_id
join titles 
on titleauthor.title_id = titles.title_id
join publishers 
on titles.pub_id = publishers.pub_id;

Challenge 3

select authors.au_id as "AUTHERS ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", sum(Sales.qty) as "TOTAL"
from authors
left join titleauthor
on authors.au_id=titleauthor.au_id
left join titles 
on titleauthor.title_id=titles.title_id
left join sales 
on titles.title_id=sales.title_id
group by authors.au_id 
order by("TOTAL")desc
limit 3;

Challenge 4

select authors.au_id as "AUTHERS ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", 
coalesce(sum(Sales.qty),0) as "TOTAL"
from authors
left join titleauthor
on authors.au_id=titleauthor.au_id
left join titles 
on titleauthor.title_id=titles.title_id
left join sales 
on titles.title_id=sales.title_id
group by authors.au_id 
order by("TOTAL")desc;



