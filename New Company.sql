-- Challenge name: New Company

-- Challenge: https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=true

SELECT 
    c.company_code,
    founder,
    count(distinct lm.lead_manager_code),
    count(distinct sm.senior_manager_code),
    count(distinct m.manager_code),
    count(distinct e.employee_code)
FROM company c
LEFT JOIN lead_manager lm ON lm.company_code = c.company_code
LEFT JOIN senior_manager  sm ON sm.lead_manager_code = lm.lead_manager_code 
LEFT JOIN manager m ON m.senior_manager_code = sm.senior_manager_code
LEFT JOIN employee e ON e.manager_code = m.manager_code
GROUP BY c.company_code , founder
ORDER BY c.company_code asc