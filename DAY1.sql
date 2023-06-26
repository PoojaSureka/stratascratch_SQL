

/* Find whether hosts or guests give higher review scores based on their average review scores. 
Output the higher of the average review score rounded to the 2nd decimal spot (e.g., 5.11). (ID 10072) */

Solution: 
SELECT 
    from_type, 
    ROUND(AVG(review_score),2) AS winner
FROM airbnb_reviews
GROUP BY from_type
ORDER BY winner DESC
LIMIT 1;

Link: https://platform.stratascratch.com/coding/10072-guest-or-host-kindness?code_type=3

/* Write a query to find which gender gives a higher average review score when writing reviews as guests. 
Use the from_type column to identify guest reviews. 
Output the gender and their average review score.(ID 10149) */

Solution: 
SELECT
    ag.gender, 
    AVG(ar.review_score) AS avg_score
FROM airbnb_reviews ar JOIN airbnb_guests ag
ON ar.from_user = ag.guest_id
WHERE ar.from_type = "guest"
GROUP BY ag.gender
ORDER BY avg_score DESC
LIMIT 1;
Link: https://platform.stratascratch.com/coding/10149-gender-with-generous-reviews?code_type=3

/* Find the number of people that made a search on Airbnb.(ID 9760)*/

Solution: 
SELECT 
    COUNT(DISTINCT id_user) AS total_people_searching
FROM airbnb_searches;

Link: https://platform.stratascratch.com/coding/9760-find-the-number-of-searches-on-airbnb?code_type=3
