
-- 1. Top 5 top products sold by total units 
SELECT
    p.product_id,
    p.category,
    SUM(oi.quantity)                    AS total_units_sold,
    SUM(oi.quantity * oi.unitprice)    AS total_revenue
FROM Product p
JOIN Order_Item oi ON p.product_id = oi.product_id
JOIN Orders o       ON oi.order_id  = o.order_id
WHERE o.status != 'cancelled'
GROUP BY p.product_id, p.category
ORDER BY total_units_sold DESC
FETCH FIRST 5 ROWS ONLY;

-- 2. 5top products by revenue generate
SELECT
    p.product_id,
    
    p.category,
    SUM(oi.quantity * oi.unit_price)    AS total_revenue,
    RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS revenue_rank
FROM Product p
JOIN Order_Item oi ON p.product_id = oi.product_id
JOIN Orders o       ON oi.order_id  = o.order_id
WHERE o.status != 'CANCELLED'
GROUP BY p.product_id, p.category
ORDER BY total_revenue DESC
FETCH FIRST 5 ROWS ONLY;



-- 3. 10 tops customer by life time spends
SELECT
    c.customer_id,
    c.customer_name                              AS customer_name,
    c.city,
    COUNT(DISTINCT o.order_id)          AS total_orders,
    SUM(oi.quantity * oi.unitprice)    AS lifetime_value,
    DENSE_RANK() OVER (ORDER BY SUM(oi.quantity * oi.unitprice) DESC) AS value_rank
FROM Customer c
JOIN Orders o       ON c.customer_id = o.customer_id
JOIN Order_Item oi ON o.order_id    = oi.order_id
WHERE o.status != 'cancelled'
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY lifetime_value DESC
FETCH FIRST 10 ROWS ONLY;

-- 4. segementation value od the customer(high/low)
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.unitprice) AS lifetime_value,
    CASE
        WHEN SUM(oi.quantity * oi.unitprice) >= 10000 THEN 'high value'
        WHEN SUM(oi.quantity * oi.unitprice) >= 5000  THEN 'mid value'
        ELSE 'low value'
    END AS customer_segment
FROM Customer c
JOIN Orders o       ON c.customer_id = o.customer_id
JOIN Order_Item oi ON o.order_id    = oi.order_id
WHERE o.status != 'cancelled'
GROUP BY c.customer_id, c.customer_name
ORDER BY lifetime_value DESC;



-- 5. month revenue across all the yeasrs
SELECT
    TO_CHAR(o.order_date, 'YYYY-MM')           AS year_month,
    TO_CHAR(o.order_date, 'Mon YYYY')          AS month_label,
    COUNT(DISTINCT o.order_id)                  AS total_orders,
    SUM(oi.quantity * oi.unitprice)            AS monthly_revenue,
    ROUND(AVG(oi.quantity * oi.unitprice), 2)  AS avg_order_value
FROM Orders o
JOIN Order_Item oi ON o.order_id = oi.order_id
WHERE o.status != 'cancelled'
GROUP BY TO_CHAR(o.order_date, 'YYYY-MM'), TO_CHAR(o.order_date, 'Mon YYYY')
ORDER BY year_month;

-- 6. renevie growth month over month
SELECT
    year_month,
    monthly_revenue,
    LAG(monthly_revenue) OVER (ORDER BY year_month)          AS prev_month_revenue,
    ROUND(
        (monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY year_month))
        / NULLIF(LAG(monthly_revenue) OVER (ORDER BY year_month), 0) * 100,
    2)                                                        AS growth_pct
FROM (
    SELECT
        TO_CHAR(o.order_date, 'YYYY-MM')          AS year_month,
        SUM(oi.quantity * oi.unitprice)           AS monthly_revenue
    FROM Orders o
    JOIN Order_Item oi ON o.order_id = oi.order_id
    WHERE o.status != 'cancelled'
    GROUP BY TO_CHAR(o.order_date, 'YYYY-MM')
)
ORDER BY year_month;


-- 6.volume and revenue per category 
SELECT
    p.category,
    COUNT(DISTINCT oi.item_id)           AS line_items_sold,
    SUM(oi.quantity)                     AS total_units,
    SUM(oi.quantity * oi.unitprice)     AS total_revenue,
    ROUND(
        SUM(oi.quantity * oi.unitprice)
        / SUM(SUM(oi.quantity * oi.unitprice)) OVER () * 100,
    2)                                   AS revenue_share_pct
FROM Product p
JOIN Order_Item oi ON p.product_id = oi.product_id
JOIN Orders o       ON oi.order_id  = o.order_id
WHERE o.status != 'cancelled'
GROUP BY p.category
ORDER BY total_revenue DESC;

-- 7. bestest product with under each caegory 
SELECT *
FROM (
    SELECT
        p.category,
        
        SUM(oi.quantity * oi.unitprice)    AS category_revenue,
        RANK() OVER (
            PARTITION BY p.category
            ORDER BY SUM(oi.quantity * oi.unitprice) DESC
        ) AS rank_in_category
    FROM Product p
    JOIN Order_Item oi ON p.product_id = oi.product_id
    JOIN Orders o       ON oi.order_id  = o.order_id
    WHERE o.status != 'cancelled'
    GROUP BY p.category
)
WHERE rank_in_category = 1
ORDER BY category_revenue DESC;


-- 8. cusomerts who have ever placed an order 
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    c.signupdate,
    'Never Ordered' AS status
FROM Customer c
WHERE c.customer_id NOT IN (
    SELECT DISTINCT customer_id FROM Orders
);

--9. customers who have not placed order for past 180 days 
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    MAX(o.order_date)                   AS last_order_date,
    ROUND(SYSDATE - MAX(o.order_date))  AS days_since_last_order
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.city
HAVING MAX(o.order_date) < SYSDATE - 180
ORDER BY days_since_last_order DESC;

