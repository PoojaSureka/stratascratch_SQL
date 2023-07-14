/*Find the top ten hotels with the highest ratings.

Output the hotel name along with the corresponding average score.
Sort records based on the average score in descending order. (ID 9874)*/

Solution: 
with cte AS 
(SELECT 
    hotel_name,
    average_score, 
    RANK() OVER(ORDER BY average_score DESC)
AS highest_rating
FROM hotel_reviews
GROUP BY hotel_name, average_score)

SELECT
    hotel_name, 
    average_score 
FROM cte  
WHERE highest_rating<=10 ;

Link:https://platform.stratascratch.com/coding/9874-find-the-top-ten-hotels-with-the-highest-ratings?code_type=1

/*Find the number of nights that are searched by most people when trying to book a host.
Output the number of nights alongside the total searches.
Order records based on the total searches in descending order. (ID 9761)*/

Solution: 
SELECT 
    n_nights, 
    SUM(n_searches) AS total_searches
FROM airbnb_searches
GROUP BY n_nights
ORDER BY SUM(n_searches) DESC;

Link:https:https://platform.stratascratch.com/coding/9761-find-the-number-of-nights-that-are-searching-for-when-trying-to-book-a-host?code_type=1

/*Find a neighborhood where you can sleep on a real bed in a villa with internet while paying the lowest price possible. (ID 9636)*/

Solution: 
SELECT 
    neighbourhood
FROM airbnb_search_details
WHERE bed_type = 'Real Bed' 
      AND property_type = 'Villa'
      AND amenities LIKE '%Internet%'
ORDER BY price
LIMIT 1;

Link:https://platform.stratascratch.com/coding/9636-cheapest-neighborhoods-with-real-beds-and-internet?code_type=1