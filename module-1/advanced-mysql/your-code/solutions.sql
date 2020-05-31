--Challenge 1

WITH Query1 as(
  SELECT titles.title_id as "Title_id" , 
  titleauthor.au_id as "Author_id",
  titles.advance * titleauthor.royaltyper / 100 as "Advance of each title and author",
  titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as "Royalty of each sale"
  FROM titles 
  JOIN titleauthor on 
  titleauthor.title_id = titles.title_id 
  JOIN sales  on 
  sales.title_id = titles.title_id ),
--Test to check if it's working => Select * from Query1;
   Query2 as(
    SELECT Title_id, Author_id , SUM ("Royalty of each sale") as "Aggregated_Royalties"
    from Query1 
    GROUP BY Title_id , Author_id)
SELECT Author_id ,  "Aggregated_Royalties" + "Advance of each title and author"  as Profits
FROM Query2
ORDER BY Profits DESC 
LIMIT 3;

-- Challenge 2
  
--Step 1 : first query
 CREATE TEMPORARY TABLE IF NOT EXISTS Query1 AS
 SELECT 
  titles.title_id as "Title_id" , 
  titleauthor.au_id as "Author_id",
  titles.advance * titleauthor.royaltyper / 100 as "Advance of each title and author",
  titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as "Royalty of each sale"
  FROM titles 
  JOIN titleauthor on 
  titleauthor.title_id = titles.title_id 
  JOIN sales  on 
  sales.title_id = titles.title_id ;
 
--Step 2 : second query
 
 CREATE TEMPORARY TABLE IF NOT EXISTS Query2 AS
 
    SELECT Title_id, Author_id , SUM ("Royalty of each sale") as "Aggregated_Royalties"
    from Query1 
    GROUP BY Title_id , Author_id;
   
--Step 3: executing the query
 
SELECT Author_id ,  "Aggregated_Royalties" + "Advance of each title and author"  as Profits
FROM Query2
ORDER BY Profits DESC 
LIMIT 3;


--Challenge 3

CREATE TABLE IF NOT EXISTS most_profiting_authors as
  WITH Query1 as(
  SELECT titles.title_id as "Title_id" , 
  titleauthor.au_id as "Author_id",
  titles.advance * titleauthor.royaltyper / 100 as "Advance of each title and author",
  titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as "Royalty of each sale"
  FROM titles 
  JOIN titleauthor on 
  titleauthor.title_id = titles.title_id 
  JOIN sales  on 
  sales.title_id = titles.title_id ),
--Test to check if it's working => Select * from Query1;
   Query2 as(
    SELECT Title_id, Author_id , SUM ("Royalty of each sale") as "Aggregated_Royalties"
    from Query1 
    GROUP BY Title_id , Author_id)
SELECT Author_id ,  "Aggregated_Royalties" + "Advance of each title and author"  as Profits
FROM Query2
ORDER BY Profits DESC 
LIMIT 3 ;

 
 
 
 









