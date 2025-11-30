-- #Basic 
-- Q1 Retrieve the total number of orders placed.

SELECT 
    COUNT(order_id) AS total_orders
FROM
    orders;
    
    
-- Q2 Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(pizzas.price * order_details.quantity), 2) AS total_sales
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id;
      
      
-- Q3 Identify the highest-priced pizza.

SELECT 
    pizza_types.name , pizzas.price 
FROM
    pizzas
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;      


-- Q4 Identify the most common pizza size ordered.

SELECT 
    pizzas.size, COUNT(order_details.order_details_id) AS orders
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY orders DESC
LIMIT 1;


-- Q5 List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pizza_types.name,
    SUM(order_details.quantity) AS total_quantity
FROM
    pizzas
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
        JOIN
    pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.name
ORDER BY total_quantity DESC
LIMIT 5;



-- #Intermediate
-- Q6 Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    pizza_types.category,
    SUM(order_details.quantity) AS total_quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.category
ORDER BY total_quantity DESC;



-- Q7 Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(order_time) AS hours, 
    COUNT(order_id) AS orders_count
FROM
    orders
GROUP BY hours
ORDER BY hours;



-- Q8 Join relevant tables to find the category-wise distribution of pizzas.

SELECT 
    category, 
    COUNT(name) AS pizza_count
FROM
    pizza_types
GROUP BY category;



-- Q9 Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    ROUND(AVG(quantity), 0) AS Avg_pizzas_ordered_per_day
FROM
    (SELECT 
        orders.order_date, SUM(order_details.quantity) AS quantity
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS order_quantity;



-- Q10 Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pizza_types.name,
    SUM(pizzas.price * order_details.quantity) AS revenue
FROM
    pizzas
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;



-- #Advanced
-- Q11 Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pizza_types.category,
    CONCAT(ROUND((SUM(pizzas.price * order_details.quantity) / (SELECT 
				SUM(pizzas.price * order_details.quantity)
			FROM
				pizzas
					JOIN
				order_details ON pizzas.pizza_id = order_details.pizza_id)) * 100, 2), '%') AS revenue_prct
FROM
    pizzas
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue_prct DESC;
  
  
  
-- Q12 Analyze the cumulative revenue generated over time.

SELECT *, 
    ROUND(SUM(revenue) OVER(ORDER BY order_date),2) cumulative_revenue 
FROM (
      SELECT 
          orders.order_date,
          ROUND(SUM(pizzas.price * order_details.quantity), 2) revenue
      FROM
          pizzas
              JOIN order_details USING (pizza_id)
              JOIN orders USING (order_id)
      GROUP BY orders.order_date
      ORDER BY orders.order_date) AS C ;

-- Q13 Determine the top 3 most ordered pizza types based on revenue for each pizza category.

WITH cte AS (
SELECT 
    pizza_types.category,
    pizza_types.name,
    ROUND(SUM(pizzas.price * order_details.quantity),2) AS  revenue
FROM
    pizza_types
        JOIN
    pizzas USING (pizza_type_id)
        JOIN
    order_details USING (pizza_id)
GROUP BY pizza_types.category , pizza_types.name)

SELECT *
FROM(
     SELECT  * , 
             RANK() OVER(PARTITION BY category ORDER BY revenue DESC) AS rnk
     FROM cte) AS a
WHERE rnk <=3 ; 