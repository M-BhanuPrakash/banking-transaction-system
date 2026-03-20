 Deposit Procedure

CREATE OR REPLACE PROCEDURE deposit_money(
p_account_id NUMBER,
p_amount NUMBER
)
IS
BEGIN

INSERT INTO transactions(account_id, transaction_type, amount, description)
VALUES (p_account_id, 'Deposit', p_amount, 'Cash Deposit');

END;
/
____________________________________________________________________________
Withdraw Procedure (With Minimum Balance Logic)

CREATE OR REPLACE PROCEDURE withdraw_money(
    p_account_id NUMBER,
    p_amount NUMBER,
    p_description VARCHAR2 DEFAULT 'Cash Withdrawal'
)
IS
BEGIN
    INSERT INTO transactions(account_id, transaction_type, amount, description)
    VALUES (p_account_id, 'Withdrawal', p_amount, p_description);
END;
/
____________________________________________________________________________
Transfer Procedure

CREATE OR REPLACE PROCEDURE transfer_money(
p_sender NUMBER,
p_receiver NUMBER,
p_amount NUMBER
)
IS
v_count NUMBER;
BEGIN

-- check receiver exists
SELECT COUNT(*) INTO v_count
FROM accounts
WHERE account_id = p_receiver;

IF v_count = 0 THEN
RAISE_APPLICATION_ERROR(-20005, 'Receiver account does not exist');
END IF;

-- sender transaction
INSERT INTO transactions(account_id, transaction_type, amount, description)
VALUES (p_sender, 'Transfer', p_amount, 'Sent money');

-- receiver transaction
INSERT INTO transactions(account_id, transaction_type, amount, description)
VALUES (p_receiver, 'Deposit', p_amount, 'Received money');

END;
/
_________________________________________________________________________
Give Loan Procedure

CREATE OR REPLACE PROCEDURE give_loan(
p_customer_id NUMBER,
p_loan_type VARCHAR2,
p_amount NUMBER,
p_rate NUMBER,
p_months NUMBER,
p_payment_type VARCHAR2
)
IS
v_emi NUMBER;
v_total NUMBER;
v_count NUMBER;
BEGIN

-- check customer
SELECT COUNT(*) INTO v_count
FROM customers
WHERE customer_id = p_customer_id;

IF v_count = 0 THEN
RAISE_APPLICATION_ERROR(-20001, 'Customer does not exist');
END IF;

-- validate amount
IF p_amount <= 0 THEN
RAISE_APPLICATION_ERROR(-20002, 'Invalid loan amount');
END IF;

-- check loan limit (20L)
SELECT NVL(SUM(loan_amount),0) INTO v_total
FROM loans
WHERE customer_id = p_customer_id
AND loan_status = 'ACTIVE';

IF v_total + p_amount > 2000000 THEN
RAISE_APPLICATION_ERROR(-20003, 'Loan limit exceeded');
END IF;

-- calculate EMI
v_emi := calculate_emi(p_amount, p_rate, p_months);

-- insert loan
INSERT INTO loans(
customer_id, loan_type, loan_amount, interest_rate,
emi_amount, remaining_amount, payment_type
)
VALUES(
p_customer_id, p_loan_type, p_amount, p_rate,
v_emi, p_amount, p_payment_type
);

END;
/
____________________________________________________________________________
Pay Loan Procedure

CREATE OR REPLACE PROCEDURE pay_loan(
p_loan_id NUMBER
)
IS
v_remaining NUMBER;
v_emi NUMBER;
v_type VARCHAR2(20);
v_payment NUMBER;
BEGIN

-- get loan details
SELECT remaining_amount, emi_amount, payment_type
INTO v_remaining, v_emi, v_type
FROM loans
WHERE loan_id = p_loan_id;

-- calculate payment
IF v_type = 'MONTHLY' THEN
    v_payment := v_emi;
ELSIF v_type = 'QUARTERLY' THEN
    v_payment := v_emi * 3;
ELSIF v_type = 'YEARLY' THEN
    v_payment := v_emi * 12;
ELSE
    RAISE_APPLICATION_ERROR(-20004, 'Invalid payment type');
END IF;

-- prevent over deduction
IF v_payment > v_remaining THEN
    v_payment := v_remaining;
END IF;

-- update remaining
UPDATE loans
SET remaining_amount = remaining_amount - v_payment
WHERE loan_id = p_loan_id;

-- close loan
UPDATE loans
SET loan_status = 'CLOSED'
WHERE loan_id = p_loan_id
AND remaining_amount <= 0;

END;
/
