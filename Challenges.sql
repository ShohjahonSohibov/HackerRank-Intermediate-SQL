-- Challenge name: Challenges

-- Challenges link: https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true

WITH num_challenges AS (
    SELECT
        h.hacker_id,
        h.name,
        COUNT(c.challenge_id) AS num_challenges
    FROM hackers h
    JOIN challenges c ON c.hacker_id = h.hacker_id
    GROUP BY h.hacker_id, h.name
),
count_challenges AS (
    SELECT
        num_challenges,
        COUNT(num_challenges) AS count_challenges
    FROM num_challenges
    GROUP BY num_challenges
)
SELECT 
    nc.hacker_id,
    nc.name,
    nc.num_challenges
FROM num_challenges nc
JOIN count_challenges cc ON cc.num_challenges = nc.num_challenges
WHERE cc.count_challenges <= 1 
   OR nc.num_challenges = (SELECT MAX(num_challenges) FROM num_challenges)
ORDER BY nc.num_challenges DESC, nc.hacker_id;
