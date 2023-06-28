

/* Find the countries with the most negative reviews.
 Output the country along with the number of negative reviews and sort records based on the number of negative reviews in descending order. 
 Review is not negative if value negative value column equals to "No Negative". You can ignore countries with no negative reviews.(ID 9878)*/

Solution: 
SELECT 
    reviewer_nationality,
    COUNT(negative_review) AS n_negative_reviews 
FROM hotel_reviews
WHERE negative_review != "No Negative"
GROUP BY reviewer_nationality
ORDER BY n_negative_reviews DESC;


Link:https://platform.stratascratch.com/coding/9878-countries-with-most-negative-reviews?code_type=3



/* Find the top two hotels with the most negative reviews.
Output the hotel name along with the corresponding number of negative reviews.
Sort records based on the number of negative reviews in descending order. (ID 9876)*/

Solution: 
SELECT 
    hotel_name, 
    COUNT(negative_review) AS n_negative_reviews
FROM hotel_reviews
WHERE negative_review != "No Negative"
GROUP BY  hotel_name
ORDER BY  n_negative_reviews DESC
LIMIT 2 


Link:https://platform.stratascratch.com/coding/9876-find-the-top-ten-hotels-with-the-most-negative-reviews-in-summer-june-aug?code_type=3



/* Find the countries whose reviewers give most positive reviews. Positive reviews are all reviews where review text is different than "No Positive"
Output all countries along with the number of positive reviews but sort records based on the number of positive reviews in descending order.
Leave out the countries with no positive reviews.  (ID 9879)*/

Solution: 
SELECT 
    reviewer_nationality, 
    COUNT(positive_review) AS n_positive_reviews
FROM hotel_reviews
WHERE positive_review !=  "No Positive"
GROUP BY reviewer_nationality
ORDER BY n_positive_reviews desc


Link:https://platform.stratascratch.com/coding/9879-find-the-countries-with-the-most-positive-reviews?code_type=3




