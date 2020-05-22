-- Challenge1 Who Have Published What At Where?

SELECT
authors.au_id as "Author ID",
authors.au_lname as "Last Name",
authors.au_fname AS "First Name",
titles.title AS "Title",
publishers.pub_name as "Publisher"
from titles
join titleauthor
on titles.title_id  = titleauthor.title_id
join authors
on authors.au_id = titleauthor.au_id
join publishers
on publishers.pub_id  = titles.pub_id;

-- Challenge2 Who Have Published How Many At Where? -- 

select 
authors.au_id as "Author ID",
authors.au_lname as "Last Name",
authors.au_fname AS "First Name",
publishers.pub_name as "Publisher",
count(titleauthor.au_id) AS "Title Count"
from titles
join titleauthor 
on titles.title_id  = titleauthor.title_id
join authors
on authors.au_id = titleauthor.au_id
join publishers 
on publishers.pub_id  = titles.pub_id
GROUP BY authors.au_id,authors.au_fname ,authors.au_lname,publishers.pub_name
order by "Title Count" desc

//check_challenge_2
select count(au_id) from titleauthor;

-- Challenge3 Best Selling Authors -- 

select authors.au_id as "Author ID",
authors.au_lname as "Last Name",
authors.au_fname as "First Name",
sum(sales.qty) as "Total"
from authors
left join titleauthor on authors.au_id = titleauthor.au_id 
left join sales on titleauthor.title_id = sales.title_id
group by  authors.au_id
order by TOTAL desc
limit 3;

-- Challenge 4 Best Selling Authors Ranking --

select authors.au_id as "Author ID",
authors.au_lname as "Last Name",
authors.au_fname as "First Name",
coalesce(sum(sales.qty),0) as "Total"
from authors
left join titleauthor on authors.au_id = titleauthor.au_id 
left join sales on titleauthor.title_id = sales.title_id
group by  authors.au_id
order by "TOTAL" desc;

