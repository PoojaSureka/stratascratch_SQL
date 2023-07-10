/* Find the total number of searches for each room type (apartments, private, shared) by city.(ID 9638)*/

Solution: 
SELECT
    city,
    SUM(CASE WHEN room_type ='Entire home/apt'THEN 1 ELSE 0 END) AS apt_count,
    SUM(CASE WHEN room_type ='Private room'THEN 1 ELSE 0 END) AS private_count,
    SUM(CASE WHEN room_type ='Shared room'THEN 1 ELSE 0 END ) AS shared_count
FROM airbnb_search_details
GROUP BY city;


Link:https://platform.stratascratch.com/coding/9638-total-searches-for-rooms?code_type=1

/* Rank each host based on the number of beds they have listed. The host with the most beds should be ranked 1 and the host with the least number of beds should be ranked last. Hosts that have the same number of beds should have the same rank but there should be no gaps between ranking values. A host can also own multiple properties.
Output the host ID, number of beds, and rank from highest rank to lowest.(ID 10161)*/

Solution: 
SELECT
    host_id, 
    SUM(n_beds) AS number_of_beds,
    DENSE_RANK() OVER(ORDER BY  SUM(n_beds) DESC) AS rank
FROM airbnb_apartments
GROUP BY host_id
ORDER BY rank;


Link:https://platform.stratascratch.com/coding/10161-ranking-hosts-by-beds?code_type=1

/*Rank guests based on the number of messages they've exchanged with the hosts. Guests with the same number of messages as other guests should have the same rank. Do not skip rankings if the preceding rankings are identical.
Output the rank, guest id, and number of total messages they've sent. Order by the highest number of total messages first.(ID 10159)*/

Solution: 
SELECT 
    DENSE_RANK() OVER(ORDER BY SUM(n_messages) DESC) AS ranking, 
    id_guest,
    SUM(n_messages) AS sum_n_messages 
FROM airbnb_contacts
GROUP BY id_guest
ORDER BY sum_n_messages DESC;


Link:https://platform.stratascratch.com/coding/10159-ranking-most-active-guests?code_type=1