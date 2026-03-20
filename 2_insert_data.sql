INSERT INTO customers(name,email,phone,address,created_at) VALUES
('Rahul Sharma','rahul@gmail.com','9000000001','Hyderabad',TIMESTAMP '2025-01-01 09:00:00');

INSERT INTO customers(name,email,phone,address,created_at) VALUES
('Priya Reddy','priya@gmail.com','9000000002','Hyderabad',TIMESTAMP '2025-01-05 10:00:00');

INSERT INTO customers(name,email,phone,address,created_at) VALUES
('Amit Verma','amit@gmail.com','9000000003','Bangalore',TIMESTAMP '2025-01-10 11:00:00');

INSERT INTO customers(name,email,phone,address,created_at) VALUES
('Sneha Kapoor','sneha@gmail.com','9000000004','Delhi',TIMESTAMP '2025-01-15 12:00:00');

INSERT INTO customers(name,email,phone,address,created_at) VALUES
('Kiran Kumar','kiran@gmail.com','9000000005','Chennai',TIMESTAMP '2025-01-20 13:00:00');

INSERT INTO customers(name,email,phone,address,created_at) VALUES
('Anjali Mehta','anjali@gmail.com','9000000006','Mumbai',TIMESTAMP '2025-02-01 09:15:00');

INSERT INTO customers(name,email,phone,address,created_at) VALUES
('Rohit Singh','rohit@gmail.com','9000000007','Pune',TIMESTAMP '2025-02-05 10:30:00');

INSERT INTO customers(name,email,phone,address,created_at) VALUES
('Neha Gupta','neha@gmail.com','9000000008','Kolkata',TIMESTAMP '2025-02-10 11:45:00');

INSERT INTO customers(name,email,phone,address,created_at) VALUES
('Arjun Nair','arjun@gmail.com','9000000009','Kerala',TIMESTAMP '2025-02-15 13:00:00');

INSERT INTO customers(name,email,phone,address,created_at) VALUES
('Pooja Das','pooja@gmail.com','9000000010','Vizag',TIMESTAMP '2025-02-20 14:30:00');




INSERT INTO accounts(customer_id,account_type,balance,status,created_at) VALUES
(1,'Savings',80000,'ACTIVE',TIMESTAMP '2025-03-01 09:00:00');

INSERT INTO accounts(customer_id,account_type,balance,status,created_at) VALUES
(2,'Savings',50000,'ACTIVE',TIMESTAMP '2025-03-03 10:15:00');

INSERT INTO accounts(customer_id,account_type,balance,status,created_at) VALUES
(3,'Current',200000,'ACTIVE',TIMESTAMP '2025-03-05 11:30:00');

INSERT INTO accounts(customer_id,account_type,balance,status,created_at) VALUES
(4,'Savings',30000,'INACTIVE',TIMESTAMP '2025-03-07 12:45:00');

INSERT INTO accounts(customer_id,account_type,balance,status,created_at) VALUES
(5,'Commercial',500000,'ACTIVE',TIMESTAMP '2025-03-10 14:00:00');

INSERT INTO accounts(customer_id,account_type,balance,status,created_at) VALUES
(6,'Savings',70000,'ACTIVE',TIMESTAMP '2025-03-12 09:20:00');

INSERT INTO accounts(customer_id,account_type,balance,status,created_at) VALUES
(7,'Current',150000,'ACTIVE',TIMESTAMP '2025-03-15 10:40:00');

INSERT INTO accounts(customer_id,account_type,balance,status,created_at) VALUES
(8,'Savings',40000,'CLOSED',TIMESTAMP '2025-03-18 11:55:00');

INSERT INTO accounts(customer_id,account_type,balance,status,created_at) VALUES
(9,'Commercial',600000,'ACTIVE',TIMESTAMP '2025-03-20 13:10:00');

INSERT INTO accounts(customer_id,account_type,balance,status,created_at) VALUES
(10,'Savings',25000,'ACTIVE',TIMESTAMP '2025-03-22 15:30:00');





INSERT INTO transactions(account_id,transaction_type,amount,description,transaction_date) VALUES
(1,'Deposit',60000,'Salary - TCS',TIMESTAMP '2025-04-01 09:00:00');

INSERT INTO transactions(account_id,transaction_type,amount,description,transaction_date) VALUES
(2,'Deposit',40000,'Freelance Payment',TIMESTAMP '2025-04-02 11:00:00');

INSERT INTO transactions(account_id,transaction_type,amount,description,transaction_date) VALUES
(3,'Deposit',120000,'Business Revenue',TIMESTAMP '2025-04-03 10:30:00');

INSERT INTO transactions(account_id,transaction_type,amount,description,transaction_date) VALUES
(4,'Withdrawal',5000,'ATM Withdrawal',TIMESTAMP '2025-04-04 18:20:00');

INSERT INTO transactions(account_id,transaction_type,amount,description,transaction_date) VALUES
(5,'Withdrawal',20000,'Office Expense',TIMESTAMP '2025-04-05 14:10:00');

INSERT INTO transactions(account_id,transaction_type,amount,description,transaction_date) VALUES
(6,'Deposit',30000,'Salary - Infosys',TIMESTAMP '2025-04-06 09:05:00');

INSERT INTO transactions(account_id,transaction_type,amount,description,transaction_date) VALUES
(7,'Transfer',10000,'UPI Transfer',TIMESTAMP '2025-04-07 20:15:00');

INSERT INTO transactions(account_id,transaction_type,amount,description,transaction_date) VALUES
(8,'Withdrawal',7000,'Shopping',TIMESTAMP '2025-04-08 16:25:00');

INSERT INTO transactions(account_id,transaction_type,amount,description,transaction_date) VALUES
(9,'Deposit',100000,'Client Payment',TIMESTAMP '2025-04-09 12:00:00');

INSERT INTO transactions(account_id,transaction_type,amount,description,transaction_date) VALUES
(10,'Withdrawal',3000,'Electricity Bill',TIMESTAMP '2025-04-10 08:45:00');





INSERT INTO loans(customer_id,loan_type,loan_amount,interest_rate,emi_amount,remaining_amount,payment_type,loan_status,loan_date) VALUES
(1,'Home Loan',1500000,7.5,15000,1500000,'MONTHLY','ACTIVE',TIMESTAMP '2024-01-01 10:00:00');

INSERT INTO loans(customer_id,loan_type,loan_amount,interest_rate,emi_amount,remaining_amount,payment_type,loan_status,loan_date) VALUES
(2,'Car Loan',500000,8.5,10000,500000,'QUARTERLY','ACTIVE',TIMESTAMP '2024-02-01 11:15:00');

INSERT INTO loans(customer_id,loan_type,loan_amount,interest_rate,emi_amount,remaining_amount,payment_type,loan_status,loan_date) VALUES
(3,'Business Loan',1000000,9.0,20000,1000000,'YEARLY','ACTIVE',TIMESTAMP '2024-03-01 12:30:00');

INSERT INTO loans(customer_id,loan_type,loan_amount,interest_rate,emi_amount,remaining_amount,payment_type,loan_status,loan_date) VALUES
(4,'Personal Loan',200000,11.5,8000,200000,'MONTHLY','ACTIVE',TIMESTAMP '2024-04-01 13:45:00');

INSERT INTO loans(customer_id,loan_type,loan_amount,interest_rate,emi_amount,remaining_amount,payment_type,loan_status,loan_date) VALUES
(5,'Commercial Loan',1800000,10.0,25000,1800000,'MONTHLY','ACTIVE',TIMESTAMP '2024-05-01 09:20:00');

INSERT INTO loans(customer_id,loan_type,loan_amount,interest_rate,emi_amount,remaining_amount,payment_type,loan_status,loan_date) VALUES
(6,'Education Loan',600000,7.0,9000,600000,'MONTHLY','ACTIVE',TIMESTAMP '2024-06-01 10:10:00');

INSERT INTO loans(customer_id,loan_type,loan_amount,interest_rate,emi_amount,remaining_amount,payment_type,loan_status,loan_date) VALUES
(7,'Car Loan',700000,8.0,11000,700000,'QUARTERLY','ACTIVE',TIMESTAMP '2024-07-01 11:25:00');

INSERT INTO loans(customer_id,loan_type,loan_amount,interest_rate,emi_amount,remaining_amount,payment_type,loan_status,loan_date) VALUES
(8,'Personal Loan',300000,12.0,10000,300000,'MONTHLY','ACTIVE',TIMESTAMP '2024-08-01 14:00:00');

INSERT INTO loans(customer_id,loan_type,loan_amount,interest_rate,emi_amount,remaining_amount,payment_type,loan_status,loan_date) VALUES
(9,'Business Loan',1200000,9.5,21000,1200000,'YEARLY','ACTIVE',TIMESTAMP '2024-09-01 15:30:00');

INSERT INTO loans(customer_id,loan_type,loan_amount,interest_rate,emi_amount,remaining_amount,payment_type,loan_status,loan_date) VALUES
(10,'Gold Loan',200000,10.5,7000,200000,'MONTHLY','ACTIVE',TIMESTAMP '2024-10-01 16:45:00');
