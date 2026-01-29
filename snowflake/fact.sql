--. FACT TABLE (MAIN ANALYTICS TABLE)

CREATE OR REPLACE TABLE FACT_ORDER_PRODUCTS AS
SELECT
    o.order_id,
    o.user_id,
    o.order_number,
    o.order_dow,
    o.order_hour_of_day,
    o.days_since_prior_order,

    op.product_id,
    p.product_name,

    p.aisle_id,
    a.aisle,

    p.department_id,
    d.department,

    op.add_to_cart_order,
    op.reordered
FROM RAW.ORDER_PRODUCTS_TRAIN op
JOIN CURATED.ORDERS o
    ON op.order_id = o.order_id
JOIN CURATED.DIM_PRODUCTS p
    ON op.product_id = p.product_id
JOIN CURATED.DIM_AISLES a
    ON p.aisle_id = a.aisle_id
JOIN CURATED.DIM_DEPARTMENTS d
    ON p.department_id = d.department_id;


--. ORDERS TABLE (CURATED)
CREATE OR REPLACE TABLE ORDERS AS
SELECT
    order_id,
    user_id,
    eval_set,
    order_number,
    order_dow,
    order_hour_of_day,
    days_since_prior_order
FROM RAW.ORDERS;
