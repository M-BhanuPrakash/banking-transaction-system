-- Accounts
CREATE INDEX idx_accounts_customer ON accounts(customer_id);

-- Transactions
CREATE INDEX idx_transactions_account ON transactions(account_id);
CREATE INDEX idx_transactions_date ON transactions(transaction_date);

-- Loans
CREATE INDEX idx_loans_customer ON loans(customer_id);
CREATE INDEX idx_loans_status ON loans(loan_status);
CREATE INDEX idx_loans_customer_status ON loans(customer_id, loan_status);