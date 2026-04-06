

-- views 1: full orders summary with customers and revenue detail
CREATE OR REPLACE VIEW vw_order_summary AS
SELECT
    o.order_id,
    o.order_date,
    o.status,
    c.customer_id,
    c.customer_name          AS customer_name,
    c.city,
    COUNT(oi.item_id)                   AS total_line_items,
    SUM(oi.quantity)                    AS total_qty,
    SUM(oi.quantity * oi.unitprice)    AS order_total
FROM Orders o
JOIN Customer c    ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id    = oi.order_id
GROUP BY o.order_id, o.order_date, o.status, c.customer_id, c.customer_name, c.city;

-- VIEW 2: overview of the performnace of the product 
CREATE OR REPLACE VIEW vw_product_performance AS
SELECT
    p.product_id,
    
    p.category,
    p.price         AS list_price,
    NVL(SUM(oi.quantity), 0)                 AS total_sold,
    NVL(SUM(oi.quantity * oi.unitprice), 0) AS total_revenue,
    p.stock_qty     AS current_stock
FROM Product p
LEFT JOIN Order_Item oi ON p.product_id = oi.product_id
LEFT JOIN Orders o       ON oi.order_id  = o.order_id
    AND o.status != 'cancelled'
GROUP BY p.product_id, p.category, p.price, p.stock_qty;

-- VIEW 3: Customer 360 view
CREATE OR REPLACE VIEW vw_customer_360 AS
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    c.signupdate,
    COUNT(DISTINCT o.order_id)               AS total_orders,
    NVL(SUM(oi.quantity * oi.unitprice), 0) AS lifetime_value,
    MAX(o.order_date)                        AS last_order_date,
    CASE
        WHEN MAX(o.order_date) IS NULL                      THEN 'never ordered'
        WHEN MAX(o.order_date) >= SYSDATE - 90             THEN 'active'
        WHEN MAX(o.order_date) BETWEEN SYSDATE-180 AND SYSDATE-91 THEN 'at risk'
        ELSE 'inactive'
    END AS customer_status
FROM Customer c
LEFT JOIN Orders o       ON c.customer_id = o.customer_id
    AND o.status != 'cancelled'
LEFT JOIN Order_Item oi ON o.order_id    = oi.order_id
GROUP BY c.customer_id, c.customer_name, c.city, c.signupdate;




-- PROCEDURE 2: Customer order history lookup
CREATE OR REPLACE PROCEDURE sp_customer_history (
    p_customer_id IN Customer.customer_id%TYPE
) IS
    v_name      Customer.name%TYPE;
    v_city      Customer.city%TYPE;

    CURSOR c_orders IS
        SELECT o.order_id, o.order_date, o.status,
               SUM(oi.quantity * oi.unitprice) AS order_total
        FROM Orders o
        JOIN Order_Item oi ON o.order_id = oi.order_id
        WHERE o.customer_id = p_customer_id
        GROUP BY o.order_id, o.order_date, o.status
        ORDER BY o.order_date DESC;
BEGIN
    SELECT customer_name, city INTO v_name, v_city
    FROM Customer
    WHERE customer_id = p_customer_id;

    DBMS_OUTPUT.PUT_LINE('Customer: ' || v_name || ' (' || v_city || ')');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');

    FOR r IN c_orders LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Order#' || r.order_id ||
            '  Date: ' || TO_CHAR(r.order_date, 'DD-Mon-YYYY') ||
            '  Status: ' || RPAD(r.status, 10) ||
            '  Total: Rs.' || TO_CHAR(r.order_total, '99,999.00')
        );
    END LOOP;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Customer ID ' || p_customer_id || ' not found.');
END sp_customer_history;
/

-- ---------------------------------------------------------------
-- SAMPLE EXECUTION (remove comments to run)
-- ---------------------------------------------------------------
-- EXEC sp_monthly_report(2024, 5);
-- EXEC sp_customer_history(1001);
-- SELECT * FROM vw_order_summary   ORDER BY order_date;
-- SELECT * FROM vw_product_performance ORDER BY total_revenue DESC;
-- SELECT * FROM vw_customer_360    ORDER BY lifetime_value DESC;
