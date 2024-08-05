CREATE TABLE tbl_JQ_Job (
    job_id INT IDENTITY(1,1) PRIMARY KEY,
    job_title VARCHAR(50) NOT NULL,
    job_description NVARCHAR(MAX) NOT NULL,
    salary VARCHAR(50) NULL CHECK (salary IS NULL OR ISJSON(salary) = 1),
    skillset NVARCHAR(MAX) NULL,
    degree VARCHAR(255)  NULL,
    recruiter_email VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    join_date NVARCHAR(50),
    experience INT NULL,
    status VARCHAR(50) NOT NULL,
    location VARCHAR(50),
    job_mode VARCHAR(50),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Recruiter FOREIGN KEY (recruiter_email) REFERENCES tbl_JQ_User(email)
);