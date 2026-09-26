
CREATE DATABASE IF NOT EXISTS credit_card_churn;
USE credit_card_churn;

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    clientnum                INT PRIMARY KEY,
    attrition_flag           VARCHAR(20),
    customer_age             INT,
    gender                   CHAR(1),
    dependent_count          INT,
    education_level          VARCHAR(20),
    marital_status           VARCHAR(20),
    income_category          VARCHAR(20),
    card_category            VARCHAR(10),
    months_on_book           INT,
    total_relationship_count INT,
    months_inactive_12_mon   INT,
    contacts_count_12_mon    INT,
    credit_limit             DECIMAL(10,2),
    total_revolving_bal      INT,
    avg_open_to_buy          DECIMAL(10,2),
    total_amt_chng_q4_q1     DECIMAL(6,3),
    total_trans_amt          INT,
    total_trans_ct           INT,
    total_ct_chng_q4_q1      DECIMAL(6,3),
    avg_utilization_ratio    DECIMAL(5,3),
    churn                    TINYINT
);