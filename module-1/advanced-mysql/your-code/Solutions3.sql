-- CHALLENGE 1

	-- Step 1

select title, titleauthor.au_id, 
titles.advance * titleauthor.royaltyper / 100 as "Advance", 
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as "Royalty"
from titles join titleauthor
on titles.title_id = titleauthor.title_id
join sales on titles.title_id = sales.title_id

	-- Step 2

with Agregate_rotalties as 
(
select title, titleauthor.au_id, 
titles.advance * titleauthor.royaltyper / 100 as "Advance", 
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as "Royalty"
from titles join titleauthor
on titles.title_id = titleauthor.title_id
join sales on titles.title_id = sales.title_id
)
select title, au_id, 
sum("Royalty")
from Agregate_rotalties
group by title;

	-- Step 3

with Agregated_Royalties as 
(
	with Title_plus_author as 
	(
		select title as "Title ID", titleauthor.au_id as "Author ID", 
		titles.advance * titleauthor.royaltyper / 100 as Advance, 
		titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as Royalty
		from titles 
		join titleauthor on titles.title_id = titleauthor.title_id
		join sales on titles.title_id = sales.title_id
	)
	SELECT "Title ID", "Author ID", 
	sum (Advance) as Advance,
	sum(Royalty) as Royalty
	from Title_plus_author
	group by "Title ID", "Author ID"
)
SELECT "Author ID", 
SUM(Advance + Royalty) as Total_profit
FROM Agregated_Royalties
GROUP BY "Author ID"
ORDER BY "Total_profit" DESC
LIMIT 3
;


	-- step 3 option 2

with Title_plus_author as 
(
	select title as "Title ID", titleauthor.au_id as "Author ID", 
	titles.advance * titleauthor.royaltyper / 100 as Advance, 
	titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as Royalty
	from titles 
	join titleauthor on titles.title_id = titleauthor.title_id
	join sales on titles.title_id = sales.title_id
),
Agregated_royalties as 
(
	SELECT "Title ID", "Author ID", 
	sum (Advance) as Advance,
	sum(Royalty) as Royalty
	from Title_plus_author
	group by "Title ID", "Author ID"
)
SELECT "Author ID", 
SUM(Advance + Royalty) as Total_profit
FROM Agregated_Royalties
GROUP BY "Author ID"
ORDER BY "Total_profit" DESC
LIMIT 3
;


-- CHALLENGE 2


CREATE TEMPORARY TABLE Title_plus_author as 
	select title as "Title ID", titleauthor.au_id as "Author ID", 
	titles.advance * titleauthor.royaltyper / 100 as Advance, 
	titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as Royalty
	from titles 
	join titleauthor on titles.title_id = titleauthor.title_id
	join sales on titles.title_id = sales.title_id;

CREATE TEMPORARY TABLE Agregated_royalties as 
	SELECT "Title ID", "Author ID", 
	sum (Advance) as Advance,
	sum(Royalty) as Royalty
	from Title_plus_author
	group by "Title ID", "Author ID";

SELECT "Author ID", 
SUM(Advance + Royalty) as Total_profit
FROM Agregated_Royalties
GROUP BY "Author ID"
ORDER BY "Total_profit" DESC
LIMIT 3
;

-- CHALLENGE 3

CREATE TABLE most_profiting_authors AS
	SELECT "Author ID", 
	SUM(Advance + Royalty) as Total_profit
	FROM Agregated_Royalties
	GROUP BY "Author ID"
	ORDER BY "Total_profit" DESC
	LIMIT 3;
	
	Final