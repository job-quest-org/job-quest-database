
----------------------------------------

:setvar FilePath "C:/Users/921586/source/repos/job-quest-database/DbScripts/V1/"

-- Execute DDL scripts
:r $(FilePath)/DDL/tbl_JQ_User.sql
:r $(FilePath)/DDL/tbl_JQ_Candidate.sql

-- Execute DML scripts
:r $(FilePath)/DML/tbl_JQ_User.sql
:r $(FilePath)/DML/tbl_JQ_Candidate.sql

-- Execute Stored Procedures
:r $(FilePath)/StoredProcedure/SP_Update_CandidateProfile.sql
:r $(FilePath)/StoredProcedure/SP_UserProfileVerification.sql