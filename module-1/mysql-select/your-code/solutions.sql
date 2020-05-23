/*Challenge 1 - Who Have Published What At Where?
In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author 
has published at which publishers. Your output should have at least the following columns:

    AUTHOR ID - the ID of the author
    LAST NAME - author last name
    FIRST NAME - author first name
    TITLE - name of the published title
    PUBLISHER - name of the publisher where the title was published
*/

SELECT 
authors.au_id as 'AUTHOR ID', 
authors.au_lname as 'LAST NAME', 
authors.au_fname as 'FIRST NAME',
titles.title as 'TITLE', 
publishers.pub_name as 'PUBLISHER'
from titles
join titleauthor 
on titleauthor.title_id = titles.title_id
join authors 
on authors.au_id = titleauthor.au_id 
join publishers
on publishers.pub_id = titles.pub_id; 

/*
Challenge 2 - Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles each author 
has published at each publisher. Your output should look something like below:

Challenge 2 output
*/

SELECT 
authors.au_id as 'AUTHOR ID', 
authors.au_lname as 'LAST NAME', 
authors.au_fname as 'FIRST NAME',
publishers.pub_name as 'PUBLISHER',
count(titleauthor.title_id) as 'TITLE COUNT'
from titles
join titleauthor 
on titleauthor.title_id = titles.title_id
join authors 
on authors.au_id = titleauthor.au_id 
join publishers
on publishers.pub_id = titles.pub_id
group by authors.au_id
ORDER BY authors.au_id DESC; 

SELECT count(titleauthor.title_id) as 'TITLE COUNT'
from titleauthor 
-- Output = 25

SELECT count(title_id) as 'TITLE COUNT'
from titleauthor 
-- Output = 25 



/*
Challenge 3 - Best Selling Authors
Who are the top 3 authors who have sold the highest number of titles? 
Write a query to find out.

Requirements:
    Your output should have the following columns:
        AUTHOR ID - the ID of the author
        LAST NAME - author last name
        FIRST NAME - author first name
        TOTAL - total number of titles sold from this author
    Your output should be ordered based on TOTAL from high to low.
    Only output the top 3 best selling authors.

Challenge 3 output
*/


SELECT 
authors.au_id as 'AUTHOR ID', 
authors.au_lname as 'LAST NAME', 
authors.au_fname as 'FIRST NAME',
sum(sales.qty) as 'TOTAL'
from titles
INNER join titleauthor
on titleauthor.title_id = titles.title_id
INNER join authors
on authors.au_id = titleauthor.au_id 
INNER join sales 
on sales.title_id = titles.title_id
group by authors.au_id 
ORDER by sum(sales.qty) DESC 
LIMIT 3; 



/*
Challenge 4 - Best Selling Authors
Now modify your solution in Challenge 3 so that the output will display 
all 23 authors instead of the top 3. Note that the authors who have sold 
0 titles should also appear in your output 
(ideally display 0 instead of NULL as the TOTAL). 
Also order your results based on TOTAL from high to low.
Challenge 4 output
*/

SELECT 
authors.au_id as 'AUTHOR ID', 
authors.au_lname as 'LAST NAME', 
authors.au_fname as 'FIRST NAME',
COALESCE(sum(sales.qty),case when sales.qty ISNULL THEN 0 END) as 'TOTAL'
from authors
LEFT join titleauthor
on authors.au_id = titleauthor.au_id
LEFT join sales
on sales.title_id = titleauthor.title_id
group by authors.au_id 
ORDER by sum(sales.qty) DESC
limit 23; 

