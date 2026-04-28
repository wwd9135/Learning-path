orders
order_id | customer | amount
---------|----------|-------
1        | William  | 150
2        | John     | 80
3        | Sarah    | 200
4        | William  | 300
5        | John     | 50
6        | Sarah    | 175

# Select all customers whos averagre spending is above AVG()
1. collect wider avg using a subquery- SELECT AVG(amount)
    grab order total assinged to each user, 
    collect average of that spending, 
    GROUP by customer, amount(AVG) should suffice
    
3. SELECT customer
4. HAVING AVG(amount) > subquery AVG()

WITH Total_orders AS (
    SELECT customer, SUM(amount) AS total_spend
    FROM orders
    GROUP BY customer) 
SELECT customer, total_spend
FROM customer_totals
WHERE total_spend > (SELECT AVG(total_spend) FROM customer_totals)

Question 2 — Window Function (Medium)

employees
employee | dept    | salary | hire_date
---------|---------|--------|----------
William  | Eng     | 95000  | 2020-01-15
Sarah    | Eng     | 92000  | 2019-03-20
John     | Eng     | 87000  | 2021-06-10
Lisa     | Sales   | 81000  | 2018-11-05
Tom      | Sales   | 79000  | 2020-08-22
Mike     | Sales   | 76000  | 2019-04-17
For each employee show their name, department, salary, and how their salary compares to their department average. 
Also show their rank within their department by salary.

1. SELECT name, dept, salary FROM employee
2. windows function for salary vs dept avg

3. another windows function for rank within dept by salary

SELECT 
    employee,
    dept,
    salary,
    AVG(salary) OVER (PARTITION BY dept) AS dept_avg_salary,
    DENSE_RANK() OVER (PARTITION BY dept ORDER BY salary DESC) AS salary_rank
FROM employees;


Question 3 — CTE (Medium)
Using this table:
sales
sale_id | product  | region | amount | sale_date
--------|----------|--------|--------|----------
1       | Laptop   | North  | 999    | 2024-01-05
2       | Phone    | South  | 499    | 2024-01-12
3       | Laptop   | South  | 999    | 2024-02-08
4       | Tablet   | North  | 299    | 2024-02-15
5       | Phone    | North  | 499    | 2024-03-01
6       | Laptop   | North  | 999    | 2024-03-22
7       | Tablet   | South  | 299    | 2024-03-18
8       | Phone    | South  | 499    | 2024-03-25
Find the best selling product in each region by total revenue. SELECT region, product, and total revenue.

1.Filter down a CTE so it contains region, best product
2. achieve this by grouping by region & summing sale amount
3. How do we find the highest product though

WITH total_rev AS (
    SELECT region, product, SUM(amount) AS total_revenue
    FROM sales
    GROUP BY region, product
), total_region AS (SELECT region,product, total_revenue,
     DENSE_RANK() OVER(PARTITION BY region) AS rankings
    FROM total_rev
    )

SELECT total_region.region, total_region.product, total_region.total_revenue
FROM total_region
WHERE total_region.rankings = 1

Question 4 — CTE + Window Function (Medium)
employees
employee | dept    | salary | hire_date
---------|---------|--------|----------
William  | Eng     | 95000  | 2020-01-15
Sarah    | Eng     | 92000  | 2019-03-20
John     | Eng     | 87000  | 2021-06-10
Lisa     | Sales   | 81000  | 2018-11-05
Tom      | Sales   | 79000  | 2020-08-22
Mike     | Sales   | 76000  | 2019-04-17
Find employees who earn more than the average salary in their department. Show their name, department, salary, department average, and their rank within the department.

1. CTE to group by dept, create AVG salary
2. second CTE with a windows func to rank by salary

Collect avg salary per dept,
compare employees against that in final WHERE clause
Need a win function somewhere to rank against partition of dept rank by salary

WITH avg_sal AS (
    SELECT employee, dept, salary,
           AVG(salary) OVER (PARTITION BY dept) AS avg_salary
    FROM employees
),
avg_sal2 AS (
    SELECT employee, dept, salary, avg_salary,
           DENSE_RANK() OVER (PARTITION BY dept ORDER BY salary DESC) AS rnk
    FROM avg_sal
)
SELECT employee, dept, salary, avg_salary, rnk
FROM avg_sal2
WHERE salary > avg_salary


Question 5 — Subquery + Window Function (Medium/Hard)

orders
order_id | customer | product  | amount | order_date
---------|----------|----------|--------|----------
1        | William  | Laptop   | 999    | 2024-01-05
2        | William  | Phone    | 499    | 2024-01-15
3        | William  | Tablet   | 299    | 2024-02-01
4        | John     | Laptop   | 999    | 2024-01-08
5        | John     | Phone    | 499    | 2024-02-14
6        | Sarah    | Tablet   | 299    | 2024-01-20
7        | Sarah    | Laptop   | 999    | 2024-03-05
8        | Sarah    | Phone    | 499    | 2024-03-15
For each customer show their most recent order, the amount, and their running total spend up to that order.

1. Subquery to find most recent order per customer (yongest date)
2. Window function to calculate running total spend per customer

WITH recent_order AS (
    SELECT customer, order_date, product, amount,
           DENSE_RANK() OVER (PARTITION BY customer ORDER BY order_date DESC) AS rnk,
           SUM(amount) OVER (PARTITION BY customer ORDER BY order_date) AS running_total
    FROM orders
)
SELECT customer, product, amount, order_date, running_total
FROM recent_order
WHERE rnk = 1