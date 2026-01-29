--Top Products 

SELECT
    product_name,
    COUNT(*) AS total_orders
FROM CURATED.FACT_ORDER_PRODUCTS
GROUP BY product_name
ORDER BY total_orders DESC
LIMIT 10;


--Orders by Department 

SELECT
    department,
    COUNT(DISTINCT order_id) AS total_orders
FROM CURATED.FACT_ORDER_PRODUCTS
GROUP BY department
ORDER BY total_orders DESC;


--Reorder Rate 

SELECT
    ROUND(AVG(reordered) * 100, 2) AS reorder_percentage
FROM CURATED.FACT_ORDER_PRODUCTS;
