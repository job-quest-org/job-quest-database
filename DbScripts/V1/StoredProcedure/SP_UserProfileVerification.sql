GO
CREATE OR ALTER PROCEDURE SP_UserProfileVerification
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Email VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM tbl_JQ_User WHERE email = @Email)
    BEGIN
        INSERT INTO tbl_JQ_User (email, first_name, last_name)
        VALUES (@Email, @FirstName, @LastName);
        IF NOT EXISTS (SELECT 1 FROM tbl_JQ_Candidate WHERE email = @Email)
        BEGIN
            INSERT INTO tbl_JQ_Candidate (email)
            VALUES (@Email);
        END
        IF NOT EXISTS (SELECT 1 FROM tbl_JQ_Recruiter WHERE email = @Email)
        BEGIN
            INSERT INTO tbl_JQ_Recruiter (email)
            VALUES (@Email);
        END
    END
END
GO