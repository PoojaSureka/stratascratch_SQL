/*You have been asked to find the job titles of the highest-paid employees.
Your output should include the highest-paid title or multiple titles with the same salary.(ID 10353)*/

Solution: 
with cte AS(
SELECT 
    worker_id, 
    t.worker_title as best_paid_title, 
    DENSE_RANK() OVER(ORDER BY w.salary DESC) AS rn
FROM worker w Join title t 
ON w.worker_id= t.worker_ref_id
)
SELECT best_paid_title FROM cte WHERE rn = 1;

Link:https://platform.stratascratch.com/coding/10353-workers-with-the-highest-salaries?code_type=1

/*Write a query that'll identify returning active users. 
A returning active user is a user that has made a second purchase within 7 days of any other of their purchases.
 Output a list of user_ids of these returning active users.(ID 10322)*/

Solution: 
SELECT 
    Distinct(at1.user_id)
FROM amazon_transactions at1 JOIN amazon_transactions at2
ON at1.user_id = at2.user_id
WHERE at1.created_at - at2.created_at BETWEEN 0 AND 7
AND at1.id!=at2.id;

Link:https://platform.stratascratch.com/coding/10322-finding-user-purchases?code_type=1

/*You have been asked to find the employee with the highest salary.
 Output the worker or worker's first name, as well as the salary.(ID 9870)*/

Solution: 
with cte AS
(SELECT
    first_name, 
    salary, 
    DENSE_RANK() OVER(ORDER BY salary DESC) AS rn 
FROM worker)
SELECT first_name, salary FROM cte WHERE rn = 1;

Link:https://platform.stratascratch.com/coding/9870-highest-salary?code_type=1