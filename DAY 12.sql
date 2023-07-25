/*Find customers who appear in the orders table more than three times.(ID 9893)*/

Solution: 
SELECT 
    cust_id 
FROM orders 
GROUP BY cust_id
HAVING COUNT(cust_id) >3;

Link:https://platform.stratascratch.com/coding/9893-duplicate-orders?code_type=1

/*You have been asked to find the employee with the highest salary in each department.
Output the department name, full name of the employee(s), and corresponding salary.(ID 9865)*/

Solution: 
with cte AS (
SELECT department,
    CONCAT(first_name, ' ', last_name) AS employee_name, 
    salary,
DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC)AS rank 
FROM worker)

SELECT  
    department, 
    employee_name, 
    salary 
FROM cte WHERE rank = 1;

Link:https://platform.stratascratch.com/coding/9865-highest-salaried-employees?code_type=1


/*Find customers who have never made an order.
Output the first name of the customer.(ID 9896)*/

Solution: 
SELECT 
    c.first_name 
FROM customers c 
LEFT JOIN orders o
ON c.id= o.cust_id 
WHERE o.cust_id IS NULL;

Link:https://platform.stratascratch.com/coding/9896-customers-without-orders?code_type=1