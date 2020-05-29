--#Challenge 1

/*SELECT 
	titles.title_id, 
	authors.au_id as Author_ID,
	titles.advance * titleauthor.royaltyper / 100 as advance_ta,
	titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
FROM 
	authors
JOIN 
	titleauthor 
	ON authors.au_id = titleauthor.au_id 
JOIN titles 
	ON titles.title_id = titleauthor.title_id 
JOIN sales 
	ON titles.title_id = sales.title_id;*/


SELECT 
	TitleID,
	AuthorID,
	SUM(sales_royalty) as Aggregated	
FROM 
(	
SELECT 
	titles.title_id as TitleID, 
	authors.au_id as AuthorID,
	titles.advance * titleauthor.royaltyper / 100 as advance_ta,
	titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
FROM 
	authors
INNER JOIN 
	titleauthor 
	ON authors.au_id = titleauthor.au_id 
INNER JOIN titles 
	ON titles.title_id = titleauthor.title_id 
INNER JOIN sales 
	ON titles.title_id = sales.title_id
)
GROUP BY TitleID, AuthorID
ORDER BY AuthorID, TitleID;*/

SELECT 
	AuthorID,
	(Aggregated + advance_ta) as profits
FROM 
(
SELECT 
	TitleID,
	AuthorID,
	SUM(sales_royalty) as Aggregated,
	advance_ta 
FROM 
(	
SELECT 
	titles.title_id as TitleID, 
	authors.au_id as AuthorID,
	titles.advance * titleauthor.royaltyper / 100 as advance_ta,
	titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
FROM 
	authors
INNER JOIN 
	titleauthor 
	ON authors.au_id = titleauthor.au_id 
INNER JOIN titles 
	ON titles.title_id = titleauthor.title_id 
INNER JOIN sales 
	ON titles.title_id = sales.title_id
)
GROUP BY TitleID, AuthorID
)
ORDER BY profits DESC 
LIMIT 3;

-----------

--#Challenge 2

CREATE TEMPORARY TABLE income_summary AS
SELECT 
	titles.title_id as titleID, 
	authors.au_id as authorID,
	titles.advance * titleauthor.royaltyper / 100 as advance_ta,
	titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
FROM 
	authors
INNER JOIN 
	titleauthor 
	ON authors.au_id = titleauthor.au_id 
INNER JOIN titles 
	ON titles.title_id = titleauthor.title_id 
INNER JOIN sales 
	ON titles.title_id = sales.title_id;


CREATE TEMPORARY TABLE aggretated_income AS
SELECT
	TitleID,
	AuthorID,
	SUM(sales_royalty) as Aggregated,
	advance_ta 
FROM 
	income_summary
GROUP BY 
	TitleID, AuthorID;

SELECT *
FROM aggretated_income



SELECT 
	AuthorID,
	(Aggregated + advance_ta) as profits
FROM 
	aggretated_income
GROUP BY AuthorID
ORDER BY profits DESC 
LIMIT 3;

SELECT * FROM profits_summary;


---------------------

--#Challenge 3

CREATE TABLE most_profiting_authors (
	au_id VARCHAR (30) PRIMARY KEY NOT NULL,
	profits FLOAT NOT NULL,
	FOREIGN KEY(au_id) REFERENCES authors (au_id)
)

INSERT into most_profiting_authors 
SELECT 
	AuthorID,
	(Aggregated + advance_ta) as profits
FROM 
	aggretated_income
GROUP BY
	AuthorID;

SELECT * FROM most_profiting_authors; 
