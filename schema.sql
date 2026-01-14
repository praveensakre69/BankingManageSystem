-- Banking Management System Database Schema
-- Author: Praveen Kumar

CREATE DATABASE bankingmanagementsystem;
USE bankingmanagementsystem;

CREATE TABLE account_request (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    gender VARCHAR(10),
    mobile VARCHAR(10),
    email VARCHAR(50),
    address TEXT,
    pan VARCHAR(10),
    aadhar VARCHAR(12),
    account_type VARCHAR(20),
    deposit DECIMAL(10,2),
    nominee_name VARCHAR(50),
    nominee_relation VARCHAR(30),
    status VARCHAR(20),
    request_date DATE
);
