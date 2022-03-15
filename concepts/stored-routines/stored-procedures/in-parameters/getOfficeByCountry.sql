DELIMITER //
CREATE PROCEDURE getOfficeByCountry(
        IN countryName VARCHAR(255)
)
BEGIN
        SELECT * FROM offices WHERE country = countryName;
END //
DELIMITER ;
CALL getOfficeByCountry('UK');
CALL getOfficeByCountry('USA');
CALL getOfficeByCountry();

