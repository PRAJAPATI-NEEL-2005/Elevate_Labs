-- here below i have written having,group by and aggregate function command for task 4
use housing_system;
SELECT COUNT(*) AS total_citizens
FROM Citizens;

SELECT status, COUNT(*) AS total_applications
FROM Applications
GROUP BY status;

SELECT s.name AS scheme_name, COUNT(a.application_id) AS application_count
FROM Housing_Schemes s
JOIN Applications a ON s.scheme_id = a.scheme_id
GROUP BY s.name;

SELECT hs.name AS scheme_name, COUNT(f.flat_id) AS total_flats
FROM Housing_Schemes hs
JOIN Flats f ON hs.scheme_id = f.scheme_id
GROUP BY hs.name;

SELECT status, COUNT(*) AS flat_count
FROM Flats
GROUP BY status;

SELECT AVG(app_count) AS avg_apps_per_citizen
FROM (
  SELECT citizen_id, COUNT(*) AS app_count
  FROM Applications
  GROUP BY citizen_id
) AS sub;

SELECT d.name AS department_name, COUNT(hs.scheme_id) AS scheme_count
FROM Departments d
JOIN Housing_Schemes hs ON d.department_id = hs.department_id
GROUP BY d.name
HAVING COUNT(hs.scheme_id) > 1;

SELECT o.name AS officer_name, COUNT(a.allotment_id) AS total_allotments
FROM Officers o
LEFT JOIN Allotments a ON o.officer_id = a.officer_id
GROUP BY o.name;

SELECT c.income_level, COUNT(a.application_id) AS application_count
FROM Citizens c
JOIN Applications a ON c.citizen_id = a.citizen_id
GROUP BY c.income_level;

SELECT citizen_id, COUNT(*) AS application_count
FROM Applications
GROUP BY citizen_id
HAVING COUNT(*) > 1;
