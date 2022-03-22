--1
SELECT * from orders where salesman_id in (SELECT salesman_id FROM salesman where name='Paul Adam')
--2
SELECT * from orders where salesman_id in (SELECT salesman_id FROM salesman where city='London')
--3
SELECT * from orders where salesman_id  in( SELECT distinct salesman_id FROM orders where customer_id=3007)
--4
SELECT * from orders where purch_amt>(SELECT AVG(purch_amt) FROM orders where ord_date='10-10-2012')
--5
SELECT * from orders where salesman_id =(SELECT salesman_id from salesman where city = 'New York')
--6
SELECT salesman_id,name from salesman WHERE 1<(Select count(*) from customer where salesman_id = salesman.salesman_id)
--7
SELECT * from orders a where purch_amt>(SELECT avg(purch_amt) from orders b where b.customer_id=a.customer_id)
--8
SELECT ord_date,sum(purch_amt) from orders a Group by ord_date having sum(purch_amt)>(SELECT 1000.00 + max(purch_amt)
FROM orders b where a.ord_date=b.ord_date)
--9
SELECT customer_id,cust_name,city FROM customer where exists (Select * from customer where city='London')
--10
SELECT * from salesman where salesman_id in(Select distinct salesman_id from customer a where exists (select * from
customer b where b.salesman_id=a.salesman_id AND b.cust_name<>a.cust_name))