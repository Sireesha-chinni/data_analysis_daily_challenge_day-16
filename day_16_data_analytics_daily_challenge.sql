use dailychallenge;

-- Dataset: customers
-- Table Structure
CREATE TABLE customers (
customer_id INT,
customer_name VARCHAR(50),
city VARCHAR(50),
age INT,
total_spent DECIMAL(10,2),
number_of_orders INT
);

-- Sample Data
INSERT INTO customers VALUES
(1, 'Amit', 'Bangalore', 25, 12000, 5),
(2, 'Neha', 'Mumbai', 30, 45000, 12),
(3, 'Raj', 'Delhi', 22, 8000, 3),
(4, 'Sneha', 'Bangalore', 28, 60000, 15),
(5, 'Karan', 'Mumbai', 35, 20000, 7),
(6, 'Pooja', 'Delhi', 27, 15000, 6),
(7, 'Arjun', 'Bangalore', 40, 70000, 20),
(8, 'Meera', 'Mumbai', 23, 5000, 2);

-- Questions
-- Level 1: Basic Filtering
-- 1. Show all customers from Bangalore

select * from customers 
where city ="Bangalore";


-- 2. Display customers with total_spent > 20000

select * from customers
where total_spent >20000;


-- 3. List customers aged between 25 and 35

select * from customers
where age between 25 and 35;


-- Level 2: Sorting & Aggregation
-- 4. Show all customers sorted by total_spent (highest first)

select * from customers
order by total_spent desc;


-- 5. Find the total revenue generated

select sum(total_spent) as total_revenue from customers;

-- 6. Find the average spending per customer

select avg(total_spent) as average_Spent from customers;


-- Level 3: Grouping
-- 7. Find total spending per city

Select city,sum(total_spent) as 'Total spending' from customers
group by city;

-- 8. Count number of customers in each city

select city,count(*) as "Number of customers" from customers
group by city;


-- Level 4: Customer Segmentation (CORE TASK )
-- 9.Count how many customers fall into each segment

select 
case
when total_spent <= 10000 then "Low Spent"
when total_spent <= 40000 then "Medium Spent"
else "High Spent" 
end as spent_level , count(*) as customer_count
from customers
group by spent_level;


-- Level 5: Advanced Basic (HAVING)
-- 10.Show cities where total spending is greater than 50000

select city,sum(total_spent) as total_spending from customers
group by city
having total_spending > 50000;