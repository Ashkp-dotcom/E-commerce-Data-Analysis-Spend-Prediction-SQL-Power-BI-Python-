create database ecommerce

Select  TOP 5 * FROM Sales_Data_Ecommerce

-- 1. Total Events & Unique Users

SELECT 
    COUNT(*) AS total_events,
    COUNT(DISTINCT user_id) AS unique_users
FROM Sales_Data_Ecommerce

--2. Channel-wise Engagement

SELECT 
    Channel,
    COUNT(*) AS total_events,
    COUNT(DISTINCT user_id) AS unique_users
FROM Sales_Data_Ecommerce
GROUP BY Channel
ORDER BY total_events DESC

--3. Top 10 Brands by User Activity

SELECT TOP 10
    brand,
    COUNT(*) AS total_events,
    COUNT(DISTINCT user_id) AS unique_users
FROM Sales_Data_Ecommerce
GROUP BY brand
ORDER BY total_events DESC


--4. Top Sub-categories by Revenue

SELECT TOP 10
    sub_category1,
    SUM(price) AS total_revenue,
    COUNT(*) AS items_sold
FROM Sales_Data_Ecommerce
GROUP BY sub_category1
ORDER BY total_revenue DESC


--5.  Peak Shopping Hours

SELECT 
    event_hour,
    COUNT(*) AS total_events
FROM Sales_Data_Ecommerce
GROUP BY event_hour
ORDER BY total_events DESC


--6 State-wise Revenue

SELECT 
    State,
    SUM(price) AS total_revenue,
    COUNT(*) AS total_events
FROM Sales_Data_Ecommerce
GROUP BY State
ORDER BY total_revenue DESC

--7. Events by Day of Week 

SELECT 
    Day_of_week,
    COUNT(*) AS total_events
FROM Sales_Data_Ecommerce
GROUP BY Day_of_week
ORDER BY 
    CASE 
        WHEN Day_of_week = 'Monday' THEN 1
        WHEN Day_of_week = 'Tuesday' THEN 2
        WHEN Day_of_week = 'Wednesday' THEN 3
        WHEN Day_of_week = 'Thursday' THEN 4
        WHEN Day_of_week = 'Friday' THEN 5
        WHEN Day_of_week = 'Saturday' THEN 6
        WHEN Day_of_week = 'Sunday' THEN 7
    END;

--8. Most Active Users

SELECT TOP 10
    user_id,
    COUNT(*) AS events_count
FROM Sales_Data_Ecommerce
GROUP BY user_id
ORDER BY events_count DESC


--9. Monthly Revenue Trend

SELECT 
    DATENAME(MONTH, event_date) AS Month_Name,
    SUM(price) AS total_revenue
FROM Sales_Data_Ecommerce
GROUP BY DATENAME(MONTH, event_date), MONTH(event_date)
ORDER BY MONTH(event_date)


--10. Revenue by Category and Month

SELECT 
    DATENAME(MONTH, event_date) AS Month_Name,
    category,
    SUM(price) AS total_revenue,
    COUNT(*) AS total_transactions
FROM Sales_Data_Ecommerce
GROUP BY DATENAME(MONTH, event_date), category
ORDER BY 
    CASE 
        WHEN DATENAME(MONTH, event_date) = 'October' THEN 1
        WHEN DATENAME(MONTH, event_date) = 'November' THEN 2
        ELSE 3
    END,
    total_revenue DESC





