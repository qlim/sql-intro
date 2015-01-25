PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE [Customers] ([customerId] INTEGER PRIMARY KEY UNIQUE, [firstName] TEXT, [lastName] TEXT, [countryCode] TEXT, [city] TEXT, [tier] INTEGER, [joinDate] DATE);
INSERT INTO "Customers" VALUES(1,'Andy','Dwyer','US','Pawnee',3,'2013-01-08');
INSERT INTO "Customers" VALUES(2,'Bruce','Bullerby','GB','London',1,'2013-01-21');
INSERT INTO "Customers" VALUES(3,'Carrie','Bradshaw','US','New York',2,'2013-03-04');
INSERT INTO "Customers" VALUES(4,'D''Angelo','Barksdale','US','Baltimore',1,'2013-04-19');
INSERT INTO "Customers" VALUES(5,'Eric','Murphy','US','Los Angeles',3,'2013-04-23');
INSERT INTO "Customers" VALUES(6,'Francis','Urquhart','GB','London',3,'2013-06-02');
INSERT INTO "Customers" VALUES(7,'Gary','Blauman','US','New York',2,'2013-06-03');
INSERT INTO "Customers" VALUES(8,'Henry','Pollard','US','Los Angeles',2,'2013-06-11');
CREATE TABLE [Sales] ([transactionId] INTEGER PRIMARY KEY, [customerId] INTEGER REFERENCES [Customers] ([customerId]), [productId] INTEGER, [timestamp] DATETIME, [quantity] INT, [salesValue] NUMERIC);
INSERT INTO "Sales" VALUES(1,7,6,'2013-01-09 04:50:29',9,171.9);
INSERT INTO "Sales" VALUES(2,5,5,'2013-01-10 14:39:37',13,839.8);
INSERT INTO "Sales" VALUES(3,2,5,'2013-01-17 06:49:20',12,1102.8);
INSERT INTO "Sales" VALUES(4,6,3,'2013-01-17 10:49:03',6,189.6);
INSERT INTO "Sales" VALUES(5,6,6,'2013-01-21 21:33:36',14,1205.4);
INSERT INTO "Sales" VALUES(6,7,3,'2013-01-29 23:03:06',7,389.9);
INSERT INTO "Sales" VALUES(7,8,5,'2013-01-30 15:42:09',13,699.4);
INSERT INTO "Sales" VALUES(8,5,1,'2013-02-06 07:57:34',20,558);
INSERT INTO "Sales" VALUES(9,1,6,'2013-03-08 14:09:27',3,86.7);
INSERT INTO "Sales" VALUES(10,6,1,'2013-03-11 05:33:15',7,220.5);
INSERT INTO "Sales" VALUES(11,6,6,'2013-03-29 11:49:39',15,307.5);
INSERT INTO "Sales" VALUES(12,3,6,'2013-04-01 08:03:29',12,133.2);
INSERT INTO "Sales" VALUES(13,4,6,'2013-04-04 18:39:12',17,1009.8);
INSERT INTO "Sales" VALUES(14,8,4,'2013-04-12 11:04:44',16,1051.2);
INSERT INTO "Sales" VALUES(15,8,3,'2013-04-14 15:15:54',8,762.4);
INSERT INTO "Sales" VALUES(16,4,5,'2013-04-20 04:37:19',10,625);
INSERT INTO "Sales" VALUES(17,2,5,'2013-04-30 17:06:44',17,323);
INSERT INTO "Sales" VALUES(18,5,3,'2013-05-14 06:00:32',20,264);
INSERT INTO "Sales" VALUES(19,4,4,'2013-05-19 13:32:45',12,433.2);
INSERT INTO "Sales" VALUES(20,1,5,'2013-05-24 13:50:07',17,1193.4);
INSERT INTO "Sales" VALUES(21,4,5,'2013-05-31 13:28:38',14,198.8);
INSERT INTO "Sales" VALUES(22,7,5,'2013-06-01 09:44:18',6,336);
INSERT INTO "Sales" VALUES(23,8,4,'2013-06-12 04:51:54',14,1395.8);
INSERT INTO "Sales" VALUES(24,8,6,'2013-07-14 14:47:00',8,588);
INSERT INTO "Sales" VALUES(25,8,1,'2013-07-18 10:56:56',15,889.5);
INSERT INTO "Sales" VALUES(26,7,2,'2013-07-24 07:17:34',5,485.5);
INSERT INTO "Sales" VALUES(27,4,3,'2013-07-24 21:08:02',11,418);
INSERT INTO "Sales" VALUES(28,3,2,'2013-08-03 20:16:39',9,231.3);
INSERT INTO "Sales" VALUES(29,1,3,'2013-08-08 22:03:48',19,1843);
INSERT INTO "Sales" VALUES(30,2,2,'2013-08-09 14:21:36',14,740.6);
INSERT INTO "Sales" VALUES(31,3,2,'2013-08-21 21:26:17',8,209.6);
INSERT INTO "Sales" VALUES(32,6,4,'2013-09-15 14:57:04',8,378.4);
INSERT INTO "Sales" VALUES(33,3,5,'2013-10-29 19:08:29',19,478.8);
INSERT INTO "Sales" VALUES(34,3,5,'2013-11-02 19:33:31',18,1135.8);
INSERT INTO "Sales" VALUES(35,1,3,'2013-11-09 08:05:16',5,196.5);
INSERT INTO "Sales" VALUES(36,6,3,'2013-11-12 03:39:29',12,567.6);
INSERT INTO "Sales" VALUES(37,1,5,'2013-11-12 15:17:45',19,1632.1);
INSERT INTO "Sales" VALUES(38,3,5,'2013-11-20 13:57:46',14,735);
INSERT INTO "Sales" VALUES(39,7,4,'2013-12-13 23:33:54',13,817.7);
INSERT INTO "Sales" VALUES(40,3,6,'2013-12-20 19:15:59',17,1550.4);
CREATE TABLE [Products] ([productId] INTEGER PRIMARY KEY, [name] TEXT, [category] TEXT);
INSERT INTO "Products" VALUES(1,'Flim Flam','Widget');
INSERT INTO "Products" VALUES(2,'Doowop','Widget');
INSERT INTO "Products" VALUES(3,'Pow Wow','Widget');
INSERT INTO "Products" VALUES(4,'Moolah','Swag');
INSERT INTO "Products" VALUES(5,'Bling','Swag');
INSERT INTO "Products" VALUES(6,'Pip','Thingy');
CREATE VIEW [v0_customers] AS SELECT * FROM Customers;
CREATE VIEW [v1a_select_customers] AS SELECT customerId , firstName , lastName , countryCode FROM Customers;
CREATE VIEW [v2a_select_where] AS SELECT * FROM Customers WHERE countryCode = 'US';
CREATE VIEW [v3a_select_order] AS SELECT * FROM Customers WHERE countryCode = 'US' ORDER BY lastName ASC;
CREATE VIEW [v4a_select_expression] AS SELECT customerId , firstName || ' ' || lastName AS fullName , tier + 10 AS tierPlus10 FROM Customers ORDER BY tierPlus10 DESC;
CREATE VIEW [v1b_select_transactions] AS SELECT transactionId , timestamp FROM Sales;
CREATE VIEW [v0_sales] AS SELECT * from Sales;
CREATE VIEW [v5a_agg] AS SELECT customerId, Sum(salesValue) as salesValueSum
FROM Sales
GROUP BY customerId;
CREATE VIEW [v6a_join] AS SELECT s.transactionId, c.customerId, c.lastName, c.countryCode, s.timestamp, s.quantity
FROM Sales s
JOIN Customers c
ON s.customerId = c.customerId
WHERE c.countryCode = 'US';
CREATE VIEW [v7a_join_multi] AS SELECT s.transactionId, c.customerId, c.lastName, p.productId, p.name AS productName, s.quantity
FROM Sales s
JOIN Customers c ON s.customerId = c.customerId
JOIN Products p ON s.productId = p.productId;
CREATE VIEW [v2b_select_where] AS SELECT * 
FROM Sales
WHERE timestamp < '2013-09-01';
CREATE VIEW [v3b_select_order] AS SELECT *
FROM Sales
WHERE timestamp >= '2013-04-01' AND timestamp < '2013-05-01'
ORDER BY salesValue DESC, customerId ASC;
CREATE VIEW [v4b_select_expression] AS SELECT *, salesValue / quantity AS avgUnitPrice
FROM Sales
WHERE timestamp >= '2013-06-01';
CREATE VIEW [v5b_agg] AS SELECT customerId, productId, Sum(salesValue) AS salesValueSum, Sum(salesValue) / Sum(quantity) AS avgUnitPrice
FROM Sales
GROUP BY customerId, productId;
CREATE VIEW [v6b_join] AS SELECT s.transactionId, s.productId, p.name, s.quantity
FROM Sales s
JOIN Products p ON s.productId = p.productId;
CREATE VIEW [v5c_agg] AS SELECT customerId, Count() AS numOfTransactions, Max(salesValue) AS maxSalesValue
FROM Sales
GROUP BY customerId;
COMMIT;
