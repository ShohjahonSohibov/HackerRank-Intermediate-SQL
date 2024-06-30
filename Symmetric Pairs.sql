-- Challenge name: Symmetric Pairs

-- Challenge link: https://www.hackerrank.com/challenges/symmetric-pairs/problem

WITH pairs AS (
    SELECT ROW_NUMBER() OVER (ORDER BY x) AS id, x, y
    FROM functions
)
SELECT DISTINCT cl.x, cl.y
FROM pairs cl, pairs c2
WHERE cl.x = c2.y
AND cl.y = c2.x 
AND cl.x <= cl.y
AND cl.id != c2.id
ORDER BY 1, 2;


-- Hint:   1. x = y and y = x
        -- 2. x < y ( X1 ≤ Y1 said in challenge)
        -- 3. x.id != y.id to get right behaviour