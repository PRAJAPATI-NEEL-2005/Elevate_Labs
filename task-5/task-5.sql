-- here below i have written queries to perform join oprations for my sql developer task-5

use housing_system;
SELECT c.name AS citizen_name, a.application_id, a.status
FROM Citizens c
INNER JOIN Applications a ON c.citizen_id = a.citizen_id;

SELECT c.name AS citizen_name, a.application_id, a.status
FROM Citizens c
LEFT JOIN Applications a ON c.citizen_id = a.citizen_id;

-- 3. RIGHT JOIN: All Applications and the Citizens who made them
-- Note: RIGHT JOIN is supported only in MySQL (not SQLite)
SELECT c.name AS citizen_name, a.application_id, a.status
FROM Citizens c
RIGHT JOIN Applications a ON c.citizen_id = a.citizen_id;


SELECT c.name AS citizen_name, a.application_id, a.status
FROM Citizens c
LEFT JOIN Applications a ON c.citizen_id = a.citizen_id
UNION
SELECT c.name AS citizen_name, a.application_id, a.status
FROM Citizens c
RIGHT JOIN Applications a ON c.citizen_id = a.citizen_id;

SELECT a.application_id, s.name AS scheme_name, a.status
FROM Applications a
JOIN Housing_Schemes s ON a.scheme_id = s.scheme_id;

SELECT o.name AS officer_name, al.allotment_id, al.allotment_date
FROM Officers o
LEFT JOIN Allotments al ON o.officer_id = al.officer_id;

SELECT f.flat_id, f.address, hs.name AS scheme_name
FROM Flats f
JOIN Housing_Schemes hs ON f.scheme_id = hs.scheme_id;

SELECT c.name AS citizen_name, s.name AS scheme_name, a.status
FROM Citizens c
JOIN Applications a ON c.citizen_id = a.citizen_id
JOIN Housing_Schemes s ON a.scheme_id = s.scheme_id;


SELECT al.allotment_id, c.name AS citizen_name, al.allotment_date
FROM Allotments al
JOIN Applications a ON al.application_id = a.application_id
JOIN Citizens c ON a.citizen_id = c.citizen_id;

SELECT f.address, al.allotment_id, al.allotment_date
FROM Flats f
JOIN Allotments al ON f.flat_id = al.flat_id;
