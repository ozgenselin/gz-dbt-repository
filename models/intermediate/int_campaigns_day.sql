-- In order to join the int_campaigns with the finance days, ads information is grouped by day as an intermediate step

SELECT date_date
       ,SUM(ads_cost) AS ads_cost
FROM {{ref("int_campaigns")}}
GROUP BY date_date
ORDER BY date_date DESC
