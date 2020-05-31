-- CHALLENGE 1:

--TOP 3 most profiting authors 

--1. Calculate the royalty of each sale for each author and the advance for each author and publication.
--2. Using the output from Step 1 as a subquery, aggregate the total royalties for each title and author.
--3. Using the output from Step 2 as a subquery, calculate the total profits of each author by aggregating the advances and total royalties of each title.


-- ### Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication

SELECT s.title_id, ta.au_id as author_id, (t.advance * ta.royaltyper / 100) as advance, t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalty, (au_lname || ' ' || au_fname) as author_name
FROM sales s left join titles t on s.title_id = t.title_id
left join titleauthor ta on t.title_id = ta.title_id
left join authors a on ta.au_id = a.au_id;

-- ### Step 2: Aggregate the total royalties for each title and author

WITH aggregate_royalty
AS
(
	SELECT s.title_id, ta.au_id as author_id, (t.advance * ta.royaltyper / 100) as advance, t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalty, (au_lname || ' ' || au_fname) as author_name
	FROM sales s left join titles t on s.title_id = t.title_id
	LEFT join titleauthor ta on t.title_id = ta.title_id
	LEFT join authors a on ta.au_id = a.au_id
)
SELECT title_id, author_id, ROUND(sum(sales_royalty),0) as aggregate_royalties
FROM aggregate_royalty
GROUP BY title_id, author_id;

-- ### Step 3: Calculate the total profits of each author

WITH aggregate_royalty
AS
(
	SELECT s.title_id, ta.au_id as author_id, (t.advance * ta.royaltyper / 100) as advance, t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalty, (au_lname || ' ' || au_fname) as author_name
	FROM sales s left join titles t on s.title_id = t.title_id
	LEFT join titleauthor ta on t.title_id = ta.title_id
	LEFT join authors a on ta.au_id = a.au_id
)
,
calc_royalty 
AS 
(
SELECT title_id, author_id, author_name, ROUND(sum(sales_royalty),0) as aggregate_royalties, ROUND(sum(advance),0) as aggregate_advance
FROM aggregate_royalty
GROUP BY title_id, author_id
)
SELECT author_id, author_name, ROUND((aggregate_royalties + aggregate_advance),0) as profits
FROM calc_royalty
ORDER BY profits DESC
limit 3;

-- The most profiting authors are Michael Defrance, Marjorie Green and Anne Ringer with more than 40K US in total of royalties and advances.

-- CHALLENGE 2 - Creatiing temporary tables by subquery:

DROP TABLE IF EXISTS aggregate_royalty;

CREATE TEMPORARY TABLE IF NOT EXISTS aggregate_royalty AS 
SELECT s.title_id, ta.au_id as author_id, (t.advance * ta.royaltyper / 100) as advance, t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalty, (au_lname || ' ' || au_fname) as author_name
FROM sales s left join titles t on s.title_id = t.title_id
LEFT join titleauthor ta on t.title_id = ta.title_id
LEFT join authors a on ta.au_id = a.au_id;

DROP TABLE IF EXISTS calc_royalty;

CREATE TEMPORARY TABLE IF NOT EXISTS  calc_royalty  AS 
SELECT title_id, author_id, author_name, ROUND(sum(sales_royalty),0) as aggregate_royalties, ROUND(sum(advance),0) as aggregate_advance
FROM aggregate_royalty
GROUP BY title_id, author_id

SELECT author_id, author_name, ROUND((aggregate_royalties + aggregate_advance),0) as profits
FROM calc_royalty
ORDER BY profits DESC
limit 3;


--CHALLENGE 3 Create a permanent table named "most_profiting_authors"

DROP TABLE IF EXISTS most_profiting_authors; 

CREATE TABLE most_profiting_authors AS

WITH aggregate_royalty
AS
(
	SELECT s.title_id, ta.au_id as author_id, (t.advance * ta.royaltyper / 100) as advance, t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalty, (au_lname || ' ' || au_fname) as author_name
	FROM sales s left join titles t on s.title_id = t.title_id
	LEFT join titleauthor ta on t.title_id = ta.title_id
	LEFT join authors a on ta.au_id = a.au_id
)
,
calc_royalty 
AS 
(
SELECT title_id, author_id, author_name, ROUND(sum(sales_royalty),0) as aggregate_royalties, ROUND(sum(advance),0) as aggregate_advance
FROM aggregate_royalty
GROUP BY title_id, author_id
)
SELECT author_id, author_name, ROUND((aggregate_royalties + aggregate_advance),0) as profits
FROM calc_royalty
ORDER BY profits DESC
limit 3
;

SELECT *
from most_profiting_authors






/* EXAMPLES WITH

WITH Sales_CTE (SalesPersonID, NumberOfOrders)  
AS  
(  
    SELECT SalesPersonID, COUNT(*)  
    FROM Sales.SalesOrderHeader  
    WHERE SalesPersonID IS NOT NULL  
    GROUP BY SalesPersonID  
)  
SELECT AVG(NumberOfOrders) AS "Average Sales Per Person"  
FROM Sales_CTE;  

__________________________


WITH DirectReports(ManagerID, EmployeeID, Title, EmployeeLevel) AS   
(  
    SELECT ManagerID, EmployeeID, Title, 0 AS EmployeeLevel  
    FROM dbo.MyEmployees   
    WHERE ManagerID IS NULL  
    UNION ALL  
    SELECT e.ManagerID, e.EmployeeID, e.Title, EmployeeLevel + 1  
    FROM dbo.MyEmployees AS e  
        INNER JOIN DirectReports AS d  
        ON e.ManagerID = d.EmployeeID   
)  
SELECT ManagerID, EmployeeID, Title, EmployeeLevel   
FROM DirectReports  
ORDER BY ManagerID;   

________________________________________

WITH Sales_CTE (SalesPersonID, TotalSales, SalesYear)  
AS  
-- Define the first CTE query.  
(  
    SELECT SalesPersonID, SUM(TotalDue) AS TotalSales, YEAR(OrderDate) AS SalesYear  
    FROM Sales.SalesOrderHeader  
    WHERE SalesPersonID IS NOT NULL  
       GROUP BY SalesPersonID, YEAR(OrderDate)  
  
)  
,   -- Use a comma to separate multiple CTE definitions.  
  
-- Define the second CTE query, which returns sales quota data by year for each sales person.  
Sales_Quota_CTE (BusinessEntityID, SalesQuota, SalesQuotaYear)  
AS  
(  
       SELECT BusinessEntityID, SUM(SalesQuota)AS SalesQuota, YEAR(QuotaDate) AS SalesQuotaYear  
       FROM Sales.SalesPersonQuotaHistory  
       GROUP BY BusinessEntityID, YEAR(QuotaDate)  
)  
  
-- Define the outer query by referencing columns from both CTEs.  
SELECT SalesPersonID  
  , SalesYear  
  , FORMAT(TotalSales,'C','en-us') AS TotalSales  
  , SalesQuotaYear  
  , FORMAT (SalesQuota,'C','en-us') AS SalesQuota  
  , FORMAT (TotalSales -SalesQuota, 'C','en-us') AS Amt_Above_or_Below_Quota  
FROM Sales_CTE  
JOIN Sales_Quota_CTE ON Sales_Quota_CTE.BusinessEntityID = Sales_CTE.SalesPersonID  
                    AND Sales_CTE.SalesYear = Sales_Quota_CTE.SalesQuotaYear  
ORDER BY SalesPersonID, SalesYear;    

