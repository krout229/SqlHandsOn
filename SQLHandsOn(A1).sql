create database SalesDB

use SalesDB

create table salesman(salesman_id numeric(5) primary key,name varchar(30), city varchar(15),commission decimal(5,2))
insert salesman values(5001,'James Hoog','New York',0.15)
insert salesman values(5002,'Nail Knite','Paris',0.13)
insert salesman values(5005,'Pit Alex','London',0.11)
insert salesman values(5006,'Mc Lyon','Paris',0.14)
insert salesman values(5007,'Paul Adam','Rome',0.13)
insert salesman values(5003,'Lauson Hen','San Jose',0.12)
select * from salesman

create table customer(
customer_id numeric(5) primary key,
cust_name varchar(30), 
city varchar(15),
grade numeric(3),
salesman_id numeric(5) references salesman(salesman_id)
)
insert  customer values(3002,'Nick Rimando','New York',100,5001)
insert  customer values(3007,'Brad Davis','New York',200,5001)
insert  customer values(3005,'Graham Zusi','California',200,5002)
insert  customer values(3008,'Julian Green','London',300,5002)
insert  customer values(3004,'Fabian Jhonson','Paris',300,5006)
insert  customer values(3009,'Geoff Cameron','Berlin',100,5003)
insert  customer values(3003,'Jozy Altidor','Moscow',200,5007)
insert  customer (customer_id , cust_name , city,salesman_id) values(3001,'Brad Guzan','London',5005)
select*from customer

create table orders(
ord_no numeric(5) primary key,
purch_amt decimal(8,2),
ord_date date,
customer_id numeric (5) references customer(customer_id),
salesman_id numeric(5) references salesman(salesman_id)
)
insert  orders values(70001,150.5,'2012-10-05',3005,5002)
insert  orders values(70009,270.65,'2012-09-10',3001,5005)
insert  orders values(70002,65.26,'2012-10-05',3002,5001)
insert  orders values(70004,110.5,'2012-08-17',3009,5003)
insert  orders values(70007,948.5,'2012-09-10',3005,5002)
insert  orders values(70005,2400.6,'2012-07-27',3007,5001)
insert  orders values(70008,5760,'2012-09-10',3002,5001)
insert  orders values(70010,1983.43,'2012-10-10',3004,5006)
insert  orders values(70003,2480.4,'2012-10-10',3009,5003)
insert  orders values(70012,250.45,'2012-06-27',3008,5002)
insert  orders values(70011,75.29,'2012-08-17',3003,5007)
insert  orders values(70013,3045.6,'2012-04-25',3002,5001)


Select * from orders


SELECT ord_date, salesman_id, ord_no, purch_amt
FROM orders

SELECT DISTINCT salesman_id
FROM orders

SELECT name,city
FROM salesman
WHERE city='Paris'

SELECT ord_no, ord_date, purch_amt
FROM orders
WHERE salesman_id=5001

SELECT * 
FROM customer 
WHERE city = 'New York' AND grade>100

SELECT salesman_id,name,city,commission 
FROM salesman 
WHERE (commission > 0.10 
AND commission< 0.12)

SELECT sum(purch_amt) as 'total purchase amount' FROM orders 
SELECT avg(purch_amt) as 'average purchase amount' FROM orders


SELECT COUNT (DISTINCT salesman_id) as 'Number of salespeople' FROM orders

SELECT customer_id, MAX(purch_amt) as 'Max purchase amount' FROM orders group by customer_id

SELECT customer_id,ord_date,MAX(purch_amt)as'Highest purchase amount' FROM orders GROUP BY customer_id,ord_date

SELECT salesman_id,MAX(purch_amt)as'Highest purchase amount' FROM orders 
WHERE ord_date = '2012-08-17' 
GROUP BY salesman_id

SELECT salesman.name,
customer.cust_name, customer.city 
FROM salesman,customer 
WHERE salesman.city=customer.city

SELECT  orders.ord_no,orders.purch_amt,
customer.cust_name,customer.city 
FROM orders ,customer 
WHERE orders.customer_id=customer.customer_id 
AND orders.purch_amt BETWEEN 500 AND 2000


SELECT customer.cust_name as 'Customer Name', 
customer.city, salesman.name AS 'Salesman Name', salesman.commission 
FROM customer INNER JOIN salesman 
ON customer.salesman_id=salesman.salesman_id 
WHERE salesman.commission>0.12

SELECT customer.cust_name,customer.city,customer.grade, 
salesman.name  ,salesman.city 
FROM customer LEFT JOIN salesman 
ON customer.salesman_id=salesman.salesman_id 
order by customer.customer_id