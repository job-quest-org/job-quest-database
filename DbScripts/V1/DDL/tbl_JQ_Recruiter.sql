GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_JQ_Recruiter')
BEGIN
    CREATE TABLE tbl_JQ_Recruiter (
    rid BIGINT IDENTITY(1000,1),
    email VARCHAR(50),
    position VARCHAR(50) NULL,
    LinkedInProfile VARCHAR(100) NULL
    CONSTRAINT PK_tbl_JQ_Recruiter PRIMARY KEY (rid),
    CONSTRAINT FK_tbl_JQ_Recruiter FOREIGN KEY (email) REFERENCES tbl_JQ_User(email)
    );
END
GO
