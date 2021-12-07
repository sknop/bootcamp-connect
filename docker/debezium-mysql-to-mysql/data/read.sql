-- Create the test database
CREATE DATABASE testDB;
GO
USE testDB;
EXEC sys.sp_cdc_enable_db;

SELECT * FROM customers;
GO
