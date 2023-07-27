/*Find the number of customers without an order.(ID 10089)*/

Solution: 
SELECT 
    COUNT(c.id)
FROM orders o 
Right JOIN customers c 
ON o.cust_id= c.id 
WHERE o.id IS NULL;

Link:https://platform.stratascratch.com/coding/10089-find-the-number-of-customers-without-an-order?code_type=1

/*You have been asked to find the employees with the highest and lowest salary.
Your output should include the employee's ID, salary, and department, as well as a column salary_type that categorizes the output by:
'Highest Salary' represents the highest salary
'Lowest Salary' represents the lowest salary(ID 10152)*/

Solution: 
with cte AS(
SELECT *, DENSE_RANK() OVER(ORDER BY salary) AS min_salary,
          DENSE_RANK() OVER(ORDER BY salary DESC) AS max_salary
FROM worker)

SELECT 
worker_id,
salary,
department,
CASE WHEN  max_salary = 1 THEN 'Highest Salary'
WHEN min_salary = 1 THEN 'Lowest Salary'
END AS salary_type
FROM cte
WHERE min_salary = 1
OR max_salary = 1;

Link:https://platform.stratascratch.com/coding/10152-workers-with-the-highest-and-lowest-salaries?code_type=1

/*Find the lowest order cost of each customer.
Output the customer id along with the first name and the lowest order price.(ID 9912)*/

Solution: 
SELECT
DISTINCT(o.cust_id), 
c.first_name, 
FIRST_VALUE(O.total_order_cost)
OVER (PARTITION BY cust_id ORDER BY O.total_order_cost) AS lowest_price_per_group
FROM customers C 
JOIN orders O ON 
C.id = O.cust_id;

Link: https://platform.stratascratch.com/coding/9912-lowest-priced-orders?code_type=1