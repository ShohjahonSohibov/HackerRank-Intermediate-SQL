-- Challenge name: the Report

-- Challenge link: https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true


SELECT 
    CASE
        WHEN g.grade >= 8 THEN s.name ELSE NULL
    END student_name, 
    g.grade, 
    s.marks
FROM 
    students s, 
    grades g
WHERE 
    s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY 
    g.grade DESC, 
    s.name;
