-- Challenge 1 - Who Have Published What At Where?

select authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME", 
authors.au_fname as "FIRST NAME", 
titles.title as TITLE,
publishers.pub_name as "PUBLISHER"
from authors
join titleauthor on titleauthor.au_id = authors.au_id 
join titles on titles.title_id = titleauthor.title_id 
join publishers on publishers.pub_id = titles.pub_id ;


-- Challenge 2 - Who Have Published How Many At Where?

select authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME", 
authors.au_fname as "FIRST NAME", 
publishers.pub_name as "PUBLISHER",
count(publishers.pub_id ) as "TITLE COUNT"
from authors
join titleauthor
on titleauthor.au_id = authors.au_id 
join titles 
on titles.title_id = titleauthor.title_id 
join publishers 
on publishers.pub_id = titles.pub_id
group by authors.au_id,
authors.au_lname,
authors.au_fname,
publishers.pub_name 
order by "TITLE COUNT" desc, "AUTHOR ID" desc;



-- Challenge 3 - Best Selling Authors

select authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
sum(sales.qty) as TOTAL
from authors
left join titleauthor on authors.au_id = titleauthor.au_id 
left join sales on titleauthor.title_id = sales.title_id
group by  authors.au_id
order by TOTAL desc
limit 3;



-- Challenge 4 - Best Selling Authors Ranking

select authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
coalesce(sum(sales.qty),0) as "TOTAL"
from authors
left join titleauthor on authors.au_id = titleauthor.au_id 
left join sales on titleauthor.title_id = sales.title_id
group by  authors.au_id
order by "TOTAL" desc;

