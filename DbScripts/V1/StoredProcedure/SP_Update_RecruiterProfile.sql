GO
CREATE OR ALTER PROCEDURE SP_Update_RecruiterProfile
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
            @Position NVARCHAR(50),
            @LinkedInProfile NVARCHAR(100);
    -- Parse JSON payload
    SELECT @Email = JSON_VALUE(@payload, '$.Email'),
           @FirstName = JSON_VALUE(@payload, '$.FirstName'),
           @LastName = JSON_VALUE(@payload, '$.LastName'),
           @Phone = JSON_VALUE(@payload, '$.Phone'),
           @Country = JSON_VALUE(@payload, '$.Country'),
           @State = JSON_VALUE(@payload, '$.State'),
           @City = JSON_VALUE(@payload, '$.City'),
           @Position = JSON_VALUE(@payload, '$.Position'),
           @LinkedInProfile = JSON_VALUE(@payload, '$.LinkedInProfile');
    BEGIN TRY
        BEGIN TRANSACTION;
        -- Update tbl_JQ_User
        UPDATE tbl_JQ_User 
        SET first_name = @FirstName, 
            last_name = @LastName, 
            phone = @Phone, 
            country = @Country, 
            state = @State, 
            city = @City,
            updated_date = GETDATE()
        WHERE email = @Email;
        -- Update tbl_JQ_Recruiter
        UPDATE tbl_JQ_Recruiter 
        SET  
            position = @Position, 
            LinkedInProfile = @LinkedInProfile
        WHERE email = @Email;
        SELECT u.email, u.first_name, u.last_name, u.phone, u.country , u.state, u.city, 
            r.position, r.LinkedInProfile
            FROM tbl_JQ_User u LEFT JOIN tbl_JQ_Recruiter r ON u.email = r.email 
            WHERE u.email = @Email ;
            COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;
        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO