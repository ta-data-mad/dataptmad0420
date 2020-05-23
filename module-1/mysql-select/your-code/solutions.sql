-## Challenge 1 - Who Have Published What At Where?
--In this challenge you will write a MySQL `SELECT` query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:
--* `AUTHOR ID` - the ID of the author
--* `LAST NAME` - author last name
--* `FIRST NAME` - author first name
--* `TITLE` - name of the published title
--* `PUBLISHER` - name of the publisher where the title was published

-- The inner joint could be left join, but there are authors without titles, they haven't published anything I guess
select a.au_id AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, t.title, p.pub_name as PUBLISHER
from authors a left join titleauthor ta on a.au_id = ta.au_id
inner join titles t on ta.title_id = t.title_id
left join publishers p on t.pub_id = p.pub_id
order by t.title_id

-- Testing it's OK. Result 1 must be equal to Result 2
--Result 1
select count(a.au_id)
from authors a left join titleauthor ta on a.au_id = ta.au_id
inner join titles t on ta.title_id = t.title_id
left join publishers p on t.pub_id = p.pub_id
--Result 2
SELECT count(au_id)
from titleauthor ta





If your query is correct, the total rows in your output should be the same as the total number of records in Table `titleauthor`.

## Challenge 2 - Who Have Published How Many At Where?

Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Your output should look something like below:

![Challenge 2 output](./images/challenge-2.png)

*Note: the screenshot above is not the complete output.*

To check if your output is correct, sum up the `TITLE COUNT` column. The sum number should be the same as the total number of records in Table `titleauthor`.

*Hint: In order to count the number of titles published by an author, you need to use [MySQL COUNT](https://dev.mysql.com/doc/refman/8.0/en/counting-rows.html). Also check out [MySQL Group By](https://dev.mysql.com/doc/refman/8.0/en/group-by-modifiers.html) because you will count the rows of different groups of data. Refer to the references and learn by yourself. These features will be formally discussed in the Temp Tables and Subqueries lesson.*

## Challenge 3 - Best Selling Authors

Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

* Your output should have the following columns:
	* `AUTHOR ID` - the ID of the author
	* `LAST NAME` - author last name
	* `FIRST NAME` - author first name
	* `TOTAL` - total number of titles sold from this author
* Your output should be ordered based on `TOTAL` from high to low.
* Only output the top 3 best selling authors.

## Challenge 4 - Best Selling Authors Ranking

Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display `0` instead of `NULL` as the `TOTAL`). Also order your results based on `TOTAL` from high to low.
