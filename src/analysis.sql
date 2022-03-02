SELECT DATE_TRUNC('week', occurred_at),
       COUNT(DISTINCT user_id) AS weekly_active_users
FROM events
WHERE event_type = 'engagement'
    AND event_name = 'login'
GROUP BY 1
ORDER BY 1;

