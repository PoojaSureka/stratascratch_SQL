/* Find the total number of available beds per hosts' nationality.
Output the nationality along with the corresponding total number of available beds.
Sort records by the total available beds in descending order. (ID 10187) */

SELECT 
    ah.nationality AS nationality,
    SUM(ap.n_beds) AS total_beds_available
FROM airbnb_apartments ap 
JOIN airbnb_hosts ah 
ON ap.host_id = ah.host_id
GROUP BY nationality
ORDER BY total_beds_available DESC;

LINK: https://platform.stratascratch.com/coding/10187-find-the-total-number-of-available-beds-per-hosts-nationality/solutions?code_type=3


/* Find the average age of guests reviewed by each host.
Output the user along with the average age.  (ID 10074)*/

SELECT 
    ar.from_user,  
    AVG(ag.age)
FROM airbnb_reviews ar 
JOIN airbnb_guests ag 
ON ar.to_user = ag.guest_id
WHERE ar.from_type = "host"
GROUP BY ar.from_user;

Link: https://platform.stratascratch.com/coding/10074-find-the-average-age-of-guests-reviewed-by-each-host?code_type=3

/* Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.
Output the host id and the guest id of matched pair. (ID 10078)*/

SELECT 
     DISTINCT(ah.host_id), 
     ag.guest_id
FROM airbnb_hosts ah 
JOIN airbnb_guests ag
ON ah.nationality = ag.nationality
AND ah.gender = ag.gender;

Link: https://platform.stratascratch.com/coding/10078-find-matching-hosts-and-guests-in-a-way-that-they-are-both-of-the-same-gender-and-nationality?code_type=3

/* Find the number of hosts that have accommodations in countries of which they are not citizens. (ID 10071) */

SELECT 
    COUNT(DISTINCT ah.host_id) AS total_count_host 
FROM airbnb_hosts ah 
JOIN airbnb_apartments ap 
ON ah.host_id = ap.host_id
WHERE ah.nationality != ap.country;

Link: https://platform.stratascratch.com/coding/10071-hosts-abroad-apartments?code_type=3