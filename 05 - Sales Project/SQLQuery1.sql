--  فروش با بیشترین درآمد10   
SELECT top 10 * FROM SalesForCourse_quizz_table
ORDER BY revenue DESC 

SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN [Date] IS NULL THEN 1 ELSE 0 END) AS MissingDate,
    SUM(CASE WHEN [Year] IS NULL THEN 1 ELSE 0 END) AS MissingYear,
    SUM(CASE WHEN [Month] IS NULL THEN 1 ELSE 0 END) AS MissingMonth,
    SUM(CASE WHEN [Customer_Age] IS NULL THEN 1 ELSE 0 END) AS MissingAge,
    SUM(CASE WHEN [Customer Gender] IS NULL THEN 1 ELSE 0 END) AS MissingGender,
    SUM(CASE WHEN [Country] IS NULL THEN 1 ELSE 0 END) AS MissingCountry,
    SUM(CASE WHEN [State] IS NULL THEN 1 ELSE 0 END) AS MissingState,
    SUM(CASE WHEN [Product Category] IS NULL THEN 1 ELSE 0 END) AS MissingCategory,
    SUM(CASE WHEN [Sub Category] IS NULL THEN 1 ELSE 0 END) AS MissingSubCategory,
    SUM(CASE WHEN [Quantity] IS NULL THEN 1 ELSE 0 END) AS MissingQuantity,
    SUM(CASE WHEN [Unit_Cost]  IS NULL THEN 1 ELSE 0 END) AS MissingUnitCost,
    SUM(CASE WHEN [Unit_price] IS NULL THEN 1 ELSE 0 END) AS MissingUnitPrice,
    SUM(CASE WHEN [Cost] IS NULL THEN 1 ELSE 0 END) AS MissingCost,
    SUM(CASE WHEN [Revenue] IS NULL THEN 1 ELSE 0 END) AS MissingRevenue
FROM SalesForCourse_quizz_table;


-- جایگزینی NULL در Customer Age با میانگین سن
SELECT 
    [Customer Age],
    ISNULL([Customer Age], (SELECT AVG([Customer Age]) FROM sales WHERE [Customer Age] IS NOT NULL)) AS AgeImputed,
    Revenue
FROM SalesForCourse_quizz_table;

-- جایگزینی NULL در Unit Cost با میانگین آن دسته محصول
WITH AvgCostPerCategory AS (
    SELECT 
        [Product Category],
        AVG([Unit_Cost]) AS AvgCost
    FROM SalesForCourse_quizz_table
    WHERE [Unit_Cost] IS NOT NULL
    GROUP BY [Product Category]
)
SELECT 
    s.[Product Category],
    s.[Unit_Cost],
    ISNULL(s.[Unit_Cost] , a.AvgCost) AS UnitCostImputed
FROM SalesForCourse_quizz_table s
LEFT JOIN AvgCostPerCategory a 
    ON s.[Product Category] = a.[Product Category];


WITH DuplicateCheck AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY [Date], [Year], [Month], [Customer_Age], 
                         [Customer Gender], [Country], [State], 
                         [Product Category], [Sub Category], 
                         [Quantity], [Unit_Cost], [Unit_Price], 
                         [Cost], [Revenue]
            ORDER BY [index1]
        ) AS RowNum
    FROM SalesForCourse_quizz_table
)
-- برای مشاهده داپلیکیت‌ها
SELECT *
FROM DuplicateCheck
WHERE RowNum > 1;


DELETE FROM DuplicateCheck
WHERE RowNum > 1;


-- استانداردسازی جنسیت
SELECT 
    [Customer Gender],
    CASE 
        WHEN [Customer Gender] IN ('F', 'f', 'Female') THEN 'Female'
        WHEN [Customer Gender] IN ('M', 'm', 'Male') THEN 'Male'
        ELSE 'Unknown'
    END AS GenderStandard
FROM SalesForCourse_quizz_table;

-- استانداردسازی کشورها
SELECT 
    [Country],
    CASE 
        WHEN [Country] LIKE '%United States%' THEN 'USA'
        WHEN [Country] LIKE '%France%' THEN 'France'
        WHEN [Country] LIKE '%Germany%' THEN 'Germany'
        WHEN [Country] LIKE '%United Kingdom%' THEN 'UK'
        ELSE [Country]
    END AS CountryStandard
FROM SalesForCourse_quizz_table;

-- یکسان‌سازی نام ماه‌ها
SELECT 
    [Month],
    CASE 
        WHEN [Month] IN ('Jan', 'January', '01') THEN 'January'
        WHEN [Month] IN ('Feb', 'February', '02') THEN 'February'
        WHEN [Month] IN ('Mar', 'March', '03') THEN 'March'
        ELSE [Month]
    END AS MonthStandard
FROM SalesForCourse_quizz_table;





-- بررسی رکوردهایی که Cost > Revenue هستند
SELECT COUNT(*) AS LossRecords
FROM SalesForCourse_quizz_table
WHERE [Cost] > [Revenue];

-- نمایش رکوردهایی با ضرر
SELECT *
FROM SalesForCourse_quizz_table
WHERE [Cost] > [Revenue];

-- بررسی رکوردهایی که Unit Cost > Unit Price هستند
SELECT COUNT(*) AS InvalidPricing
FROM SalesForCourse_quizz_table
WHERE [Unit_Cost] > [Unit_price];

-- بررسی رکوردهایی که Cost != Quantity * Unit Cost
SELECT COUNT(*) AS MismatchedCost
FROM SalesForCourse_quizz_table
WHERE ABS([Cost] - ([Quantity] * [Unit_Cost])) > 0.01;

-- بررسی رکوردهایی که Revenue != Quantity * Unit Price
SELECT COUNT(*) AS MismatchedRevenue
FROM SalesForCourse_quizz_table
WHERE ABS([Revenue] - ([Quantity] * [Unit_Price])) > 0.01;

-- میانگین قیمت واحد و درآمد
SELECT 
    round(AVG([Unit_Price]),2) AS AvgUnitPrice,
    round(AVG(Revenue),2) AS AvgRevenue
FROM SalesForCourse_quizz_table;

--محصولات با بیشترین تعداد فروش

SELECT TOP 5
    [Product Category],
    [Sub Category],
    SUM(Quantity) AS TotalQuantity
FROM SalesForCourse_quizz_table
GROUP BY [Product Category], [Sub Category]
ORDER BY TotalQuantity DESC;

-- مجموع درآمد بر اساس سال
SELECT 
    Year,
    SUM(Revenue) AS TotalRevenue
FROM SalesForCourse_quizz_table
GROUP BY Year
ORDER BY Year;

-- مجموع درآمد بر اساس دسته‌بندی محصول و سال
SELECT 
    Year,
    [Product Category],
    SUM(Revenue) AS TotalRevenue
FROM SalesForCourse_quizz_table
GROUP BY Year, [Product Category]
ORDER BY Year, TotalRevenue DESC;

select * from SalesForCourse_quizz_table 
where year = 0

-- محصول پرفروش از نظر درآمد در سال ۲۰۱۶
SELECT TOP 5
    [Sub Category],
    SUM(Revenue) AS TotalRevenue
FROM SalesForCourse_quizz_table 
WHERE Year = 2016
GROUP BY [Sub Category]
ORDER BY TotalRevenue DESC;

-- میانگین درآمد به ازای هر مشتری (بر اساس سن
SELECT 
    [Customer_Age],
    COUNT(*) AS OrderCount,
    AVG(Revenue) AS AvgRevenuePerOrder
FROM SalesForCourse_quizz_table 
GROUP BY [Customer_Age]
ORDER BY AvgRevenuePerOrder DESC;
ORDER BY [Customer_Age] DESC


-- بهترین ماه‌ها از نظر فروش در سال ۲۰۱۶
SELECT 
    Month,
    SUM(Revenue) AS TotalRevenue
FROM SalesForCourse_quizz_table 
WHERE Year = 2016
GROUP BY Month
ORDER BY TotalRevenue DESC;

-- تعداد سفارش‌ها و درآمد بر اساس کشور
SELECT 
    Country,
    COUNT(*) AS OrderCount,
    SUM(Revenue) AS TotalRevenue,
    AVG(Revenue) AS AvgRevenue
FROM SalesForCourse_quizz_table
GROUP BY Country
ORDER BY TotalRevenue DESC;

-- محصولاتی که سودآوری (Revenue - Cost) منفی دارند
SELECT 
    [Sub Category],
    SUM(Cost) AS TotalCost,
    SUM(Revenue) AS TotalRevenue,
    SUM(Revenue) - SUM(Cost) AS TotalProfit
FROM SalesForCourse_quizz_table
GROUP BY [Sub Category]
HAVING SUM(Revenue) - SUM(Cost) < 0
ORDER BY TotalProfit;

-- مشتریانی که بیشتر از ۵ سفارش ثبت کرده‌اند
SELECT 
    [Customer_Age],
    [Customer Gender],
    COUNT(*) AS OrderCount
FROM SalesForCourse_quizz_table
GROUP BY [Customer_Age], [Customer Gender]
HAVING COUNT(*) > 5
ORDER BY OrderCount DESC;

--  محاسبه رشد ماهانه درآمد (Month-over-Month)
WITH MonthlyRevenue AS (
    SELECT 
        Year,
        Month,
        SUM(Revenue) AS Revenue
    FROM SalesForCourse_quizz_table
    GROUP BY Year, Month
)
SELECT 
    Year,
    Month,
    Revenue,
    LAG(Revenue) OVER (ORDER BY Year, Month) AS PreviousMonthRevenue,
    (Revenue - LAG(Revenue) OVER (ORDER BY Year, Month)) / LAG(Revenue) OVER (ORDER BY Year, Month) * 100 AS GrowthPercent
FROM MonthlyRevenue
ORDER BY Year, Month;