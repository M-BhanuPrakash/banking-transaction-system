

01) How can we retrieve all customer details from the system?

SELECT * FROM customers;

02) How can we view all account records in the bank?

SELECT * FROM accounts;

03) How do we find only active accounts currently in use?

SELECT * FROM accounts
WHERE status = 'ACTIVE';

04) How can we list all transactions performed in the system?

SELECT * FROM transactions;

05) How do we retrieve all loan records?

SELECT * FROM loans;

06) How can we view each customer along with their account type and balance?

SELECT c.name, a.account_type, a.balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id;

07) How can we see which customers have taken loans and their loan details?

SELECT c.name, l.loan_type, l.loan_amount
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id;

08) How do we track transactions linked to each account?

SELECT a.account_id, t.transaction_type, t.amount
FROM accounts a
JOIN transactions t ON a.account_id = t.account_id;

09) What is the total balance held by each customer across their accounts?

SELECT customer_id, SUM(balance) total_balance
FROM accounts
GROUP BY customer_id;

10) How many transactions has each account performed?

SELECT account_id, COUNT(*) total_txn
FROM transactions
GROUP BY account_id;

11) What is the total loan amount taken by each customer?

SELECT customer_id, SUM(loan_amount) total_loan
FROM loans
GROUP BY customer_id;

12) Which accounts have high balances (above ₹1 lakh)?

SELECT * FROM accounts
WHERE balance > 100000;

13) Which transactions are high-value (above ₹50,000)?

SELECT * FROM transactions
WHERE amount > 50000;

14) Which loans are currently active?

SELECT * FROM loans
WHERE loan_status = 'ACTIVE';

15) Which accounts are closed and no longer operational?

SELECT * FROM accounts
WHERE status = 'CLOSED';

16) Which accounts have a balance greater than the average balance?

SELECT * FROM accounts
WHERE balance > (SELECT AVG(balance) FROM accounts);

17) Which loan has the highest amount in the system?

SELECT * FROM loans
WHERE loan_amount = (SELECT MAX(loan_amount) FROM loans);

18) Who are the top 5 accounts with the highest balances?

SELECT *
FROM (
SELECT account_id, balance
FROM accounts
ORDER BY balance DESC
)
WHERE ROWNUM <= 5;

19) What are the most recent transactions performed?

SELECT *
FROM transactions
ORDER BY transaction_date DESC;

20) How many transactions occur each month?

SELECT EXTRACT(MONTH FROM transaction_date) month, COUNT(*)
FROM transactions
GROUP BY EXTRACT(MONTH FROM transaction_date);

21) How many loans are issued per year?

SELECT EXTRACT(YEAR FROM loan_date) year, COUNT(*)
FROM loans
GROUP BY EXTRACT(YEAR FROM loan_date);

22) How does the transaction amount accumulate over time for each account?

SELECT account_id, transaction_date, amount,
SUM(amount) OVER (PARTITION BY account_id ORDER BY transaction_date) running_total
FROM transactions;

23) How can we rank accounts based on their balances?

SELECT account_id, balance,
RANK() OVER (ORDER BY balance DESC) rank
FROM accounts;

24) What is the total amount of deposits vs withdrawals in the system?

SELECT transaction_type, SUM(amount)
FROM transactions
GROUP BY transaction_type;

25) Which customers have taken loans?

SELECT DISTINCT c.name
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id;

26) Which customers have not taken any loans?

SELECT c.name
FROM customers c
LEFT JOIN loans l ON c.customer_id = l.customer_id
WHERE l.loan_id IS NULL;


27) What is the total financial position of each customer (balance + loans)?

SELECT c.name,
NVL(SUM(a.balance),0) total_balance,
NVL(SUM(l.loan_amount),0) total_loans
FROM customers c
LEFT JOIN accounts a ON c.customer_id = a.customer_id
LEFT JOIN loans l ON c.customer_id = l.customer_id
GROUP BY c.name;

28) Which customers have multiple accounts in the bank?

SELECT customer_id, COUNT(*) count_accounts
FROM accounts
GROUP BY customer_id
HAVING COUNT(*) > 1;