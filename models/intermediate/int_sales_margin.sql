-- This query calculates the margin 
-- margin = revenue - purchase_cost
-- purchase_cost - quantity * purchase_price

SELECT products_id
       ,date_date
       ,orders_id
       ,revenue
       ,quantity
       ,CAST(purchase_price AS FLOAT64) AS purchase_price
       ,ROUND(sales.quantity*CAST(products.purchase_price AS FLOAT64),2) AS purchase_cost
       ,ROUND(sales.revenue - sales.quantity*CAST(products.purchase_price AS FLOAT64), 2) AS margin
FROM {{ref("stg_raw__sales")}} sales
LEFT JOIN {{ref("stg_raw__products")}} products
    USING (products_id)

