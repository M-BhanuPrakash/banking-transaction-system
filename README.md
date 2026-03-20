Banking Transaction System (Oracle SQL + PL/SQL)

 Overview

This project simulates a real-world banking system using Oracle SQL and PL/SQL.
It includes customer management, account operations, transaction processing, and loan management with business rule enforcement.

------------------------------------------------------------------------

 Database Design

The system consists of four core tables:

* Customers → Stores customer details
* Accounts → Maintains account type, balance, and status
* Transactions → Records all financial operations
* Loans → Handles loan issuance and repayment

Relationships are maintained using foreign keys to ensure data integrity.

------------------------------------------------------------------------

 Features Implemented

  Account Operations

* Deposit money
* Withdraw money with minimum balance validation
* Fund transfer between accounts

 Automation Using Triggers

* Automatic balance updates on transactions
* Minimum balance enforcement
* Account status validation (ACTIVE / INACTIVE / CLOSED)

 Loan Management

* Loan issuance with EMI calculation
* Loan limit enforcement (max ₹20 Lakhs per customer)
* Loan repayment tracking
* Automatic loan closure when fully paid

------------------------------------------------------------------------

PL/SQL Components

* Procedures

  * deposit_money
  * withdraw_money
  * transfer_money
  * give_loan
  * pay_loan

* Function

  * calculate_emi

* Triggers

  * Balance update trigger
  * Loan validation trigger

------------------------------------------------------------------------
SQL Queries & Analytics

Developed 28 SQL queries to answer business questions:

* Customer account analysis
* Transaction tracking
* Loan insights
* Time-based analysis
* Ranking and window functions

------------------------------------------------------------------------

 Performance Optimization

* Created indexes on:

  * customer_id
  * account_id
  * transaction_date
  * loan_status

* Used composite indexing for efficient filtering

------------------------------------------------------------------------

 Key Concepts Used

* Joins
* Aggregation (GROUP BY)
* Subqueries
* Window Functions (RANK, SUM OVER)
* Stored Procedures
* Triggers
* Indexing

------------------------------------------------------------------------

 Outcome

Built a complete banking system with:

* Real-world business rules
* Automated data consistency
* Analytical insights using SQL

This project demonstrates strong understanding of database design, PL/SQL programming, and real-world problem solving.

------------------------------------------------------------------------
