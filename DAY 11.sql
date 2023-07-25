/*List the IDs of customers who made at least 3 orders in both 2020 and 2021.(ID 2095)*/

Solution: 
with sales_2020 as 
(select user_id 
from amazon_orders
where extract(year from order_date) = 2020 
group by  user_id
having count(extract(year from order_date) = 2020) >=3),

sales_2021 as 
(select user_id
from amazon_orders
where extract(year from order_date) = 2021 
group by  user_id
having count(extract(year from order_date) = 2021) >=3)

select 
    s21.user_id 
from sales_2020 s20 
join sales_2021 s21 
on s20.user_id= s21.user_id;

Link:https://platform.stratascratch.com/coding/2095-three-purchases?code_type=1



/*Each Employee is assigned one territory and is responsible for the Customers from this territory. 
There may be multiple employees assigned to the same territory.
Write a query to get the Employees who are responsible for the maximum number of Customers.
 Output the Employee ID and the number of Customers.(ID 2108)*/

Solution: 
with cte AS (
SELECT 
    et.empl_id, 
    COUNT(ct.cust_id) AS n_customers,
    DENSE_RANK() OVER(ORDER BY COUNT (cust_id) DESC) AS rank 
FROM map_employee_territory et
JOIN map_customer_territory ct
ON et.territory_id= ct.territory_id
GROUP BY et.empl_id)

SELECT empl_id, n_customers FROM cte WHERE rank = 1;

Link:https://platform.stratascratch.com/coding/2108-responsible-for-most-customers?code_type=1


/*You have been asked to find the fifth highest salary without using TOP or LIMIT.
Note: Duplicate salaries should not be removed.(ID 9855)*/

Solution: 
with cte AS 
(SELECT salary,
ROW_NUMBER() OVER(ORDER BY salary DESC)  AS rank
FROM worker) 
SELECT salary FROM cte WHERE rank = 5;


Link:https://platform.stratascratch.com/coding/9855-find-the-5th-highest-salary-without-using-top-or-limit/resources?code_type=1







