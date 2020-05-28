CHALLENGE 1

STEP 1
CALCULATE THE ROYALTY OF EACH SALE FOR EACH AUTHOR AND THE ADVANCE FOR EACH AUTHOR AND PUBLICATION 
--Calculate the royalty of each sale for each author and the advance for each author and publication
Write a SELECT query to obtain the following output:

1. Title ID
2. Author ID
3. Advance of each title and author
4. Royalty of each sale


SOLUTION QUERY
select 
titles.title_id  as TITLE_ID,
authors.au_id AUTHOR_ID,
(titles.advance * titleauthor.royaltyper) / 100 as ADVANCE,
--titleauthor.au_id,
--authors.au_fname,
--authors.au_lname,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as SALES_ROYALTIES
FROM 
sales 
join roysched 
on sales.title_id = roysched.title_id 
join titles 
on roysched.title_id = titles.title_id
join titleauthor 
on titleauthor.title_id = titles.title_id
join authors 
on authors.au_id = titleauthor.au_id
;
