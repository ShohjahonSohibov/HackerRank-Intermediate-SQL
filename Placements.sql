-- Challenge name: Placements

-- Challenge link: https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true

select 
    s.name
from students s
inner join friends f on s.id = f.id
inner join packages p on f.id = p.id
inner join packages fp on fp.id = f.friend_id
where fp.salary > p.salary
order by fp.salary;


-- Hint: 1. Define friend
--       2. Select student salary
--       3. Select friend salary
--       4. Compare and order