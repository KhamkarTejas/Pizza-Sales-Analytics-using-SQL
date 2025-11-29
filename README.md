# 🍕 Pizza Sales Analytics using SQL
     This project is an end-to-end SQL analysis of a pizza store’s sales data, designed to uncover meaningful business insights from raw transactional data.Using advanced SQL techniques — CTEs,          window functions, joins, time-based analysis, and data cleaning — this project demonstrates strong analytical thinking and real-world data handling skills.
---
## 📂 Dataset Overview
The dataset contains 4 relational tables:
| Table Name        | Description                                    |
| ----------------- | ---------------------------------------------- |
| **orders**        | order_id, order_date, order_time               |
| **order_details** | order_details_id, order_id, pizza_id, quantity |
| **pizzas**        | pizza_id, pizza_type_id, size, price           |
| **pizza_types**   | pizza_type_id, name, category                  |

These tables help analyze order behavior, revenue, pizza preferences, and category distribution.

---

## 🎯 Project Objectives
### Basic:
- Retrieve the total number of orders placed.
- Calculate the total revenue generated from pizza sales.
- Identify the highest-priced pizza.
- Identify the most common pizza size ordered.
- List the top 5 most ordered pizza types along with their quantities.

### Intermediate:
- Join the necessary tables to find the total quantity of each pizza category ordered.
- Determine the distribution of orders by hour of the day.
- Join relevant tables to find the category-wise distribution of pizzas.
- Group the orders by date and calculate the average number of pizzas ordered per day.
- Determine the top 3 most ordered pizza types based on revenue.

### Advanced:
- Calculate the percentage contribution of each pizza type to total revenue.
- Analyze the cumulative revenue generated over time.
- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
---
## 📊 Key Insights
- Large pizzas dominate sales, indicating customers prefer bigger meals.
- Classic pizzas lead customers' choices, but Chicken pizzas lead revenue.
- Sales peak around lunch (12–2 PM) and early dinner (5–7 PM).
- The business has a balanced category performance, reducing dependency on a single segment.
- Daily revenue growth is consistent, showing healthy customer flow.
- The top-selling pizzas are a mix of Classic and Chicken, suggesting varied customer taste preferences.

---
## 🛠️ SQL Concepts & Techniques Used
- Aggregations: COUNT, SUM, AVG, ROUND
- Joins: INNER, LEFT, RIGHT across 4 tables
- Grouping & Sorting: GROUP BY, ORDER BY
- Date/Time Functions: EXTRACT(HOUR FROM order_time)
- String Functions: CONCAT for formatting
- Subqueries & CTEs: Used for modular and complex analysis
- Window Functions: RANK, OVER, PARTITION BY for ranking & cumulative calculations
- Data Cleaning: ALTER TABLE to modify and correct datatypes
---
## 👨‍💻 About the Author

Tejas Khamkar
Data Analyst | SQL | Excel | Power BI | Python
🔗 LinkedIn: https://www.linkedin.com/in/tejaskhamkar/

