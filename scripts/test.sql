CREATE TABLE automated_test_logs (
    id SERIAL PRIMARY KEY,
    test_name VARCHAR(100) NOT NULL,
    execution_status VARCHAR(20) NOT NULL,
    runtime_stamp TIMESTAMP DEFAULT NOW()
);

INSERT INTO automated_test_logs (test_name, execution_status) 
VALUES ('GitHub Actions Container Bridge Connection', 'SUCCESS');

INSERT INTO automated_test_logs (test_name, execution_status) 
VALUES ('Database Query Execution Logic', 'SUCCESS');

INSERT INTO automated_test_logs (test_name, execution_status) 
VALUES ('my_test', 'FAILD');

-- 3. Query back a specific cell to print to the runner logs (Receive Data)
SELECT test_name, execution_status FROM automated_test_logs;