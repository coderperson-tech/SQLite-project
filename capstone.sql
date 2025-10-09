CREATE TABLE IF NOT EXISTS Salesman_1 (
  Salesman_id TEXT PRIMARY KEY,
  name TEXT,
  city TEXT,
  Comission REAL
);

INSERT INTO Salesman_1 (Salesman_id, name, city, Comission) VALUES
 ('5001', 'James Hoog', 'New York', 0.15),
 ('5002', 'Nail Knite', 'Paris', 0.13),
 ('5005', 'Pit Alex', 'London', 0.11),
 ('5006', 'Mc Lyon', 'Paris', 0.14),
 ('5007', 'Paul Adam', 'Rome', 0.13),
 ('5003', 'Lauson Hen', 'San Jose', 0.12);

 CREATE TABLE IF NOT EXISTS Customer_1 (
   customer_id TEXT PRIMARY KEY,
   cust_name TEXT ,
   city TEXT,
   grade INTEGER,
   Salesman_id TEXT,
   FOREIGN KEY (Salesman_id) REFERENCES Salesman_1(Salesman_id)
);


INSERT INTO Customer_1 (customer_id, cust_name, city, grade, Salesman_id) VALUES
 ('3002', 'nick rimando', 'new york', 100, '5001'),
 ('3007', 'brad davis', 'new york', 200, '5001'),
 ('3005', 'graham zusi', 'california', 200, '5002'),
 ('3008', 'julian green', 'london', 300, '5002'),
 ('3004', 'fabian johnson', 'paris', 300, '5006'),
 ('3009', 'geoff cameron', 'berlin', 100, '5003'),
 ('3003', 'jozy altidor', 'moscow', 200, '5007'),
 ('3001', 'brad guzan', 'london', NULL, '5005');


 CREATE TABLE IF NOT EXISTS Orders_1 ( 
  ord_no TEXT PRIMARY KEY,
  purch_amt REAL,
  ord_date TEXT,
  customer_id TEXT,
  Salesman_id TEXT,
  FOREIGN KEY (customer_id) REFERENCES Customer_1(customer_id),
  FOREIGN KEY (Salesman_id) REFERENCES Salesman_1(Salesman_id)
  );

INSERT INTO Orders_1 (ord_no, purch_amt, ord_date, customer_id, Salesman_id)
VALUES
  ('70001', 150.5, '2012-10-05', '3005', '5002'),
  ('70009', 270.65, '2012-09-10', '3001', '5001'),
  ('70002', 65.26, '2012-10-05', '3002', '5003'),
  ('70004', 110.5, '2012-08-17', '3009', '5007'),
  ('70007', 948.5, '2012-09-10', '3005', '5005'),
  ('70005', 2400.6, '2012-07-27', '3007', '5006');

SELECT Customer_1.cust_name, Salesman_1.name, Salesman_1.city
FROM Customer_1
JOIN Salesman_1 ON  LOWER(Customer_1.city) = LOWER(Salesman_1.city);

SELECT Customer_1.cust_name, Salesman_1.name
FROM Customer_1
JOIN Salesman_1 ON LOWER(Customer_1.Salesman_id) = LOWER(Salesman_1.Salesman_id);
 
SELECT Orders_1.ord_no, Customer_1.cust_name, Orders_1.customer_id, Orders_1.Salesman_id
FROM Orders_1
JOIN Customer_1 ON LOWER(Orders_1.customer_id) = LOWER(Customer_1.customer_id);

SELECT Customer_1.cust_name AS "Customer", Customer_1.grade AS "Grade"
FROM Orders_1
JOIN Salesman_1 ON LOWER(Orders_1.Salesman_id) = LOWER(Salesman_1.Salesman_id)
JOIN Customer_1 ON LOWER(Orders_1.customer_id) = LOWER(Customer_1.customer_id)
WHERE Customer_1.grade IS NOT NULL;

SELECT Customer_1.cust_name AS "Customer",
Customer_1.city AS "City",
Salesman_1.name AS "Salesman",
Salesman_1.Comission
FROM Customer_1
JOIN Salesman_1 ON LOWER(Customer_1.Salesman_id) = LOWER(Salesman_1.Salesman_id)
WHERE Salesman_1.Comission BETWEEN 0.12 AND 0.14;

SELECT Orders_1.ord_no, Customer_1.cust_name, Salesman_1.Comission AS "Comission%",
Orders_1.purch_amt * Salesman_1.Comission AS "Comission"
FROM Orders_1
JOIN Salesman_1 ON LOWER(Orders_1.Salesman_id) = LOWER(Salesman_1.Salesman_id)
JOIN Customer_1 ON LOWER(Orders_1.customer_id) = LOWER(Customer_1.customer_id)
WHERE Customer_1.grade >= 200;

SELECT *
FROM Customer_1
JOIN Orders_1 ON LOWER(Customer_1.customer_id) = LOWER(Orders_1.customer_id)
WHERE Orders_1.ord_date = '2012-10-05';