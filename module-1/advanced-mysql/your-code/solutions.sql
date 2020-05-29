-- >>>>>> Challenge 1 - Most Profiting Authors <<<<<<<<

-- Step 1 : Calculate the royalty of each sale for each author and the advance for each author and publication

SELECT 
titles.title_id as Title_ID,
titleauthor.au_id as Author_ID,
titles.advance * titleauthor.royaltyper / 100 as Advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as Sales_royalty
FROM sales
JOIN titles 
ON sales.title_id = titles.title_id 
JOIN titleauthor 
ON titleauthor.title_id = titles.title_id ;

-- Step 2 : Aggregate the total royalties for each title and author

WITH output_step1 as
(
	SELECT 
	titles.title_id as Title_ID,
	titleauthor.au_id as Author_ID,
	titles.advance * titleauthor.royaltyper / 100 as Advance,
	titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as Sales_royalty
	FROM sales
	JOIN titles 
	ON sales.title_id = titles.title_id 
	JOIN titleauthor 
	ON titleauthor.title_id = titles.title_id
)
SELECT 
Title_ID,
Author_ID,
SUM(Advance) as Advance_Subtot,
SUM(Sales_royalty) as Sales_royalty_Subtot
FROM output_step1
GROUP BY Title_ID, Author_ID;

-- Step 3 : Calculate the total profits of each author

WITH output_step2 as
(
	WITH output_step1 as
	(
		SELECT 
		titles.title_id as Title_ID,
		titleauthor.au_id as Author_ID,
		titles.advance * titleauthor.royaltyper / 100 as Advance,
		titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as Sales_royalty
		FROM sales
		JOIN titles 
		ON sales.title_id = titles.title_id 
		JOIN titleauthor 
		ON titleauthor.title_id = titles.title_id
	)
	SELECT 
	Title_ID,
	Author_ID,
	SUM(Advance) as Advance_Subtot,
	SUM(Sales_royalty) as Sales_royalty_Subtot
	FROM output_step1
	GROUP BY Title_ID, Author_ID
)
SELECT 
Author_ID,
SUM(Advance_Subtot + Sales_royalty_Subtot) as Profit_Per_Author
FROM output_step2
GROUP BY Author_ID
ORDER BY Profit_Per_Author DESC
LIMIT 3;

-- >>>>>>  Challenge 2 - Alternative Solution <<<<<<<

-- With Derived Tables.

SELECT 
Author_ID,
SUM(Advance_Subtot + Sales_royalty_Subtot) as Profit_Per_Author
FROM
(
	SELECT 
	Title_ID,
	Author_ID,
	SUM(Advance) as Advance_Subtot,
	SUM(Sales_royalty) as Sales_royalty_Subtot
	FROM
	(
		SELECT 
		titles.title_id as Title_ID,
		titleauthor.au_id as Author_ID,
		titles.advance * titleauthor.royaltyper / 100 as Advance,
		titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as Sales_royalty
		FROM sales
		JOIN titles 
		ON sales.title_id = titles.title_id 
		JOIN titleauthor 
		ON titleauthor.title_id = titles.title_id
	) My_Derived_Table_1
	GROUP BY Title_ID, Author_ID
) My_Derived_Table_2
GROUP BY Author_ID
ORDER BY Profit_Per_Author DESC
LIMIT 3;

-- With Temporary Tables

CREATE TEMPORARY TABLE IF NOT EXISTS Temp_Table_Profit_Per_Author AS
WITH output_step2 as
(
	WITH output_step1 as
	(
		SELECT 
		titles.title_id as Title_ID,
		titleauthor.au_id as Author_ID,
		titles.advance * titleauthor.royaltyper / 100 as Advance,
		titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as Sales_royalty
		FROM sales
		JOIN titles 
		ON sales.title_id = titles.title_id 
		JOIN titleauthor 
		ON titleauthor.title_id = titles.title_id
	)
	SELECT 
	Title_ID,
	Author_ID,
	SUM(Advance) as Advance_Subtot,
	SUM(Sales_royalty) as Sales_royalty_Subtot
	FROM output_step1
	GROUP BY Title_ID, Author_ID
)
SELECT 
Author_ID,
SUM(Advance_Subtot + Sales_royalty_Subtot) as Profit_Per_Author
FROM output_step2
GROUP BY Author_ID
ORDER BY Profit_Per_Author DESC
LIMIT 3;

--                   To check that temporary tables is created and exist while we don't close SQL sesion
SELECT *
FROM Temp_Table_Profit_Per_Author;

-- >>>>>>  Challenge 3 - Create a permanent table <<<<<<<


CREATE TABLE IF NOT EXISTS most_profiting_authors 
AS
WITH output_step2 as
(
	WITH output_step1 as
	(
		SELECT 
		titles.title_id as Title_ID,
		titleauthor.au_id as Author_ID,
		titles.advance * titleauthor.royaltyper / 100 as Advance,
		titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as Sales_royalty
		FROM sales
		JOIN titles 
		ON sales.title_id = titles.title_id 
		JOIN titleauthor 
		ON titleauthor.title_id = titles.title_id
	)
	SELECT 
	Title_ID,
	Author_ID,
	SUM(Advance) as Advance_Subtot,
	SUM(Sales_royalty) as Sales_royalty_Subtot
	FROM output_step1
	GROUP BY Title_ID, Author_ID
)
SELECT 
Author_ID,
SUM(Advance_Subtot + Sales_royalty_Subtot) as Profit_Per_Author
FROM output_step2
GROUP BY Author_ID
ORDER BY Profit_Per_Author DESC
LIMIT 3;

SELECT *
FROM most_profiting_authors;

