IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_JQ_User')
BEGIN
    CREATE TABLE tbl_JQ_User (
    email VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone varchar(14) NULL,
    country VARCHAR(50) NULL,
    state VARCHAR(50) NULL,
    city VARCHAR(50) NULL,
    CONSTRAINT PK_tbl_JQ_User PRIMARY KEY (email)
	);
END
GO

-- Create a unique filtered index on the phone column for non-NULL values
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'UQ_tbl_JQ_User_phone' AND object_id = OBJECT_ID('tbl_JQ_User'))
BEGIN
    CREATE UNIQUE NONCLUSTERED INDEX UQ_tbl_JQ_User_phone ON tbl_JQ_User(phone) WHERE phone IS NOT NULL;
END
GO
