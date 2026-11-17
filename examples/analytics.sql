-- Monthly revenue ranking (PostgreSQL)
/* CTEs, window functions, JSON operators,
   dollar-quoted bodies and bind parameters */
CREATE TABLE IF NOT EXISTS orders (
  id          BIGSERIAL PRIMARY KEY,
  customer    VARCHAR(120) NOT NULL,
  amount      NUMERIC(12, 2) DEFAULT 0,
  metadata    JSONB,
  created_at  TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

WITH monthly AS (
  SELECT customer,
         DATE_TRUNC('month', created_at) AS month,
         SUM(amount)  AS revenue,
         COUNT(*)     AS orders
  FROM orders o
  WHERE o.created_at >= NOW() - INTERVAL '12 months'
    AND o.metadata->>'channel' IS NOT NULL
    AND customer NOT LIKE 'test%'
  GROUP BY 1, 2
  HAVING SUM(amount) > 1000.50
)
SELECT m.*,
       RANK() OVER (PARTITION BY month ORDER BY revenue DESC) AS position
FROM monthly m
LEFT JOIN "Customers" c ON c.name = m.customer
WHERE m.month = $1::date
ORDER BY revenue DESC
LIMIT 10;

CREATE OR REPLACE FUNCTION touch_updated_at() RETURNS trigger AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
