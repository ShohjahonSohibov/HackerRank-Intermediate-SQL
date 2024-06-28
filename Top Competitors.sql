-- Challenge name: Top Competitors

-- Challenge link: https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true

SELECT 
    h.hacker_id,
    h.name
FROM 
    hackers h
LEFT JOIN 
    submissions s ON h.hacker_id = s.hacker_id
LEFT JOIN 
    challenges ch ON s.challenge_id = ch.challenge_id
LEFT JOIN 
    difficulty d ON ch.difficulty_level = d.difficulty_level
WHERE 
    s.score = d.score
GROUP BY 
    h.hacker_id, h.name
HAVING 
    COUNT(s.hacker_id) > 1
ORDER BY count(s.hacker_id) desc, s.hacker_id asc;
