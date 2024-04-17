SELECT CONCAT('2021-0', EXTRACT(MONTH FROM date_date), '-01') AS date_month
       ,SUM(ads_margin) AS ads_margin 
       ,ROUND(SUM(average_basket)) AS average_basket
       ,SUM(operational_margin) AS operational_margin
FROM {{ref("finance_campaigns_day")}}
GROUP BY date_month
ORDER BY date_month DESC