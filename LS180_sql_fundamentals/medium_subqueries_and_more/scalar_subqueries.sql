SELECT name, 
       (SELECT COUNT(item_id) 
          FROM bids
         WHERE item_id = items.id)
FROM items;

-- Further Exploration

         SELECT name, COUNT(item_id)
           FROM items
LEFT OUTER JOIN bids
             ON items.id = bids.item_id
       GROUP BY items.id
       ORDER BY items.id;