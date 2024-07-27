CREATE OR ALTER PROCEDURE SP_Update_CandidateProfile
    @payload NVARCHAR(MAX)
AS
BEGIN 
    DECLARE @Email NVARCHAR(50),
            @FirstName NVARCHAR(50),
            @LastName NVARCHAR(50),
            @Phone NVARCHAR(14),
            @Country NVARCHAR(50),
            @State NVARCHAR(50),
            @City NVARCHAR(50),
            @Degree NVARCHAR(50),
            @Location NVARCHAR(50),
            @Experience INT,
            @Department NVARCHAR(50),
            @Skillset NVARCHAR(255), 
            @CvDoc NVARCHAR(255);

    -- Parse JSON payload
    SELECT @Email = JSON_VALUE(@payload, '$.email'),
           @FirstName = JSON_VALUE(@payload, '$.firstName'),
           @LastName = JSON_VALUE(@payload, '$.lastName'),
           @Phone = JSON_VALUE(@payload, '$.phone'),
           @Country = JSON_VALUE(@payload, '$.country'),
           @State = JSON_VALUE(@payload, '$.state'),
           @City = JSON_VALUE(@payload, '$.city'),
           @Degree = JSON_VALUE(@payload, '$.degree'),
           @Location = JSON_VALUE(@payload, '$.location'),
           @Experience = JSON_VALUE(@payload, '$.experience'),
           @Department = JSON_VALUE(@payload, '$.department'),
           @Skillset = JSON_VALUE(@payload, '$.skillset'),
           @CvDoc = JSON_VALUE(@payload, '$.cvDoc');
	PRINT(@Email)
    -- Update tbl_JQ_User
    UPDATE tbl_JQ_User 
    SET first_name = @FirstName, 
        last_name = @LastName, 
        phone = @Phone, 
        country = @Country, 
        state = @State, 
        city = @City
    WHERE email = @Email;

    -- Update tbl_JQ_Candidate
    UPDATE tbl_JQ_Candidate 
    SET  
        degree = @Degree, 
        location = @Location, 
        experience = @Experience, 
        department = @Department, 
        skillset = @Skillset, 
        cv_doc = @CvDoc
    WHERE email = @Email;
	SELECT u.email, u.first_name, u.last_name, u.phone, u.country , u.state, u.city, 
		c.degree, c.location, c.experience, c.department, c.skillset, c.cv_doc 
		FROM tbl_JQ_User u LEFT JOIN tbl_JQ_Candidate c ON u.email = c.email 
		WHERE u.email = @Email ;
END
GO