--  Challenge name: Contest Leaderboard

--  Challenge link: https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true

select 
    h.hacker_id, 
    h.name, 
    sum(max_score.sc) as total_score
from hackers h
inner join ( select max(s.score) as sc, s.hacker_id from submissions s group by s.challenge_id, s.hacker_id having sc > 0) as max_score 
        on h.hacker_id = max_score.hacker_id
group by hacker_id, h.name
order by total_score desc, hacker_id asc;
