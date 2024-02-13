IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_JQ_Candidate')
BEGIN
    CREATE TABLE tbl_JQ_Candidate (
    id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15) NULL,
    degree VARCHAR(50),
    location VARCHAR(100),
    experience INT,
    department VARCHAR(50),
    skillset VARCHAR(255),
    cv_doc VARCHAR(255) NULL
    );
END
GO