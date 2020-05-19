Solutions according to the lab

1st challenge:

SELECT 
authors.au_id as AUTHOR_ID, 
authors.au_lname as LAST_NAME, 
authors.au_fname as FIRST_NAME, 
titles.title as TITLE, 
publishers.pub_name as PUBLISHER
from titles
join titleauthor on titleauthor.title_id = titles.title_id
join authors on authors.au_id = titleauthor.au_id
join publishers on publishers.pub_id = titles.pub_id;

SELECT count(*)
from titleauthor;


