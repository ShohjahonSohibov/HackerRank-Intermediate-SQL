-- Challenge name: Ollivander's Inventory

-- Challenge link: https://www.hackerrank.com/challenges/harry-potter-and-wands/problem

SELECT 
    w.id,
    wp.age,
    w.coins_needed,
    w.power
FROM wands w
JOIN wands_property wp ON w.code = wp.code
JOIN (
    SELECT 
        w.code, 
        w.power, 
        MIN(w.coins_needed) AS min_coins_needed
    FROM wands w
    JOIN wands_property wp ON w.code = wp.code
    WHERE wp.is_evil = 0
    GROUP BY code, power
) AS min_wands ON w.code = min_wands.code 
              AND w.power = min_wands.power 
              AND w.coins_needed = min_wands.min_coins_needed
WHERE wp.is_evil = 0
ORDER BY w.power DESC, wp.age DESC;


-- Hint: 