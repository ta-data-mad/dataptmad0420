/*Challenge 1-resultado*/

SELECT authors.au_id  as AUTHOR_ID, authors.au_lname  as LAST_NAME , authors.au_fname   as FIRST_NAME, titles.title as TITLE , publishers.pub_name as PUBLISHER
FROM authors 
JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
JOIN titles 
ON titles .title_id = titleauthor.title_id 
JOIN publishers 
ON titles .pub_id = publishers.pub_id ;

/*Challenge 2-resultado*/

SELECT authors.au_id as AUTHOR_ID, authors.au_lname  as LAST_NAME , authors.au_fname as FIRST_NAME, publishers.pub_name as PUBLISHER , COUNT(titles.title) as TITLE_COUNT
FROM authors 
JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
JOIN titles 
ON titles .title_id = titleauthor.title_id 
JOIN publishers 
ON titles .pub_id = publishers.pub_id 
GROUP BY authors.au_id 
ORDER BY authors.au_id desc;


/*Challenge 3-resultado*/

SELECT authors.au_id as AUTHOR_ID, authors.au_lname  as LAST_NAME , authors.au_fname as FIRST_NAME ,sales.qty as TOTAL
FROM authors 
LEFT JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles 
ON titles .title_id = titleauthor.title_id 
LEFT JOIN publishers 
ON titles .pub_id = publishers.pub_id 
LEFT JOIN sales 
ON titles.title_id =  sales.title_id 
GROUP BY authors.au_id 
ORDER BY TOTAL desc
LIMIT 3
;

/*Challenge 4-resultado*/
SELECT authors.au_id as AUTHOR_ID, authors.au_lname  as LAST_NAME , authors.au_fname as FIRST_NAME , IFNULL(sales.qty,0)  as TOTAL
FROM authors 
LEFT JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles 
ON titles .title_id = titleauthor.title_id 
LEFT JOIN publishers 
ON titles .pub_id = publishers.pub_id 
LEFT JOIN sales 
ON titles.title_id =  sales.title_id 
GROUP BY authors.au_id 
ORDER BY TOTAL DESC ;





;


