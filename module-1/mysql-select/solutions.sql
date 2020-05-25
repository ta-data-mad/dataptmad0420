--Chalenge 4
SELECT
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
COALESCE((sales.qty),case when sales.qty ISNULL THEN 0 END) as "TOTAL"
FROM authors
LEFT JOIN titleauthor on authors.au_id = titleauthor.au_id 
LEFT JOIN titles on titleauthor.title_id = titles.title_id
LEFT JOIN sales on titles.title_id = sales.title_id
GROUP BY authors.au_id 
ORDER BY sales.qty DESC 
LIMIT 23