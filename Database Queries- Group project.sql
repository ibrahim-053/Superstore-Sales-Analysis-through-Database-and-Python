/*Customer Purchase frequency*/
SELECT Customers."Customer ID",
       Customers."Customer Name",
       COUNT(DISTINCT Orders."Order ID") AS PurchaseFrequency
FROM Customers
JOIN Orders ON Customers."Customer ID" = Orders."Customer ID"
GROUP BY Customers."Customer ID", Customers."Customer Name"
ORDER BY PurchaseFrequency DESC;

/*Effect of Discount on Profit*/
SELECT Discount,
       SUM(Profit) AS TotalProfit
FROM Sales
GROUP BY Discount
ORDER BY Discount;

/*Sales and Profitablity trend over time*/
SELECT DATE_TRUNC('month', orders."Order Date") AS Month,
       SUM(sales.Sales) AS TotalSales,
       SUM(sales.Profit) AS TotalProfit
FROM orders
JOIN sales ON orders."Order ID" = sales."Order ID"
GROUP BY Month
ORDER BY Month;

/*Sales by region and state*/
SELECT g.Country, g.State, SUM(s.Sales) AS TotalSales
FROM Sales s
JOIN Orders o ON s."Order ID" = o."Order ID"
JOIN Geography g ON o."Order ID" = g.Order_ID
GROUP BY g.Country, g.State;

/*Total Profit by States*/
SELECT g.Country, g.State, SUM(s.Profit) AS TotalProfit
FROM Sales s
JOIN Orders o ON s."Order ID" = o."Order ID"
JOIN Geography g ON o."Order ID" = g.Order_ID
GROUP BY g.Country, g.State;

/*Total Profit by Sub-Category of Product*/
SELECT p."Sub-Category", SUM(s.Profit) AS TotalProfit
FROM Sales s
JOIN Orders o ON s."Order ID" = o."Order ID"
JOIN Customers c ON o."Customer ID" = c."Customer ID"
JOIN Products p ON s."Product ID" = p."Product ID"
GROUP BY p."Sub-Category";

/*Total sales and profit performance by categories*/
SELECT Category,
       SUM(Sales) AS TotalSales,
       SUM(Profit) AS TotalProfit
FROM Products
JOIN Sales ON Products."Product ID" = Sales."Product ID"
GROUP BY Category
ORDER BY TotalSales DESC; -- or ORDER BY TotalProfit DESC for profitability

/*Total Sales by Segment*/
SELECT Segment, SUM(Sales) AS TotalSales
FROM Sales
JOIN Orders ON Sales."Order ID" = Orders."Order ID"
JOIN Customers ON Orders."Customer ID" = Customers."Customer ID"
GROUP BY Segment;

/*Total Sales by Sub-Categories of Product*/
SELECT p."Sub-Category", SUM(s.Sales) AS TotalSales
FROM Sales s
JOIN Orders o ON s."Order ID" = o."Order ID"
JOIN Customers c ON o."Customer ID" = c."Customer ID"
JOIN Products p ON s."Product ID" = p."Product ID"
GROUP BY p."Sub-Category";