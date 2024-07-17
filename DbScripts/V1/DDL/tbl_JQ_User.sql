IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_JQ_User')
BEGIN
    CREATE TABLE tbl_JQ_User (
    email VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(15) NULL,
    CONSTRAINT PK_tbl_JQ_Candidate PRIMARY KEY (email)
	);
END
GO

-- Create a unique filtered index on the phone column for non-NULL values
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'UQ_tbl_JQ_User_phone' AND object_id = OBJECT_ID('tbl_JQ_User'))
BEGIN
    CREATE UNIQUE NONCLUSTERED INDEX UQ_tbl_JQ_User_phone ON tbl_JQ_User(phone) WHERE phone IS NOT NULL;
END
GO

INSERT INTO tbl_JQ_User (email, first_name, last_name, phone) VALUES ('john.doe@example.com', 'John', 'Doe', '123-456-7890');
INSERT INTO tbl_JQ_User (email, first_name, last_name, phone) VALUES ('jane.smith@example.com', 'Jane', 'Smith', '234-567-8901');
INSERT INTO tbl_JQ_User (email, first_name, last_name, phone) VALUES ('michael.brown@example.com', 'Michael', 'Brown', '345-678-9012');
INSERT INTO tbl_JQ_User (email, first_name, last_name, phone) VALUES ('emily.jones@example.com', 'Emily', 'Jones', '456-789-0123');
INSERT INTO tbl_JQ_User (email, first_name, last_name, phone) VALUES ('david.wilson@example.com', 'David', 'Wilson', '567-890-1234');
INSERT INTO tbl_JQ_User (email, first_name, last_name, phone) VALUES ('sarah.moore@example.com', 'Sarah', 'Moore', '678-901-2345');
INSERT INTO tbl_JQ_User (email, first_name, last_name, phone) VALUES ('james.taylor@example.com', 'James', 'Taylor', '789-012-3456');
INSERT INTO tbl_JQ_User (email, first_name, last_name, phone) VALUES ('linda.white@example.com', 'Linda', 'White', '890-123-4567');
INSERT INTO tbl_JQ_User (email, first_name, last_name, phone) VALUES ('robert.harris@example.com', 'Robert', 'Harris', '901-234-5678');
INSERT INTO tbl_JQ_User (email, first_name, last_name, phone) VALUES ('patricia.clark@example.com', 'Patricia', 'Clark', '012-345-6789');
