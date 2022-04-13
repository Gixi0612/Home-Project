USE data_hawk;
Select * from `advertising-oct-2020`;
Select * from `sales-oct-2020`;

## 1. Top 10 Sellers that used the SponsoredType *'SponsoredProducts*' ordered by the number of orders descending
SELECT A.AccountID, number_of_orders
FROM
(SELECT Distinct AccountID
FROM `advertising-oct-2020`
WHERE SponsoredType = 'SponsoredProducts') A
LEFT JOIN
(SELECT AccountID, sum(Orders) as number_of_orders
FROM `sales-oct-2020`
GROUP BY AccountID) B
on A.AccountID = B.AccountID
ORDER BY number_of_orders desc
LIMIT 10;


#2. Average price per Marketplace per day
SELECT Marketplace, ReportDate, SUM(Costs)/SUM(Clicks) as Average_Cost_Per_Click
FROM `advertising-oct-2020`
GROUP BY Marketplace, ReportDate
HAVING Average_Cost_Per_Click Is not NULL 
ORDER BY Marketplace, ReportDate;

 