-- here below i have written the query to make a function in mysql for my project housing system task =8
DELIMITER $$

CREATE FUNCTION GetApplicationCountByCitizen(cid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM Applications
    WHERE citizen_id = cid;
    RETURN total;
END $$

DELIMITER ;

-- that is the query to call the function
SELECT GetApplicationCountByCitizen(1) AS total_applications;