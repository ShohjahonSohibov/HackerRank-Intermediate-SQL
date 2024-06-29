-- Challenge name: Challenge 

-- Challenge link: https://www.hackerrank.com/challenges/sql-projects/problem?isFullScreen=true

select 
    sd.start_date,
    min(ed.end_date)
from (select start_date from projects where start_date not in (select end_date from projects)) sd,
        (select end_date from projects where end_date not in (select start_date from projects)) ed
where sd.start_date < ed.end_date
group by sd.start_date
order by datediff(min(ed.end_date), sd.start_date), sd.start_date;