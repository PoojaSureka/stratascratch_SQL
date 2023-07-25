/*Find the position of the lower case letter 'a' in the first name of the worker 'Amitah'.(ID 9829)*/

Solution: 
SELECT
    POSITION ('a' in first_name) 
FROM worker 
WHERE first_name = 'Amitah';

Link:https://platform.stratascratch.com/coding/9829-positions-of-letter-a?code_type=1



/*Amazon's information technology department is looking for information on employees' most recent logins.
The output should include all information related to each employee's most recent login.(ID 2141)*/

Solution: 
with cte AS 
(SELECT 
    worker_id,
    MAX(login_timestamp) AS recent_login 
FROM worker_logins
GROUP BY worker_id)
SELECT 
    wl.*
FROM worker_logins wl 
JOIN cte ct 
ON wl.worker_id = ct.worker_id
AND wl.login_timestamp = ct.recent_login;

Link:https://platform.stratascratch.com/coding/2141-most-recent-employee-login-details?code_type=1



/*Write a query to get a list of products that have not had any sales. Output the ID and market name of these products.(ID 2109)*/

Solution: 
SELECT 
    dim.prod_sku_id, 
    dim.market_name
FROM fct_customer_sales fct 
RIGHT JOIN dim_product dim 
ON fct.prod_sku_id = dim.prod_sku_id
WHERE fct.prod_sku_id IS NULL;

Link:https://platform.stratascratch.com/coding/2109-products-with-no-sales?code_type=1