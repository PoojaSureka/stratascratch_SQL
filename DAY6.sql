/*For each guest reviewer, find the nationality of the reviewer’s favorite host based on the guest’s highest review score given to a host. 
Output the user ID of the guest along with their favorite host’s nationality. 
In case there is more than one favorite host from the same country, 
list that country only once (remove duplicates). (ID 10073)*/

Solution: 
with cte AS 
    (SELECT * FROM airbnb_reviews
    WHERE from_type = 'guest' AND to_type = 'host')

SELECT 
    DISTINCT(ct.from_user), 
    ah.nationality  
FROM cte ct 
JOIN airbnb_hosts ah 
ON ct.to_user  = ah.host_id 
where review_score = (select max(review_score) as max_score from cte);

Link:https://platform.stratascratch.com/coding/10073-favorite-host-nationality?code_type=1

/*For each hotel find the number of reviews from the most active reviewer. The most active is the one with highest number of total reviews.
Output the hotel name along with the highest total reviews of that reviewer. Output only top 5 hotels with highest total reviews.
Order records based on the highest total reviews in descending order. (ID 9880)*/

Solution: 
with cte AS
(SELECT 
    hotel_name,
    total_number_of_reviews_reviewer_has_given AS max_total_reviews,
    DENSE_RANK() OVER(ORDER BY total_number_of_reviews_reviewer_has_given DESC)
    AS highest_total_reviews 
FROM
hotel_reviews)

SELECT
    hotel_name,
    max_total_reviews
FROM cte 
WHERE highest_total_reviews <=5
ORDER BY max_total_reviews DESC;


Link:https://platform.stratascratch.com/coding/9880-find-the-top-five-hotels-with-the-highest-total-reviews-given-by-a-particular-reviewer?code_type=1 


/*Find the 10 lowest rated hotels.
Output the hotel name along with the corresponding average score.(ID 9875)*/

Solution: 
    with cte as(
    SELECT 
        hotel_name, 
        min(average_score) as average_score,
        RANK() OVER(ORDER BY min(average_score)) AS rn  
    FROM hotel_reviews
    group by hotel_name)

    select 
        hotel_name, 
        average_score 
    FROM cte 
    where rn <=10;

Link:https://platform.stratascratch.com/coding/9875-find-the-ten-hotels-with-the-lowest-ratings?code_type=1

