/* Exploratory Data Analysis (EDA) Queries

*Total Revenue
Calculate the total revenue generated from all orders.*/

SELECT SUM(payment_value) AS total_revenue FROM order_payments;
SELECT round(sum(payment_value)/1000000,2) AS total_revenue_in_millions FROM order_payments;

/*product price vs freight cost
Calculate the avg price and avg freight cost.*/
SELECT 
    p.product_category_english, 
    round(AVG(Item_Price),2) AS avg_price, 
    round(AVG(Freight_Cost),2) AS avg_freight,
    round((AVG(Freight_Cost) / AVG(Item_Price)) * 100,2) AS freight_ratio_percentage
FROM Order_items oi
JOIN Products p ON oi.Product_ID = p.product_id
GROUP BY p.product_category_english
ORDER BY freight_ratio_percentage DESC;



/*Top 10 Product Categories by Sales
Identify the best-selling product categories.*/

SELECT p.product_category_english, concat(round(COUNT(oi.product_id)/1000,2), ' K') AS items_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_english
ORDER BY items_sold DESC
LIMIT 10;

/*Customer Count by State
Identify which states have the most customers.*/

SELECT customer_state, COUNT(*) AS count FROM customers GROUP BY customer_state ORDER BY count DESC;

/*Review Sentiment Distribution
Break down review sentiment for delivered orders.*/

SELECT sentiment, COUNT(*) AS count FROM reviews GROUP BY sentiment ORDER BY count DESC;

/*Average Delivery Time by State
Calculate the average delivery lead time for each customer state.*/

SELECT c.customer_state, round(AVG(o.delivery_lead_time_days),1) AS avg_lead_time
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY avg_lead_time ASC;

/*Top 5 Sellers by Revenue
Find the sellers generating the most revenue.*/

SELECT s.seller_id, s.seller_city, concat(round(SUM(oi.item_price)/ 100000,2), ' L') AS total_sales
FROM order_items oi
JOIN sellers s ON oi.seller_id = s.seller_id
GROUP BY s.seller_id, s.seller_city
ORDER BY total_sales DESC
LIMIT 5;

/*Preferred Payment Methods
Analyze the distribution of payment types.*/

SELECT payment_type, COUNT(*) AS usage_count FROM order_payments GROUP BY payment_type ORDER BY usage_count DESC;











