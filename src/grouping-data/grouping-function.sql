-- To check whether NULL in the result set represents the subtotals or grand totals, you use the GROUPING() function.
-- The GROUPING() function returns 1 when NULL occurs in a supper-aggregate row, otherwise, it returns 0.
-- The GROUPING() function can be used in the select list, HAVING clause, and (as of MySQL 8.0.12 ) ORDER BY clause.
-- Consider the following query.
-- The GROUPING(orderYear) returns 1 when NULL in the orderYear column occurs in a super-aggregate row, 0 otherwise.
-- Similarly, the GROUPING(productLine) returns 1 when NULL in the productLine column occurs in a super-aggregate row, 0 otherwise.
SELECT orderYear,
    productLine,
    SUM(orderValue) totalOrderValue,
    GROUPING(orderYear),
    GROUPING(productLine)
FROM sales
GROUP BY orderYear,
    productline WITH ROLLUP;
-- We often use GROUPING() function to substitute meaningful labels for super-aggregate NULL values instead of displaying it directly.
-- The following example shows how to combine the IF() function with the GROUPING() function to substitute labels for the super-aggregate NULL values in orderYear and productLine columns:
SELECT IF(
        GROUPING(orderYear),
        'All Years',
        orderYear
    ) orderYear,
    IF(
        GROUPING(productLine),
        'All Product Lines',
        productLine
    ) productLine,
    SUM(orderValue) totalOrderValue
FROM sales
GROUP BY orderYear,
    productline WITH ROLLUP;