Challenge 1

--my very first sql query!
select authors.au_id as author_id,authors.au_lname as last_name, authors.au_fname as first_name, titles.title as title, publishers.pub_name as publisher from authors
join titleauthor 
on titleauthor.au_id=authors.au_id
join titles
on titles.title_id=titleauthor.title_id 
join publishers 
on publishers.pub_id=titles.pub_id
order by authors.au_id 

--and this is my check
select * from titleauthor


Challenge 2

--my second sql query ever!
select authors.au_id as author_id,authors.au_lname as last_name, authors.au_fname as first_name, publishers.pub_name as publisher, count (titles.title) as title_count from authors
join titleauthor 
on titleauthor.au_id=authors.au_id
join titles
on titles.title_id=titleauthor.title_id 
join publishers 
on publishers.pub_id=titles.pub_id
group by authors.au_id
order by authors.au_id ;

-- my check (don' tell anybody that I have used Excel to copy and count the column)
select * from titleauthor 


Callenge 3

--my third SQL query! 
select authors.au_id as author_id,authors.au_lname as last_name, authors.au_fname as first_name, sum (sales.qty) as total_sales from authors
join titleauthor 
on titleauthor.au_id=authors.au_id
join titles
on titles.title_id=titleauthor.title_id 
join sales 
on sales.title_id = titles.title_id
group by authors.au_id
order by total_sales DESC
limit 3;

--no checking this time, I am on fire!


Challenge 4

--my fourth SQL query! This is a non-stop way!
select authors.au_id as author_id,authors.au_lname as last_name, authors.au_fname as first_name, ifnull(sum (sales.qty),0) as total_sales from authors
left join titleauthor 
on authors.au_id = titleauthor.au_id 
left join titles
on titles.title_id=titleauthor.title_id 
left join sales 
on titles.title_id = sales.title_id
group by authors.au_id
order by total_sales DESC;

--I have googled the ifnull thing. I am a rock!
