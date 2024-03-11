-- Question link: https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=true

SELECT 
    city,
    length
FROM (
        SELECT 
            city,
            LENGTH(city) AS length,
            ROW_NUMBER() OVER(ORDER BY LENGTH(city), city ASC) AS first,
            ROW_NUMBER() OVER(ORDER BY LENGTH(city) DESC, city ASC) AS last
        FROM station
    ) AS result   
WHERE first = 1 OR last = 1
ORDER BY city;