# al empujarse se creará una nueva tabla en bq

CREATE OR REPLACE TABLE mapfre_google_ads_data.tablanueva
PARTITION BY Date
OPTIONS (
  partition_expiration_days=365,
  description="query de ejemplo enviada desde github"
  ) AS 


SELECT
  DISTINCT(Date) AS date, SUM(Cost) AS cost, SUM(Conversions) AS conv, Device
FROM
  `vaulted-cove-251722.mapfre_google_ads_data.p_AccountBasicStats_5692391828`
WHERE
  DATE(_PARTITIONTIME) BETWEEN "2019-09-05" AND "2019-10-06"
GROUP BY
    Device, Date
