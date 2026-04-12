
-- Adding new Schema for Role Management

-- CREATE SCHEMA Admin;



EXEC sys.sp_set_session_context 
    @key   = N'AdminId',
    @value = '';
