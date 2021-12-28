SELECT
  time_index AS "time",
  pt AS "Total Power consumed",
  wp AS "Water pulse counter",
  wa AS "Water avg. Rate",
  wi AS "Water instantaneous Rate",
  gp AS "Gas pulse counter",
  ga AS "Gas avg. Rate",
  gi AS "Gas instantaneous Rate"
FROM mtopeniot.etsensoren
WHERE
  $__timeFilter(time_index)
ORDER BY time_index desc

SELECT
  $__timeGroupAlias(time_index,15m),
  avg(cast(wa as float)) AS "Water average Rate"
FROM mtopeniot.etsensoren
WHERE
  $__timeFilter(time_index)
GROUP BY 1
ORDER BY 1