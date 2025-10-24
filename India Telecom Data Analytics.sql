CREATE DATABASE TelecomDB;
USE TelecomDB;

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15) UNIQUE,
    city VARCHAR(50),
    join_date DATE
);
desc Customers;
CREATE TABLE Plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(50),
    validity INT NOT NULL, -- in days
    price DECIMAL(8,2),
    data_limit INT -- GB per day
);
desc Plans;
CREATE TABLE Subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    plan_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (plan_id) REFERENCES Plans(plan_id)
);
desc Subscriptions;
select * from Subscriptions; 
CREATE TABLE `Usage` (
    usage_id INT AUTO_INCREMENT PRIMARY KEY, 
    customer_id INT, 
    usage_date DATE, 
    calls INT, 
    sms INT, 
    data_used DECIMAL(5,2), 
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
desc `Usage`;
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    plan_id INT,
    payment_date DATE,
    amount DECIMAL(8,2),
    method VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (plan_id) REFERENCES Plans(plan_id)
);
desc Payments;
CREATE TABLE CustomerSupport (
    support_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    request_date DATE,
    query_type VARCHAR(100),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
desc CustomerSupport;
select * from CustomerSupport;
-- Customers
INSERT INTO Customers (name, phone, city, join_date) VALUES
('Rahul','9001112223','Mumbai','2024-11-01'),
('Priya','9998887776','Delhi','2025-01-10'),
('Anil','8885554447','Bangalore','2025-02-14'),
('Lata','9802345678','Chennai','2025-03-12'),
('Mohan','9112233445','Hyderabad','2025-01-21'),
('Sonal','9001223344','Pune','2025-02-24'),
('Ajay','9123344556','Kolkata','2025-03-25'),
('Vidya','9003234455','Ahmedabad','2025-04-16'),
('Deepak','9111222334','Jaipur','2025-05-12'),
('Renu','9801234567','Lucknow','2025-05-31'),
('Pavan','8877665544','Gurgaon','2025-04-20'),
('Tarun','9012345555','Goa','2025-04-23'),
('Nisha','9988776655','Visakhapatnam','2025-05-02'),
('Rakesh','9004567890','Surat','2025-05-15'),
('Harsha','9098765432','Rajkot','2025-03-07'),
('Megha','9301122334','Indore','2025-04-19'),
('Simran','9311223344','Bhopal','2025-05-23'),
('Santosh','9322334455','Patna','2025-04-17'),
('Fatima','9001234567','Nagpur','2025-03-24'),
('Imran','9665544332','Agra','2025-04-01'),
('Geeta','9012345678','Noida','2025-03-01');
select * from Customers;

-- Plans
INSERT INTO Plans (plan_name, validity, price, data_limit) VALUES
('Basic', 28, 249, 2),
('Value', 56, 399, 5),
('Premium', 84, 699, 10),
('Student', 30, 199, 1),
('Family', 90, 999, 15);

-- Subscriptions
INSERT INTO Subscriptions (customer_id, plan_id, start_date, end_date) VALUES
(1,3,'2025-04-01','2025-06-24'), 
(2,1,'2025-04-05','2025-05-02'), 
(3,2,'2025-04-12','2025-06-07'), 
(4,1,'2025-05-01','2025-05-28'),
(5,2,'2025-03-01','2025-04-26'), 
(6,1,'2025-03-10','2025-04-07'), 
(7,4,'2025-04-20','2025-05-19'), 
(8,1,'2025-02-15','2025-03-14'),
(9,3,'2025-03-24','2025-06-16'), 
(10,2,'2025-04-11','2025-06-06'), 
(11,5,'2025-04-18','2025-07-17'), 
(12,1,'2025-05-03','2025-05-30'),
(13,2,'2025-04-24','2025-06-19'), 
(14,3,'2025-04-30','2025-07-23'), 
(15,2,'2025-03-21','2025-05-16'), 
(16,4,'2025-02-10','2025-03-11'),
(17,1,'2025-05-05','2025-06-01'), 
(18,2,'2025-04-09','2025-06-04'), 
(19,5,'2025-04-24','2025-07-23'), 
(20,1,'2025-03-10','2025-04-06'), 
(21,2,'2025-04-05','2025-05-30');

-- Payments
INSERT INTO Payments (customer_id, plan_id, payment_date, amount, method) VALUES
(1,3,'2025-04-01',699,'Paytm'), 
(2,1,'2025-04-05',249,'UPI'), 
(3,2,'2025-04-12',399,'Credit Card'), 
(4,1,'2025-05-01',249,'Cash'),
(5,2,'2025-03-01',399,'UPI'), 
(6,1,'2025-03-10',249,'Paytm'), 
(7,4,'2025-04-20',199,'Cash'), 
(8,1,'2025-02-15',249,'UPI'),
(9,3,'2025-03-24',699,'Paytm'), 
(10,2,'2025-04-11',399,'UPI'), 
(11,5,'2025-04-18',999,'Credit Card'), 
(12,1,'2025-05-03',249,'Cash'),
(13,2,'2025-04-24',399,'Paytm'), 
(14,3,'2025-04-30',699,'Cash'), 
(15,2,'2025-03-21',399,'UPI'), 
(16,4,'2025-02-10',199,'UPI'),
(17,1,'2025-05-05',249,'Credit Card'), 
(18,2,'2025-04-09',399,'Cash'), 
(19,5,'2025-04-24',999,'UPI'), 
(20,1,'2025-03-10',249,'Paytm'), 
(21,2,'2025-04-05',399,'Paytm');

-- Usage 
INSERT INTO `Usage` (customer_id, usage_date, calls, sms, data_used) VALUES
(1,'2025-04-10',50,10,1.5), 
(2,'2025-04-10',30,20,1.1), 
(3,'2025-04-15',40,15,3.2), 
(4,'2025-05-05',25,5,0.7), 
(5,'2025-03-15',60,5,2.9), 
(6,'2025-03-25',30,12,0.8), 
(7,'2025-04-20',42,25,1.3), 
(8,'2025-02-18',44,18,2.2), 
(9,'2025-04-10',25,10,0.5),
(10,'2025-04-15',50,15,3.0), 
(11,'2025-04-25',20,22,1.7), 
(12,'2025-05-08',36,14,2.2), 
(13,'2025-05-15',38,14,2.0), 
(14,'2025-05-18',63,12,9.8),
(15,'2025-03-25',18,7,0.4), 
(16,'2025-02-15',35,30,1.8), 
(17,'2025-06-01',41,8,2.6), 
(18,'2025-04-09',60,7,3.7), 
(19,'2025-04-25',22,4,1.2), 
(20,'2025-03-15',33,6,2.0), 
(21,'2025-04-17',46,10,2.5);

-- CustomerSupport
INSERT INTO CustomerSupport (customer_id, request_date, query_type, status) VALUES
(1,'2025-04-20','Network Issue','Resolved'), 
(2,'2025-05-07','SIM Replacement','Resolved'),
(3,'2025-05-10','Plan Upgrade','Pending'), 
(4,'2025-02-15','Network Issue','Resolved'),
(5,'2025-03-19','Billing Error','Resolved'), 
(6,'2025-03-30','Recharge Failure','Pending'), 
(7,'2025-04-24','Network Issue','Resolved'),
(8,'2025-02-20','Billing Error','Resolved'), 
(9,'2025-04-18','Plan Upgrade','Resolved'), 
(10,'2025-04-15','Recharge Failure','Resolved'),
(11,'2025-04-28','SIM Replacement','Pending'), 
(12,'2025-05-10','Plan Upgrade','Resolved'),
(13,'2025-05-15','Billing Error','Resolved'), 
(14,'2025-05-30','Network Issue','Pending'), 
(15,'2025-03-29','Recharge Failure','Resolved'), 
(16,'2025-02-15','Network Issue','Resolved'),
(17,'2025-06-02','Plan Upgrade','Pending'), 
(18,'2025-05-09','Recharge Failure','Resolved'), 
(19,'2025-04-26','SIM Replacement','Resolved'),
(20,'2025-03-17','Billing Error','Resolved'), 
(21,'2025-04-20','Network Issue','Resolved');

-- Q1. List all telecom customers
SELECT * FROM Customers;

-- Q2. Show all prepaid plans above ₹300
SELECT * FROM Plans WHERE price > 300;

-- Q3. Display subscriptions active in May 2025
SELECT * FROM Subscriptions WHERE '2025-05-01' BETWEEN start_date AND end_date;

-- Q4. Customers who have used more than 2GB data in any single day
SELECT c.customer_id, c.name, u.usage_date, u.data_used
FROM `Usage` u JOIN Customers c ON u.customer_id = c.customer_id
WHERE u.data_used > 2;

-- Q5. Total payments collected for Premium plan
SELECT SUM(amount) FROM Payments WHERE plan_id = 3;

-- Q6. Average calls per user for April 2025
SELECT u.customer_id, AVG(u.calls)
FROM `Usage` u WHERE MONTH(u.usage_date) = 4 AND YEAR(u.usage_date) = 2025
GROUP BY u.customer_id;

-- Q7. Customers with unresolved support queries
SELECT c.customer_id, c.name
FROM CustomerSupport cs JOIN Customers c ON cs.customer_id = c.customer_id
WHERE cs.status = 'Pending';

-- Q8. Plan-wise subscription count
SELECT p.plan_name, COUNT(s.subscription_id)
FROM Plans p JOIN Subscriptions s ON p.plan_id = s.plan_id
GROUP BY p.plan_name;

-- Q9. Users who paid via UPI
SELECT c.customer_id, c.name
FROM Payments p JOIN Customers c ON p.customer_id = c.customer_id
WHERE p.method = 'UPI';

-- Q10. Users who paid via Paytm
SELECT c.customer_id, c.name
FROM Payments p JOIN Customers c ON p.customer_id = c.customer_id
WHERE p.method = 'Paytm';

-- Q11. Users who paid via Credit Card
SELECT c.customer_id, c.name
FROM Payments p JOIN Customers c ON p.customer_id = c.customer_id
WHERE p.method = 'Credit Card';

-- Q12. Users who paid via Cash
SELECT c.customer_id, c.name
FROM Payments p JOIN Customers c ON p.customer_id = c.customer_id
WHERE p.method = 'Cash';

-- Q13. Total SMS sent per customer
SELECT c.name, SUM(u.sms) AS total_sms
FROM `Usage` u JOIN Customers c ON u.customer_id = c.customer_id
GROUP BY c.name;

-- Q14. Customers from Hyderabad
SELECT customer_id, name FROM Customers WHERE city = 'Hyderabad';

-- Q15. Plans with >30 days validity
SELECT * FROM Plans WHERE validity > 30;

-- Q16. Monthly active users (April 2025)
SELECT COUNT(DISTINCT customer_id) Count
FROM `Usage` WHERE MONTH(usage_date) = 4 AND YEAR(usage_date) = 2025;

-- Q17. Subscriptions ending in June 2025
SELECT * FROM Subscriptions WHERE MONTH(end_date) = 6 AND YEAR(end_date) = 2025;

-- Q18. Payments made in May 2025
SELECT * FROM Payments WHERE MONTH(payment_date) = 5 AND YEAR(payment_date) = 2025;

-- Q19. Average data limit for all plans
SELECT AVG(data_limit) FROM Plans;

-- Q20. Support queries by type count
SELECT query_type, COUNT(*) Count FROM CustomerSupport GROUP BY query_type;

-- Q21. Peak call volume day per customer
SELECT u.customer_id, u.usage_date, u.calls
FROM `Usage` u
WHERE (u.customer_id, u.calls) IN (
SELECT customer_id, MAX(calls) FROM `Usage` GROUP BY customer_id);

-- Q22. Customers who sent more than 15 SMS in a day
SELECT c.customer_id, c.name, u.usage_date, u.sms
FROM `Usage` u JOIN Customers c ON u.customer_id = c.customer_id
WHERE u.sms > 15;

-- Q23. Total payments by each customer
SELECT c.name, SUM(p.amount)
FROM Payments p JOIN Customers c ON p.customer_id = c.customer_id
GROUP BY c.name;

-- Q24. Customers who upgraded their plan
SELECT DISTINCT c.customer_id, c.name
FROM CustomerSupport cs JOIN Customers c ON cs.customer_id = c.customer_id
WHERE cs.query_type = 'Plan Upgrade' AND cs.status = 'Resolved';

-- Q25. All 'Basic' plan subscribers
SELECT c.customer_id, c.name
FROM Subscriptions s JOIN Plans p ON s.plan_id = p.plan_id
JOIN Customers c ON s.customer_id = c.customer_id
WHERE p.plan_name = 'Basic';

-- Q26. All 'Premium' plan subscribers
SELECT c.customer_id, c.name
FROM Subscriptions s JOIN Plans p ON s.plan_id = p.plan_id
JOIN Customers c ON s.customer_id = c.customer_id
WHERE p.plan_name = 'Premium';

-- Q27. Subscriptions active for more than 30 days
SELECT subscription_id FROM Subscriptions WHERE DATEDIFF(end_date, start_date) > 30;

-- Q28. Monthly total calls made by all users
SELECT MONTH(usage_date) AS month, SUM(calls) AS total_calls
FROM `Usage` GROUP BY MONTH(usage_date);

-- Q29. Average payment per plan
SELECT plan_id, AVG(amount) FROM Payments GROUP BY plan_id;

-- Q30. Number of support queries resolved per customer
SELECT customer_id, COUNT(*) AS resolved_count
FROM CustomerSupport WHERE status = 'Resolved' GROUP BY customer_id;

-- Q31. Plans not purchased by anyone
SELECT plan_id FROM Plans
WHERE plan_id NOT IN (SELECT DISTINCT plan_id FROM Subscriptions);

-- Q32. Top data user in April 2025
SELECT customer_id, SUM(data_used) AS total_april_data
FROM `Usage` WHERE MONTH(usage_date)=4 AND YEAR(usage_date)=2025
GROUP BY customer_id
ORDER BY total_april_data DESC LIMIT 1;

-- Q33. Subscriptions starting in April 2025
SELECT * FROM Subscriptions WHERE MONTH(start_date) = 4 AND YEAR(start_date) = 2025;

-- Q34. Plans with highest data limit
SELECT * FROM Plans ORDER BY data_limit DESC LIMIT 1;

-- Q35. Daily usage report per user
SELECT c.name, u.usage_date, u.calls, u.sms, u.data_used
FROM `Usage` u JOIN Customers c ON u.customer_id = c.customer_id;

-- Q36. Payments via Paytm with amount > 500
SELECT p.* FROM Payments p WHERE p.method='Paytm' AND p.amount > 500;

-- Q37. Support queries still pending
SELECT * FROM CustomerSupport WHERE status = 'Pending';

-- Q38. Count of customers by city
SELECT city, COUNT(*) FROM Customers GROUP BY city;

-- Q39. Show total data used per city for April 2025
SELECT c.city, SUM(u.data_used)
FROM Customers c JOIN `Usage` u ON c.customer_id = u.customer_id
WHERE MONTH(u.usage_date) = 4 AND YEAR(u.usage_date) = 2025
GROUP BY c.city;

-- Q40. Average payment made per method
SELECT method, AVG(amount) FROM Payments GROUP BY method;

-- Q41. Total revenue for each plan
SELECT plan_id, SUM(amount) FROM Payments GROUP BY plan_id;