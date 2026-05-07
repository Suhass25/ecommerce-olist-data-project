# ecommerce-olist-data-project
End-to-end data analysis of the Olist Ecommerce dataset. Includes data cleaning with Python (Pandas), exploratory data analysis using SQL, and interactive dashboards in Tableau/Power BI.

# 🛒 Olist E-Commerce Data Analysis

## 📌 Project Overview
This project analyzes the Olist Brazilian E-Commerce dataset to uncover insights regarding customer purchasing behavior, delivery performance, and overall revenue trends. The goal was to transform raw transactional data into actionable business intelligence.

## 🛠️ Tools Used
* **SQL:** Used for data extraction, joining multiple tables, and aggregating key metrics.
* **Microsoft Excel:** Used for initial data profiling, cleaning, and ad-hoc pivot table analysis.
* **Tableau:** Used to design an interactive dashboard focusing on geographic sales distribution.
* **Power BI:** Used to build a comprehensive KPI tracking dashboard for executive review.

## 📊 Dashboard Previews

### Power BI Executive View
*(Upload your Power BI screenshot to GitHub, and drag-and-drop the image right here in the text editor to display it!)*

### Tableau Geographic Sales View
*(Drag-and-drop your Tableau screenshot here!)*

## 💡 Key Business Insights
1.  **Revenue Drivers:** Found that [Insert Category] generates the highest percentage of overall revenue.
2.  **Delivery Bottlenecks:** Identified that [Insert City/State] experiences the highest average delivery delay.
3.  **Customer Retention:** Discovered that [Insert Insight about repeat purchases or payment methods].

## 💻 SQL Query Highlights
Here is a snippet of the SQL used to calculate the top product categories by revenue:

```sql
SELECT 
    product_category_name, 
    SUM(payment_value) as total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY product_category_name
ORDER BY total_revenue DESC
LIMIT 10;
