# Day 16 – Customer Segmentation (SQL Daily Challenge)

A beginner-friendly SQL challenge that analyzes customer data and segments customers by spending behavior using core SQL clauses.

## Skills Practiced

| Clause | Used For |
|--------|----------|
| `SELECT` | Retrieving columns and computed values |
| `WHERE` | Filtering rows (city, spend, age range) |
| `ORDER BY` | Sorting results |
| `GROUP BY` | Aggregating per city / per segment |
| `CASE` | Building spending segments |
| `HAVING` | Filtering aggregated groups |

Aggregate functions used: `SUM()`, `AVG()`, `COUNT()`. Also `BETWEEN` for range filtering.

## Repository Contents

```
.
├── Day16_Coding_Challenge.pdf                 # Problem statement
├── day_16_data_analytics_daily_challenge.sql  # Table setup + solutions
└── README.md
```

## Dataset

Table: `customers`

| Column | Type | Description |
|--------|------|-------------|
| `customer_id` | INT | Unique customer ID |
| `customer_name` | VARCHAR(50) | Customer name |
| `city` | VARCHAR(50) | City of residence |
| `age` | INT | Customer age |
| `total_spent` | DECIMAL(10,2) | Total amount spent |
| `number_of_orders` | INT | Number of orders placed |

The table contains 8 sample customers across Bangalore, Mumbai, and Delhi.

## Questions & Approach

### Level 1: Basic Filtering
1. Show all customers from Bangalore: `WHERE city = 'Bangalore'`
2. Customers with `total_spent > 20000`: `WHERE` with a comparison
3. Customers aged between 25 and 35: `BETWEEN 25 AND 35` (inclusive)

### Level 2: Sorting & Aggregation
4. Sort by `total_spent`, highest first: `ORDER BY total_spent DESC`
5. Total revenue: `SUM(total_spent)`
6. Average spend per customer: `AVG(total_spent)`

### Level 3: Grouping
7. Total spending per city: `GROUP BY city` with `SUM()`
8. Number of customers per city: `GROUP BY city` with `COUNT(*)`

### Level 4: Customer Segmentation (Core Task)
9. Count customers in each segment using `CASE`:

| Segment | Rule |
|---------|------|
| Low Spent | `total_spent <= 10000` |
| Medium Spent | `10000 < total_spent <= 40000` |
| High Spent | `total_spent > 40000` |

### Level 5: HAVING
10. Cities where total spending is greater than 50000: `GROUP BY city HAVING SUM(total_spent) > 50000`

## Sample Results

| Query | Result |
|-------|--------|
| Total revenue | 235,000 |
| Average spend | 29,375 |
| Segments | Low: 2, Medium: 3, High: 3 |
| Cities with spend > 50,000 | Bangalore (142,000), Mumbai (70,000) |

## How to Run

1. Open MySQL Workbench (or any MySQL client).
2. Create the database used by the script:
   ```sql
   CREATE DATABASE IF NOT EXISTS dailychallenge;
   ```
3. Run `day_16_data_analytics_daily_challenge.sql`. It selects the database, creates the `customers` table, inserts the sample data, and then runs all 10 queries.

> Note: if you re-run the script, drop the table first (`DROP TABLE customers;`) to avoid a "table already exists" error.

## Key Takeaways

- `WHERE` filters rows **before** grouping; `HAVING` filters groups **after** aggregation.
- `CASE` lets you create custom categories on the fly without altering the table.
- Column aliases can be reused in `GROUP BY` / `HAVING` in MySQL, but not in every database (e.g., standard SQL Server requires repeating the expression).

---

Part of my daily data analytics practice series.
