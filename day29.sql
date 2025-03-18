/*Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+
This table may contain duplicates rows. 
customer_id is not NULL.
product_key is a foreign key (reference column) to Product table.
 

Table: Product

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_key | int     |
+-------------+---------+
product_key is the primary key (column with unique values) for this table.
 

Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

Return the result table in any order. */
# Write your MySQL query statement below
WITH CustomerCounts AS (
    SELECT customer_id, COUNT(DISTINCT product_key) AS bought_count
    FROM Customer
    GROUP BY customer_id
),
TotalProducts AS (
    SELECT COUNT(*) AS total_count FROM Product
)
SELECT c.customer_id
FROM CustomerCounts c, TotalProducts p
WHERE c.bought_count = p.total_count;