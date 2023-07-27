/*Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. 
If customer had more than one order on a certain day, sum the order costs on daily basis. 
Output customer's first name, total cost of their items, and the date.
For simplicity, you can assume that every first name in the dataset is unique.(ID 9915)*/

Solution: 
with cte AS 
(SELECT 
    c.first_name,
    o.order_date, 
    SUM(o.total_order_cost) AS total_order_cost,
    COUNT(o.order_date) AS cn
FROM customers c
JOIN orders o 
ON c.id = o.cust_id
WHERE order_date BETWEEN '2019-02-01' AND '2019-05-01'
GROUP BY c.first_name, o.order_date)

SELECT
    first_name, 
    total_order_cost, 
    order_date 
FROM cte WHERE cn>1;

Link:https://platform.stratascratch.com/coding/9915-highest-cost-orders?code_type=1


/*Find the second highest salary of employees.(ID 9892)*/

Solution: 
with cte AS (
SELECT salary,
DENSE_RANK() OVER(ORDER BY salary DESC) AS rn 
FROM employee)

SELECT salary FROM cte WHERE rn = 2;

Link:https://platform.stratascratch.com/coding/9892-second-highest-salary?code_type=1



/*Find departments with less than 4 employees.
Output the department along with the corresponding number of workers.(ID 9860)*/

Solution: 
SELECT 
    department, 
    COUNT(department) AS count_of_department 
FROM worker
GROUP BY department
HAVING COUNT(department) < 4;

Link:https://platform.stratascratch.com/coding/9860-find-departments-with-less-than-4-employees?code_type=1

