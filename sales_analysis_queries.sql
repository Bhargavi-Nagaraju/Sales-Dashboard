-- 1. Select Database
USE SalesDashboard;

-- 2. Data Check: View First 10 Rows
SELECT TOP 10 *
FROM dbo.Sales_Data;

-- 3. High-Level KPIs
SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND((SUM(Profit) / (1.0 * SUM(Sales))) * 100, 2) AS Profit_Margin_Percentage
FROM dbo.Sales_Data;

-- 4. Sales by Region
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM dbo.Sales_Data
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 5. Profit by Category
SELECT
    Category,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM dbo.Sales_Data
GROUP BY Category
ORDER BY Total_Profit DESC;

-- 6. Sales by Year
SELECT
    YEAR(Order_Date) AS [Year],
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM dbo.Sales_Data
GROUP BY YEAR(Order_Date)
ORDER BY [Year] ASC;

-- 7. Sales by Segment
SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM dbo.Sales_Data
GROUP BY Segment
ORDER BY Total_Sales DESC;
