-- free tables

DROP TABLE IF EXISTS automated_test_logs;
DROP TABLE IF EXISTS users;

-- create tables 

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    is_active BOOLEAN DEFAULT true
);

CREATE TABLE automated_test_logs(
    id SERIAL PRIMARY KEY,
    test_name VARCHAR(100) NOT NULL,
    test_result VARCHAR(100) NOT NULL
);

-- test layer A test update 
INSERT INTO users(username, email, is_active)
VALUES ('cloud_engineer','engineer@example.com',false);

INSERT INTO users(username, email, is_active)
VALUES ('Linux_admin','admin@example.com',true);

---update 
-- we add 'UPDATE_LOGIC_TEST' to test_name to check if updae success or faild 

UPDATE users 
SET is_active = true 
WHERE username = 'cloud_engineer';

INSERT INTO automated_test_logs(test_name,test_result)
SELECT 'UPDATE_LOGIC_TEST', 
CASE WHEN is_active = true THEN 'PASS' ELSE 'FAILD' END
FROM users 
WHERE username = 'cloud_engineer';

--- test layer b for constraint in uniquenes 
-- add duplicate email via exception 
-- test name is 'CONSTRAINT_TEST'
DO $$ 
BEGIN 
INSERT INTO users(username, email, is_active)
VALUES ('cloud_engineer','engineer@example.com',false);

INSERT INTO automated_test_logs(test_name,test_result)
VALUES ('CONSTRAINT_TEST','FAILD');
EXCEPtION WHEN unique_violation THEN
INSERT INTO automated_test_logs(test_name,test_result)
VALUES ('CONSTRAINT_TEST','PASS');
END $$;

-- print the result from automated_test_log 
SELECT * FROM automated_test_log ;
---end testing







