Select * From vine_table
limit 10; 

select count(*) as number_of_reviews
from vine_table
where total_votes > 20
Group by total_votes

-- Create a table to retrieve all the rows where the total_votes
--count is equal to or greater than 20 to pick reviewsthat are more 
-- likely to be helpful and to avoid having division by zero errors later on.

drop table tmp20Votes
CREATE Table tmp20Votes
AS (
	select  * 
from vine_table
where total_votes > 20
)

Select * 
From tmp20Votes
-- Filter the new table created and create a new or table to retrieve all the rows where the number of helpful_votes divided 
-- by total_votes is equal to or greater than 50%.

select *, CAST(helpful_votes as FLOAT)/CAST(total_votes as FLOAT) as helpful_vote_percent
into tmp50Percent
from tmp20Votes
where CAST(helpful_votes as FLOAT)/CAST(total_votes as FLOAT) >= 0.5;


Select * 
From tmp50Percent
limit 100

--Filter the table created in Step 2, and create a new table that retrieves all the rows 
--where a review was written as part of the Vine program (paid), vine == 'Y'.

Select * 
into tmpVineYtable
from tmp50Percent 
where vine = 'Y'

Select * 
From tmpVineYtable

-- Review based on Unpaid Vine program
Select * 
into tmpVineNtable
from tmp50Percent 
where vine = 'N'


Select * 
From tmpVineNtable

-- Determine the total number of reviews, the number of 5-star reviews, and the percentage of 5-star reviews 
--for the two types of review (paid vs unpaid).

Select Count (*) AS YFiveStarsReview
From tmpVineYtable 
where star_rating = 5 

-- Percentage of 5 start Review through the paid program.
Select  round(CAST(y.YFiveStarsReview as decimal)/ CAST(x.total_Vreviews as decimal),2) as five_star_percentage
From 
(Select count(*) as total_Vreviews
from tmpVineYtable) x
join 
(Select Count (*) AS YFiveStarsReview
From tmpVineYtable 
where star_rating = 5) y 
on 1=1

-- Total number of review not participating in the vine program
Select Count (*) AS FiveStarsReview
From tmpVineNtable 
where star_rating = 5

-- Percentage of 5 start Review through the non vine program.
Select  round(CAST(y.NFiveStarsReview as decimal)/ CAST(x.total_NVreviews as decimal),2) as nonVine_five_star_percentage
From 
(Select count(*) as total_NVreviews
from tmpVineNtable) x
join 
(Select Count (*) AS NFiveStarsReview
From tmpVineNtable 
where star_rating = 5) y 
on 1=1
