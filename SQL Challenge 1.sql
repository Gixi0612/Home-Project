USE data_hawk;
Select * from `advertising-oct-2020`;
Select * from `sales-oct-2020`;

## 1. Top 10 Sellers that used the SponsoredType *'SponsoredProducts*' ordered by the number of orders descending
##How I did: First I created a table to show distinct Sellers who used Sponsored Products Type. Then I created another table from Sales table to show the number of orders per Sellers. 
#Then I left jojned the first one with the second one on the AccountId, order by the number of orders and limit 10.
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

#I will consider the CPC as the price that Sellers need to pay to Marketplace. I exclude all 0 and null CPC. 
SELECT Marketplace, ReportDate, SUM(Costs)/SUM(Clicks) as Average_Cost_Per_Click
FROM `advertising-oct-2020`
GROUP BY Marketplace, ReportDate
HAVING Average_Cost_Per_Click Is not NULL 
ORDER BY Marketplace, ReportDate;

 