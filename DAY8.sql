/*Amazon's information technology department is looking for information on employees' most recent logins.
The output should include all information related to each employee's most recent login.(ID 2141)*/

Solution: 
with cte AS 
(SELECT 
    worker_id,
    login_timestamp ,
    DENSE_RANK() OVER(PARTITION BY worker_id ORDER BY login_timestamp DESC) AS rank
FROM
worker_logins)

SELECT 
    wl.* 
FROM worker_logins wl 
JOIN cte ct 
ON wl.worker_id = ct.worker_id
AND wl.login_timestamp = ct.login_timestamp
WHERE ct.rank =1;

Link:https://platform.stratascratch.com/coding/2141-most-recent-employee-login-details?code_type=1

/*Find the number of employees in each department.
Output the department name along with the corresponding number of employees.(ID 9861)*/

Solution: 
SELECT 
    department, COUNT(worker_id) 
FROM worker 
GROUP BY department;

Link:https://platform.stratascratch.com/coding/9861-find-the-number-of-employees-in-each-department?code_type=1

/*Calculate the sales revenue for the year 2021.(ID 2127)*/

Solution: 
SELECT 
    SUM(order_total)
FROM amazon_sales
WHERE EXTRACT('YEAR' FROM order_date) = 2021;

Link:https://platform.stratascratch.com/coding/2127-sales-revenue?code_type=1