Challenge 1
Step1:

select titleauthor.title_id as "Title ID", titleauthor.au_id as "Author ID", titles.advance*titleauthor.royaltyper /100 as advance,
titles.price*sales.qty*titles.royalty/100*titleauthor.royaltyper /100 as sales_royalty
from titleauthor 
left join titles 
on titleauthor.title_id=titles.title_id 
left join sales 
on sales.title_id =titles.title_id;

Step2:

select "Title ID", "Author ID", advance, sum(sales_royalty) as total_royalties
from (
select titleauthor.title_id as "Title ID", titleauthor.au_id as "Author ID", titles.advance*titleauthor.royaltyper /100 as advance,
titles.price*sales.qty*titles.royalty/100*titleauthor.royaltyper /100 as sales_royalty
from titleauthor 
left join titles 
on titleauthor.title_id=titles.title_id 
left join sales 
on sales.title_id =titles.title_id
) aggregation
group by "Author ID", "Title ID";

Step3:

select "Author ID", sum(advance+total_royalties) as Total_profit
from (
select "Title ID", "Author ID", advance, sum(sales_royalty) as total_royalties
from (
select titleauthor.title_id as "Title ID", titleauthor.au_id as "Author ID", titles.advance*titleauthor.royaltyper /100 as advance,
titles.price*sales.qty*titles.royalty/100*titleauthor.royaltyper /100 as sales_royalty
from titleauthor 
left join titles 
on titleauthor.title_id=titles.title_id 
left join sales 
on sales.title_id =titles.title_id
) aggregation
group by "Author ID", "Title ID"
) aggregation2
group by "Author ID"
order by Total_profit DESC 
limit 3;


Challenge 2 -Alternative Solution

Create Temporary Table if not exists TitleID_AtuhorID_advance_salesroyalty as
select titleauthor.title_id as Title_ID, titleauthor.au_id as Author_ID, titles.advance*titleauthor.royaltyper /100 as advance,
titles.price*sales.qty*titles.royalty/100*titleauthor.royaltyper /100 as sales_royalty
from titleauthor 
left join titles 
on titleauthor.title_id=titles.title_id 
left join sales 
on sales.title_id =titles.title_id;

Create Temporary Table if not exists Title_Author_Profit as
select Title_ID, Author_ID, advance, sum(sales_royalty) as total_royalties 
from TitleID_AtuhorID_advance_salesroyalty
group by Author_ID, Title_ID;

select Author_ID, sum(advance+total_royalties) as Total_profit
from Title_Author_Profit
group by Author_ID
order by total_profit desc
limit 3;

Challenge 3

Create table if not exists most_profiting_authors(
au_id varchar(11), 
profits int);

insert into most_profiting_authors 
select Author_ID, sum(advance+total_royalties) as Total_profit
from (
select Title_ID, Author_ID, advance, sum(sales_royalty) as total_royalties
from (
select titleauthor.title_id as Title_ID, titleauthor.au_id as Author_ID, titles.advance*titleauthor.royaltyper /100 as advance,
titles.price*sales.qty*titles.royalty/100*titleauthor.royaltyper /100 as sales_royalty
from titleauthor 
left join titles 
on titleauthor.title_id=titles.title_id 
left join sales 
on sales.title_id =titles.title_id
) aggregation
group by Author_ID, Title_ID
) aggregation2
group by Author_ID
order by Total_profit DESC 
limit 3;

select au_id, profits
from most_profiting_authors;



