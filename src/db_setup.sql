CREATE DATABASE yammer;

CREATE TABLE users (
    user_id bigint,
    created_at datetime, 
    state varchar(25),
    activated_at datetime,
    company_id bigint,
    language varchar(25)
);

CREATE TABLE events (
    user_id bigint,
    occurred_at datetime, 
    event_type varchar(25),
    event_name varchar(25),
    location varchar(25),
    device varchar(50),
    user_type float
);

CREATE TABLE emails (
    user_id bigint,
    occurred_at datetime, 
    action varchar(50),
    user_type float
);

CREATE TABLE dimension_rollup_periods (
    period_id float,
    time_id datetime, 
    pst_start datetime,
    pst_end datetime,
    utc_start datetime,
    utc_end datetime
);