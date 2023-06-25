/* Find the total number of searches for houses in Westlake neighborhood with a TV among the amenities. (ID 10122) */

SELECT 
    COUNT(id) AS n_searches
FROM airbnb_search_details
WHERE property_type = "House"
AND neighbourhood = "Westlake"
AND amenities LIKE "%TV%";


/* Find the number of apartments per nationality that are owned by people under 30 years old.
Output the nationality along with the number of apartments.
Sort records by the apartments count in descending order.  (ID 10156) */

SELECT 
    ah.nationality, 
    COUNT(DISTINCT au.unit_id) AS apartment_count
FROM airbnb_hosts ah 
JOIN airbnb_units au
ON ah.host_id = au.host_id
where au.unit_type = "Apartment" 
AND ah.age < 30
group by ah.nationality
order by apartment_count desc;

/* Find the average accommodates-to-beds ratio for shared rooms in each city. 
Sort your results by listing cities with the highest ratios first. (ID 9624) */

SELECT 
    city, 
    AVG(accommodates/beds) AS avg_crowdness_ratio 
FROM airbnb_search_details
WHERE room_type = "Shared room"
GROUP BY city
ORDER BY avg_crowdness_ratio DESC;


