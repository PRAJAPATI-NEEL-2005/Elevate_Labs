-- here below is my task 3 executed sql commands .

use housing_system;
SELECT * FROM Citizens;

SELECT name, income_level FROM Citizens;

SELECT * FROM Citizens
WHERE income_level = 'Low';

SELECT * FROM Citizens
WHERE income_level = 'Low' OR name LIKE 'A%';

SELECT * FROM Flats
WHERE status = 'Available';

SELECT * FROM Applications
WHERE application_date > '2025-06-22';

SELECT * FROM Applications
WHERE status = 'Pending';

SELECT * FROM Housing_Schemes
WHERE department_id = 1;

SELECT * FROM Flats
WHERE scheme_id = 1
ORDER BY flat_id DESC;

SELECT * FROM Allotments
ORDER BY allotment_date DESC
LIMIT 2;

SELECT * FROM Citizens
WHERE name LIKE '%a%';

SELECT * FROM Applications
WHERE application_date BETWEEN '2025-06-22' AND '2025-06-24';


SELECT c.name, a.status, a.application_date
FROM Citizens c
JOIN Applications a ON c.citizen_id = a.citizen_id;

SELECT f.address, hs.name AS scheme_name
FROM Flats f
JOIN Housing_Schemes hs ON f.scheme_id = hs.scheme_id;
