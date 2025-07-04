-- here below is the query to create the stored procedure for tsk =8

use housing_system;

DELIMITER $$

CREATE PROCEDURE AddNewApplication (
    IN in_citizen_id INT,
    IN in_scheme_id INT,
    IN in_application_date DATE,
    IN in_status VARCHAR(20)
)
BEGIN
    INSERT INTO Applications (citizen_id, scheme_id, application_date, status)
    VALUES (in_citizen_id, in_scheme_id, in_application_date, in_status);
END $$

DELIMITER ;


-- that is the query to use the stored procedure.it is easy to use .we dont have to write the whole insert query 

CALL AddNewApplication(1, 1, '2025-06-30', 'Pending');


