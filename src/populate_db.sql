COPY users
FROM '/Users/Diogenes/Documents/take_homes/yammer/data/yammer_users.csv'
WITH (FORMAT CSV, HEADER);

COPY events
FROM '/Users/Diogenes/Documents/take_homes/yammer/data/yammer_events.csv'
WITH (FORMAT CSV, HEADER);

COPY emails
FROM '/Users/Diogenes/Documents/take_homes/yammer/data/yammer_emails.csv'
WITH (FORMAT CSV, HEADER);

COPY dimension_rollup_periods
FROM '/Users/Diogenes/Documents/take_homes/yammer/data/dimension_rollup_periods.csv'
WITH (FORMAT CSV, HEADER);