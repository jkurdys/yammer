CREATE DATABASE yammer;

CREATE TABLE users (
    user_id float,
    created_at timestamp, 
    company_id float,
    language varchar(25),
    activated_at timestamp,
    state varchar(25)
);

CREATE TABLE events (
    user_id float,
    occurred_at timestamp, 
    event_type varchar(25),
    event_name varchar(25),
    location varchar(25),
    device varchar(50),
    user_type float
);

CREATE TABLE emails (
    user_id float,
    occurred_at timestamp, 
    action varchar(50),
    user_type float
);

CREATE TABLE dimension_rollup_periods (
    period_id float,
    time_id timestamp, 
    pst_start timestamp,
    pst_end timestamp,
    utc_start timestamp,
    utc_end timestamp
);