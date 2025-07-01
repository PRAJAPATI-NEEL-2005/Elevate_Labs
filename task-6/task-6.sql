-- here below i have written task 6 queries for my housing system database


use housing_system;
SELECT name
FROM Citizens
WHERE citizen_id = (
  SELECT citizen_id
  FROM Applications
  ORDER BY application_date DESC
  LIMIT 1
);

SELECT name,
  (SELECT COUNT(*) FROM Applications WHERE citizen_id = Citizens.citizen_id) AS total_applications
FROM Citizens;

SELECT name
FROM Citizens
WHERE citizen_id IN (
  SELECT DISTINCT citizen_id
  FROM Applications
);

SELECT name
FROM Citizens
WHERE citizen_id NOT IN (
  SELECT DISTINCT citizen_id
  FROM Applications
);

SELECT * FROM Allotments
WHERE allotment_date > (
  SELECT AVG(DATE(allotment_date))
  FROM Allotments
);

SELECT name
FROM Citizens c
WHERE (
  SELECT COUNT(*) FROM Applications a WHERE a.citizen_id = c.citizen_id
) > 1;

SELECT scheme_name, application_count
FROM (
  SELECT s.name AS scheme_name, COUNT(a.application_id) AS application_count
  FROM Housing_Schemes s
  JOIN Applications a ON s.scheme_id = a.scheme_id
  GROUP BY s.name
  ORDER BY application_count DESC
  LIMIT 3
) AS top_schemes;

SELECT name
FROM Citizens c
WHERE EXISTS (
  SELECT 1 FROM Applications a
  JOIN Allotments al ON a.application_id = al.application_id
  WHERE a.citizen_id = c.citizen_id
);

-- 9. Nested Subqueries: Officer who handled the most allotments
SELECT name
FROM Officers
WHERE officer_id = (
  SELECT officer_id
  FROM Allotments
  GROUP BY officer_id
  ORDER BY COUNT(*) DESC
  LIMIT 1
);

SELECT f.*
FROM Flats f
WHERE f.scheme_id IN (
  SELECT scheme_id
  FROM (
    SELECT scheme_id, COUNT(*) AS flat_count
    FROM Flats
    GROUP BY scheme_id
    HAVING flat_count < (
      SELECT AVG(flat_total) FROM (
        SELECT COUNT(*) AS flat_total FROM Flats GROUP BY scheme_id
      ) AS avg_data
    )
  ) AS under_avg_schemes
);
