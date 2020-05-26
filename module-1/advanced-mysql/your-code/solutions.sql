
STEP 1
SELECT 
titles.title_id as TITLE_ID,
authors.au_id as AUTHOR_ID,
(titles.advance * titleauthor.royaltyper) / 100 as ADVANCE,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as Sales_royalty
FROM 
sales
JOIN roysched 
ON roysched.title_id = sales.title_id
JOIN titles 
ON titles.title_id = roysched.title_id 
JOIN titleauthor
ON titleauthor.title_id = titles.title_id 
JOIN authors 
ON authors.au_id = titleauthor.au_id;

STEP 2