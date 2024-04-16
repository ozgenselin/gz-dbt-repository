-- Operational margin = margin + shipping fee - log_cost - ship_cost

SELECT order_margin.orders_id
       ,order_margin.date_date
       ,ROUND(order_margin.margin + ship.shipping_fee - CAST(ship.ship_cost AS FLOAT64), 2) AS operational_margin
       ,order_margin.quantity
       ,order_margin.revenue
       ,order_margin.purchase_cost
       ,order_margin.margin
       ,ship.shipping_fee
       ,ship.logcost
       ,ship.ship_cost
FROM {{ref("int_orders_margin")}} AS order_margin
LEFT JOIN {{ref("stg_raw__ship")}} AS ship
ON order_margin.orders_id = ship.orders_id
ORDER BY orders_id DESC