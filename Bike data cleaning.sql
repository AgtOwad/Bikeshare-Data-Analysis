SELECT
 rideable_type,
 member_casual,
 COUNT(*) as num_of_rides,
 FORMAT_DATE('%A', started_at) as day_of_week,
  ROUND(
    SUM(TIMESTAMP_DIFF(ended_at,started_at,minute))/ COUNT(*),2)
     as Avg_min_per_rides
FROM 
  world.202106-divvy-tripdata
GROUP BY
  rideable_type,
  member_casual,
  day_of_week
ORDER BY
  num_of_rides DESC
