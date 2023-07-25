
/*Calculate the total revenue from each customer in March 2019. Include only customers who were active in March 2019.
Output the revenue along with the customer id and sort the results based on the revenue in descending order.(ID 9782)*/

Solution: 
SELECT 
    cust_id, 
    SUM(total_order_cost) AS revenue 
FROM orders
WHERE EXTRACT(MONTH FROM order_date) = 03 AND 
      EXTRACT(YEAR FROM order_date) = 2019
GROUP BY cust_id
ORDER BY SUM(total_order_cost) DESC;

Link:https://platform.stratascratch.com/coding/9782-customer-revenue-in-march?code_type=1



/*Find information on employees who have the first names 'Vipul' or 'Satish' or a last name that contains a 'c'.(ID 9837)*/

Solution: 
select * 
from worker 
where first_name IN ('Vipul' , 'Satish') 
or last_name ILIKE '%c%';

Link:https://platform.stratascratch.com/coding/9837-find-details-of-workers-with-the-first-name-of-either-vipul-or-satish?code_type=1


/*Find all workers who joined on February 2014.(ID 9844)*/

Solution: 
SELECT * FROM worker
WHERE EXTRACT(MONTH FROM joining_date) = 02 AND 
      EXTRACT(YEAR FROM joining_date) =	2014;

Link:https://platform.stratascratch.com/coding/9844-find-all-workers-who-joined-on-february-2014?code_type=1


/*Find all workers whose first name contains 6 letters and also ends with the letter 'h'.
Display all information about the workers in output.(ID 9842)*/

Solution: 
SELECT * FROM worker
WHERE LENGTH(first_name) = 6 
AND first_name LIKE '%h';

Link:https://platform.stratascratch.com/coding/9842-find-all-workers-whose-first-name-contains-6-letters-and-also-ends-with-the-letter-h?code_type=1



/*Find all workers whose first name ends with the letter 'a'.(ID 9841)*/

Solution: 
SELECT * 
FROM worker
WHERE first_name ILIKE '%a';

Link:https://platform.stratascratch.com/coding/9841-find-all-workers-whose-first-name-ends-with-the-letter-a?code_type=1

/*Print the first three characters of the first name.(ID 9828)*/

Solution: 
SELECT 
    SUBSTRING(first_name FROM 1 FOR 3) AS first_three_characters
from worker;

Link:https://platform.stratascratch.com/coding/9828-print-the-first-three-characters-of-the-first-name?code_type=1





