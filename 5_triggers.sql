 Auto Update Balance 

CREATE OR REPLACE TRIGGER trg_update_balance
BEFORE INSERT ON transactions
FOR EACH ROW
DECLARE
v_balance NUMBER;
v_account_type VARCHAR2(20);
v_min_balance NUMBER;
v_status VARCHAR2(20);
BEGIN

-- check account exists and get details
SELECT balance, account_type, status
INTO v_balance, v_account_type, v_status
FROM accounts
WHERE account_id = :NEW.account_id;

-- check account status
IF v_status <> 'ACTIVE' THEN
RAISE_APPLICATION_ERROR(-20010, 'Account is not active');
END IF;

-- validate amount
IF :NEW.amount <= 0 THEN
RAISE_APPLICATION_ERROR(-20011, 'Invalid transaction amount');
END IF;

-- define minimum balance
IF v_account_type = 'Savings' THEN
    v_min_balance := 500;
ELSIF v_account_type = 'Current' THEN
    v_min_balance := 2000;
ELSIF v_account_type = 'Commercial' THEN
    v_min_balance := 10000;
ELSE
    v_min_balance := 0;
END IF;

-- Deposit
IF :NEW.transaction_type = 'Deposit' THEN

    UPDATE accounts
    SET balance = balance + :NEW.amount
    WHERE account_id = :NEW.account_id;

-- Withdrawal / Transfer
ELSIF :NEW.transaction_type IN ('Withdrawal','Transfer') THEN

    IF (v_balance - :NEW.amount) < v_min_balance THEN
        RAISE_APPLICATION_ERROR(-20012, 'Minimum balance violation');
    END IF;

    UPDATE accounts
    SET balance = balance - :NEW.amount
    WHERE account_id = :NEW.account_id;

END IF;

END;
/
____________________________________________________________________________
Loan Validation Trigger

CREATE OR REPLACE TRIGGER trg_validate_loan
BEFORE INSERT ON loans
FOR EACH ROW
BEGIN

-- validate loan amount
IF :NEW.loan_amount <= 0 THEN
RAISE_APPLICATION_ERROR(-20020, 'Invalid loan amount');
END IF;

-- validate interest rate
IF :NEW.interest_rate <= 0 THEN
RAISE_APPLICATION_ERROR(-20021, 'Invalid interest rate');
END IF;

-- default remaining amount
IF :NEW.remaining_amount IS NULL THEN
    :NEW.remaining_amount := :NEW.loan_amount;
END IF;

-- default status
IF :NEW.loan_status IS NULL THEN
    :NEW.loan_status := 'ACTIVE';
END IF;

END;
/
