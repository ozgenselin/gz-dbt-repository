-- {{config(materialized= 'table')}}
-- The query above materializes the view as a table
-- commented it as we added a configuration in dbt_project.yml to make any query in the mart folder will be materialised as a table

SELECT date_date
      ,COUNT(orders_id) AS nb_transactions
      ,ROUND(SUM(revenue),0) AS revenue
      ,ROUND(AVG(revenue),1) AS average_basket
      ,ROUND(SUM(margin),1) AS margin
      ,ROUND(SUM(operational_margin),0) AS operational_margin
FROM {{ref("int_orders_operational")}}
GROUP BY date_date
ORDER BY date_date DESC