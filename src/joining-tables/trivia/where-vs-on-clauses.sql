-- WHERE clause vs. ON clause
-- They are not the same thing.
-- Does not matter for inner joins
-- Matters for outer joins
---- a. WHERE clause: After joining. Records will be filtered after join has taken place.
---- b. ON clause - Before joining. Records (from right table) will be filtered before joining. This may end up as null in the result (since OUTER join).
-- Example: Consider the below tables:
-- documents:
-- id	name
-- 1	Document1
-- 2	Document2
-- 3	Document3
-- 4	Document4
-- 5	Document5
-- downloads:
-- id	document_id	username
-- 1	1	sandeep
-- 2	1	simi
-- 3	2	sandeep
-- 4	2	reya
-- 5	3	simi
-- a) Inside WHERE clause:
SELECT documents.name,
    downloads.id
FROM documents
    LEFT OUTER JOIN downloads ON documents.id = downloads.document_id
WHERE username = 'sandeep';
-- For above query the intermediate join table will look like this:
-- After applying the WHERE clause and selecting the listed attributes, the result will be:
-- b) Inside JOIN's ON clause:
SELECT documents.name,
    downloads.id
FROM documents
    LEFT OUTER JOIN downloads ON documents.id = downloads.document_id
    AND username = 'sandeep';
-- For above query the intermediate join table will look like this:
-- After Selecting the listed attributes, the result will be:
-- It is worth mention that most (if not all) SQL servers actually does not create full intermediate table like this before applying WHERE conditions. They all have optimizations! And it is very important to know, because when your query contains many JOINS of tables with millions of rows, but your WHERE condition restricts the result set to just few rows, thinking about performance of creating this big Cartesian-product-intermediate-table just to throw out 99.9% of the resulting rows can be scary. :) And misleading.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Consider these queries:
SELECT *
FROM Orders
    LEFT JOIN OrderLines ON OrderLines.OrderID = Orders.ID
WHERE Orders.ID = 12345;
-- and
SELECT *
FROM Orders
    LEFT JOIN OrderLines ON OrderLines.OrderID = Orders.ID
    AND Orders.ID = 12345;
-- The first will return an order and its lines, if any, for order number 12345.
-- The second will return all orders, but only order 12345 will have any lines associated with it.
-- With an INNER JOIN, the clauses are effectively equivalent. However, just because they are functionally the same, in that they produce the same results, does not mean the two kinds of clauses have the same semantic meaning.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Question: 
---- Will you get better performance by putting the where clause in the "on" clause for an inner join?
------ SQL Server uses a query optimizer procedure that compiles and evaluates your code to produce the best execution plan it can. It's not perfect, but most of the time it won't matter and you'll get the same execution plan either way.
------ In Postgres I noted that they were NOT equivalent and resulted in different query plans. If you use ON, it resulted in the use of materialize. If you used WHERE, it used a hash. The materialize had a worse case that was 10x more costly than the hash. This was using a set of IDs rather than a single ID.
------ It's tough to make reliable performance generalizations based on observed behaviors like this. What was true one day tends to be wrong the next, because this is an implementation detail rather than documented behavior. Database teams are always looking for places to improve optimizer performance. I'll be surprised if the ON behavior doesn't improve to match the WHERE. It may not even show up anywhere in release notes from version to version other than something like "general performance improvements.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------   
-- The way I do it is:
---- Always put the join conditions in the ON clause if you are doing an INNER JOIN. So, do not add any WHERE conditions to the ON clause, put them in the WHERE clause.
---- If you are doing a LEFT JOIN, add any WHERE conditions to the ON clause for the table in the right side of the join. This is a must, because adding a WHERE clause that references the right side of the join will convert the join to an INNER JOIN.
---- The exception is when you are looking for the records that are not in a particular table. You would add the reference to a unique identifier (that is not ever NULL) in the RIGHT JOIN table to the WHERE clause this way: WHERE t2.idfield IS NULL. So, the only time you should reference a table on the right side of the join is to find those records which are not in the table.