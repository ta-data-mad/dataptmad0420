--Challenge 1:
SELECT 
authors.au_id as Author_ID,
authors.au_lname as Last_Name,
authors.au_fname as First_Name,
titles.title as Title_Count,
publishers.pub_name as Publisher
from titles
join titleauthor 
on titles.title_id = titleauthor.title_id
join authors 
on titleauthor.au_id = authors.au_id 
join publishers 
on publishers.pub_id=titles.pub_id;
 
--Challenge 2:
SELECT 
authors.au_id as Author_ID,
authors.au_lname as Last_Name,
authors.au_fname as First_Name,
publishers.pub_name as Publisher,
count (titles.title_id ) as Tittle_count -- we count the titles with the conditions "group by"
from titles
join titleauthor 
on titles.title_id = titleauthor.title_id
join authors 
on titleauthor.au_id = authors.au_id 
join publishers 
on publishers.pub_id=titles.pub_id
GROUP BY authors.au_id, publishers.pub_id  -- we put 2 conditions for agroup the list
ORDER BY authors.au_id DESC;


--challenge 3
select 
authors.au_id as Author_ID,
authors.au_lname as Last_Name,
authors.au_fname as First_Name,
sum(sales.qty)  as Total  --use sum for sum all the sales of each author
from titles
join titleauthor 
on titles.title_id = titleauthor.title_id
join authors 
on titleauthor.au_id = authors.au_id 
join sales 
on sales.title_id =titles.title_id 
group by authors.au_id 
ORDER by Total desc 
limit 3;

--Challenge 4 
select 
authors.au_id as Author_ID,
authors.au_lname as Last_Name,
authors.au_fname as First_Name,
COALESCE(sum(sales.qty),0) as Total  -- use coalesce for change NULL = 0 in the column Total
from authors 
left join titleauthor                -- use left join for to has the authors with null sales
on authors.au_id = titleauthor.au_id
left join titles 
on titleauthor.title_id = titles.title_id 
left join sales 
on sales.title_id =titles.title_id 
group by authors.au_id 
ORDER by Total desc;

