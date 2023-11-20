EXPLAIN SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

--                                 QUERY PLAN                                
-- --------------------------------------------------------------------------
-- Hash Join  (cost=32.62..61.54 rows=615 width=32)
--   Hash Cond: (bidders.id = bids.bidder_id)
--   ->  Seq Scan on bidders  (cost=0.00..22.30 rows=1230 width=36)
--   ->  Hash  (cost=30.12..30.12 rows=200 width=4)
--         ->  HashAggregate  (cost=28.12..30.12 rows=200 width=4)
--               ->  Seq Scan on bids  (cost=0.00..24.50 rows=1450 width=4)
-- (6 rows)

-- Using EXPLAIN makes Postgresql provide the Query Plan it would use to execute the provided statement. This does NOT actually execute the statement, it only provides the query plan and the estimated cost of executing that plan.

EXPLAIN ANALYZE SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

--                                                     QUERY PLAN                                                     
 
-- --------------------------------------------------------------------------------------------------------------------
-- -
-- Hash Join  (cost=32.62..61.54 rows=615 width=32) (actual time=0.067..0.080 rows=6 loops=1)
--   Hash Cond: (bidders.id = bids.bidder_id)
--   ->  Seq Scan on bidders  (cost=0.00..22.30 rows=1230 width=36) (actual time=0.005..0.011 rows=7 loops=1)
--   ->  Hash  (cost=30.12..30.12 rows=200 width=4) (actual time=0.054..0.054 rows=6 loops=1)
--         Buckets: 1024  Batches: 1  Memory Usage: 1kB
--         ->  HashAggregate  (cost=28.12..30.12 rows=200 width=4) (actual time=0.043..0.046 rows=6 loops=1)
--               ->  Seq Scan on bids  (cost=0.00..24.50 rows=1450 width=4) (actual time=0.002..0.017 rows=26 loops=1)
-- Total runtime: 0.115 ms
-- (8 rows)

-- Using EXPLAIN ANALYZE makes Postgresql provide the Query Plan, execute the the provided statement, and the actual cost of executing the statement.