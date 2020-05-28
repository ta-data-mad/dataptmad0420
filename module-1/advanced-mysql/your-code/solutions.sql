--Challenge 1--
---Step1---
WITH autores as (
SELECT 
authors.au_id as "Author ID",
titleauthor.title_id as "Title ID",
(titles.advance * titleauthor.royaltyper / 100) as "Advance",
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as "Sales Royalty"
FROM authors
LEFT JOIN titleauthor on authors.au_id = titleauthor.au_id
LEFT JOIN titles on titleauthor.title_id = titles.title_id 
LEFT JOIN sales on sales.title_id = titles.title_id 
),
---Step2---
autores_royalty_advance as (
SELECT 
"Author ID",
"Title ID",
SUM("Sales Royalty") as "Aggregated royalties",
SUM("Advance") as "Aggregated Advances"
FROM autores
GROUP BY "Author ID","Title ID"
)
---Step3---
SELECT 
"Author ID",
("Aggregated royalties"+"Aggregated Advances") as "Profits"
FROM autores_royalty_advance 
GROUP BY "AUTHOR id"
ORDER BY "Profits" DESC
LIMIT 3
;

--Challenge 2--
---Step1---
CREATE TEMPORARY TABLE IF NOT EXISTS autores AS 
SELECT 
authors.au_id as "Author ID",
titleauthor.title_id as "Title ID",
(titles.advance * titleauthor.royaltyper / 100) as "Advance",
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as "Sales Royalty"
FROM authors
JOIN titleauthor on authors.au_id = titleauthor.au_id
JOIN titles on titleauthor.title_id = titles.title_id 
JOIN sales on sales.title_id = titles.title_id 
;
---step2---
CREATE TEMPORARY TABLE IF NOT EXISTS autores_royalty_advance  AS
SELECT 
"Author ID",
"Title ID",
SUM("Sales Royalty") as "Aggregated royalties",
SUM("Advance") as "Aggregated Advances"
FROM autores
GROUP BY "Author ID","Title ID"
;
---Step3---
SELECT 
"Author ID",
("Aggregated royalties"+"Aggregated Advances") as "Profits"
FROM autores_royalty_advance 
GROUP BY "AUTHOR id"
ORDER BY "Profits" DESC
LIMIT 3
;

--Challenge3--
--Table were created from Temporary's Table Data--
create table if not exists most_profiting_authors AS
SELECT 
"Author ID",
("Aggregated royalties"+"Aggregated Advances") as "Profits"
FROM autores_royalty_advance 
GROUP BY "AUTHOR id"
ORDER BY "Profits" DESC
LIMIT 3
;
