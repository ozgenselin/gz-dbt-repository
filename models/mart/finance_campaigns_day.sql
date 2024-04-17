-- In order to join the int_campaigns with the finance days, I need to group ads information by date, which was done in int_campaigns_day



SELECT daily_campaign.date_date 
       ,(daily_finance.operational_margin - daily_campaign.ads_cost) AS ads_margin
       ,daily_finance.average_basket
       ,daily_finance.operational_margin
FROM {{ref("int_campaigns_day")}} AS daily_campaign
LEFT JOIN {{ref("finance_days")}} AS daily_finance
    ON (daily_campaign.date_date = daily_finance.date_date)
ORDER BY date_date DESC