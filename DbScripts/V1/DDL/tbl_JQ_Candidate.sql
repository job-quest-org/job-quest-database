IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_JQ_Candidate')
BEGIN
    CREATE TABLE tbl_JQ_Candidate (
    email VARCHAR(50),
    degree VARCHAR(50) NULL,
    location VARCHAR(50) NULL,
    experience INT NULL,
    department VARCHAR(50) NULL,
    skillset VARCHAR(255) NULL,
    cv_doc VARCHAR(255) NULL,
    CONSTRAINT PK_tbl_JQ_Candidate PRIMARY KEY (email),
    CONSTRAINT FK_tbl_JQ_Candidate FOREIGN KEY (email) REFERENCES tbl_JQ_User(email)
    );
END
GO
