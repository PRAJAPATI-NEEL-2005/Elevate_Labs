-- here below i ahve created diffrent views and written query to view the data below for task-7

use housing_system;
CREATE VIEW Citizen_Application_Summary AS
SELECT c.name AS citizen_name, c.income_level, a.application_id, a.status AS application_status, s.name AS scheme_name
FROM Citizens c
JOIN Applications a ON c.citizen_id = a.citizen_id
JOIN Housing_Schemes s ON a.scheme_id = s.scheme_id;

CREATE VIEW Allotment_Details AS
SELECT al.allotment_id, al.allotment_date,
       f.address AS flat_address,
       o.name AS officer_name,
       c.name AS citizen_name,
       s.name AS scheme_name
FROM Allotments al
JOIN Applications a ON al.application_id = a.application_id
JOIN Flats f ON al.flat_id = f.flat_id
JOIN Officers o ON al.officer_id = o.officer_id
JOIN Citizens c ON a.citizen_id = c.citizen_id
JOIN Housing_Schemes s ON f.scheme_id = s.scheme_id;

CREATE VIEW Available_Flats AS
SELECT f.flat_id, f.address, s.name AS scheme_name
FROM Flats f
JOIN Housing_Schemes s ON f.scheme_id = s.scheme_id
WHERE f.status = 'Available';

CREATE VIEW Officer_Allotment_Count AS
SELECT o.officer_id, o.name AS officer_name, COUNT(al.allotment_id) AS total_allotments
FROM Officers o
LEFT JOIN Allotments al ON o.officer_id = al.officer_id
GROUP BY o.officer_id, o.name;

SELECT * FROM Citizen_Application_Summary
WHERE income_level = 'Low';

SELECT * FROM Allotment_Details
ORDER BY allotment_date DESC
LIMIT 2;

SELECT * FROM Available_Flats;

SELECT * FROM Officer_Allotment_Count
WHERE total_allotments > 0;