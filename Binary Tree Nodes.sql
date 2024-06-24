// Binary Tree Nodes

// Link to challenge: https://www.hackerrank.com/challenges/binary-search-tree-1/problem?isFullScreen=true


SELECT  b.n,  
    CASE 
        WHEN b.p IS NOT NULL THEN
            CASE     
                    WHEN (SELECT count(*) from bst where p = b.n) = 0
                    THEN 'Leaf'
                    ELSE 'Inner'
            END
        ELSE 
            'Root'
    END
FROM bst b
ORDER BY b.n

