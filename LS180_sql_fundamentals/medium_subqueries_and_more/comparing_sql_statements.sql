EXPLAIN ANALYZE SELECT MAX(bid_counts.count) FROM
  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;

--                                                   QUERY PLAN                                                   
-- ---------------------------------------------------------------------------------------------------------------
-- Aggregate  (cost=36.25..36.26 rows=1 width=8) (actual time=0.058..0.059 rows=1 loops=1)
--   ->  HashAggregate  (cost=31.75..33.75 rows=200 width=4) (actual time=0.048..0.053 rows=6 loops=1)
--         ->  Seq Scan on bids  (cost=0.00..24.50 rows=1450 width=4) (actual time=0.004..0.018 rows=26 loops=1)
-- Total runtime: 0.096 ms
-- (4 rows)


EXPLAIN ANALYZE SELECT COUNT(bidder_id) AS max_bid FROM bids
  GROUP BY bidder_id
  ORDER BY max_bid DESC
  LIMIT 1;

--                                                     QUERY PLAN                                                     
 
-- --------------------------------------------------------------------------------------------------------------------
-- -
-- Limit  (cost=34.75..34.75 rows=1 width=4) (actual time=0.068..0.069 rows=1 loops=1)
--   ->  Sort  (cost=34.75..35.25 rows=200 width=4) (actual time=0.066..0.066 rows=1 loops=1)
--         Sort Key: (count(bidder_id))
--         Sort Method: top-N heapsort  Memory: 25kB
--         ->  HashAggregate  (cost=31.75..33.75 rows=200 width=4) (actual time=0.046..0.049 rows=6 loops=1)
--               ->  Seq Scan on bids  (cost=0.00..24.50 rows=1450 width=4) (actual time=0.003..0.020 rows=26 loops=1)
-- Total runtime: 0.098 ms
-- (7 rows)

Planning time: Subquery = 0.058, Join = 0.068
Execution time: Subquery = 0.059, Join = 0.069
Total time: Subquery = 0.096, Join = 0.098
Total costs: Subquery = 72.51, Join = 69.5

The Join statement is more efficient (has a lower total cost), but the subquery is actually a little faster than the join statement.

-- Further Exploration
EXPLAIN ANALYZE SELECT name,
(SELECT COUNT(item_id) FROM bids WHERE item_id = items.id)
FROM items;

--                                                 QUERY PLAN                                                  
-- -------------------------------------------------------------------------------------------------------------
-- Seq Scan on items  (cost=0.00..24229.75 rows=860 width=36) (actual time=0.026..0.092 rows=6 loops=1)
--   SubPlan 1
--     ->  Aggregate  (cost=28.14..28.15 rows=1 width=4) (actual time=0.011..0.012 rows=1 loops=6)
--           ->  Seq Scan on bids  (cost=0.00..28.12 rows=7 width=4) (actual time=0.003..0.006 rows=4 loops=6)
--                 Filter: (item_id = items.id)
--                 Rows Removed by Filter: 22
-- Total runtime: 0.126 ms
-- (7 rows)

EXPLAIN ANALYZE SELECT name, COUNT(item_id)
           FROM items
LEFT OUTER JOIN bids
             ON items.id = bids.item_id
       GROUP BY items.id
       ORDER BY items.id;

--                                                         QUERY PLAN                                                         
-- ---------------------------------------------------------------------------------------------------------------------------
-- Sort  (cost=131.55..133.70 rows=860 width=40) (actual time=0.122..0.127 rows=6 loops=1)
--   Sort Key: items.id
--   Sort Method: quicksort  Memory: 25kB
--   ->  HashAggregate  (cost=81.04..89.64 rows=860 width=40) (actual time=0.107..0.112 rows=6 loops=1)
--         ->  Hash Right Join  (cost=29.35..73.79 rows=1450 width=40) (actual time=0.027..0.081 rows=27 loops=1)
--               Hash Cond: (bids.item_id = items.id)
--               ->  Seq Scan on bids  (cost=0.00..24.50 rows=1450 width=4) (actual time=0.002..0.019 rows=26 loops=1)
--               ->  Hash  (cost=18.60..18.60 rows=860 width=36) (actual time=0.017..0.017 rows=6 loops=1)
--                     Buckets: 1024  Batches: 1  Memory Usage: 1kB
--                     ->  Seq Scan on items  (cost=0.00..18.60 rows=860 width=36) (actual time=0.004..0.009 rows=6 loops=1)
-- Total runtime: 0.170 ms
-- (11 rows)