
mysql> -- QUERIES
mysql> -- EASY
mysql> -- 1. Show all cars
mysql>  SELECT * FROM Car;
+--------+------------+--------+------------+------------+
| car_id | brand      | model  | daily_rate | total_cars |
+--------+------------+--------+------------+------------+
|   2001 | Hyundai    | Creta  |    3000.00 |         10 |
|   2002 | Maruti     | Swift  |    2000.00 |         15 |
|   2003 | Honda      | City   |    3500.00 |          8 |
|   2004 | Toyota     | Innova |    4500.00 |          6 |
|   2005 | Kia        | Seltos |    3200.00 |          9 |
|   2006 | Tata       | Nexon  |    2800.00 |         12 |
|   2007 | Mahindra   | XUV700 |    5000.00 |          5 |
|   2008 | Renault    | Kwid   |    1800.00 |         20 |
|   2009 | Skoda      | Slavia |    3800.00 |          7 |
|   2010 | Volkswagen | Virtus |    4000.00 |          6 |
+--------+------------+--------+------------+------------+
10 rows in set (0.02 sec)

mysql> -- 2. Count total customers
mysql>  SELECT COUNT(*) AS total_customers FROM Customer;
+-----------------+
| total_customers |
+-----------------+
|              10 |
+-----------------+
1 row in set (0.03 sec)

mysql> -- 3. Show all booked rentals
mysql>  SELECT * FROM Rental WHERE status='Booked';
+-----------+-------------+--------+------------+------------+--------+
| rental_id | customer_id | car_id | start_date | end_date   | status |
+-----------+-------------+--------+------------+------------+--------+
|      3001 |        1001 |   2001 | 2026-03-01 | 2026-03-05 | Booked |
|      3002 |        1002 |   2002 | 2026-03-02 | 2026-03-04 | Booked |
|      3004 |        1004 |   2004 | 2026-03-06 | 2026-03-10 | Booked |
|      3005 |        1005 |   2001 | 2026-03-08 | 2026-03-12 | Booked |
|      3006 |        1006 |   2005 | 2026-03-10 | 2026-03-13 | Booked |
|      3007 |        1007 |   2006 | 2026-03-11 | 2026-03-15 | Booked |
|      3008 |        1008 |   2007 | 2026-03-12 | 2026-03-14 | Booked |
|      3009 |        1009 |   2008 | 2026-03-14 | 2026-03-18 | Booked |
|      3010 |        1010 |   2009 | 2026-03-15 | 2026-03-20 | Booked |
+-----------+-------------+--------+------------+------------+--------+
9 rows in set (0.02 sec)

mysql> -- 4. Show distinct payment modes
mysql>  SELECT DISTINCT payment_mode FROM Payment;
+--------------+
| payment_mode |
+--------------+
| UPI          |
| Credit Card  |
| Debit Card   |
+--------------+
3 rows in set (0.01 sec)

mysql> -- 5. Show cars with daily rate above 3000
mysql>  SELECT brand, model FROM Car WHERE daily_rate > 3000;
+------------+--------+
| brand      | model  |
+------------+--------+
| Honda      | City   |
| Toyota     | Innova |
| Kia        | Seltos |
| Mahindra   | XUV700 |
| Skoda      | Slavia |
| Volkswagen | Virtus |
+------------+--------+
6 rows in set (0.01 sec)

mysql>
mysql> -- 6. Customers whose name starts with ‘R’
mysql>  SELECT * FROM Customer WHERE name LIKE 'R%';
+-------------+--------------+------------------+------------+
| customer_id | name         | email            | phone      |
+-------------+--------------+------------------+------------+
|        1001 | Ramesh Reddy | ramesh@gmail.com | 9848012345 |
+-------------+--------------+------------------+------------+
1 row in set (0.01 sec)

mysql> -- 7. Count total rentals
mysql>  SELECT COUNT(*) AS total_rentals FROM Rental;
+---------------+
| total_rentals |
+---------------+
|            10 |
+---------------+
1 row in set (0.00 sec)

mysql> -- 8. Show cancelled rentals
mysql>  SELECT * FROM Rental WHERE status='Cancelled';
+-----------+-------------+--------+------------+------------+-----------+
| rental_id | customer_id | car_id | start_date | end_date   | status    |
+-----------+-------------+--------+------------+------------+-----------+
|      3003 |        1003 |   2003 | 2026-03-05 | 2026-03-07 | Cancelled |
+-----------+-------------+--------+------------+------------+-----------+
1 row in set (0.00 sec)

mysql> -- MEDIUM
mysql> -- 1. Total rentals per car
mysql>  SELECT car_id, COUNT(*) AS total_rentals
    ->  FROM Rental
    ->  GROUP BY car_id;
+--------+---------------+
| car_id | total_rentals |
+--------+---------------+
|   2001 |             2 |
|   2002 |             1 |
|   2003 |             1 |
|   2004 |             1 |
|   2005 |             1 |
|   2006 |             1 |
|   2007 |             1 |
|   2008 |             1 |
|   2009 |             1 |
+--------+---------------+
9 rows in set (0.01 sec)

mysql> -- 2. Total revenue per car
mysql>  SELECT c.car_id, c.brand, c.model, SUM(p.amount) AS revenue
    ->  FROM Car c
    ->  JOIN Rental r ON c.car_id = r.car_id
    ->  JOIN Payment p ON r.rental_id = p.rental_id
    ->  GROUP BY c.car_id, c.brand, c.model;
+--------+----------+--------+----------+
| car_id | brand    | model  | revenue  |
+--------+----------+--------+----------+
|   2001 | Hyundai  | Creta  | 30000.00 |
|   2002 | Maruti   | Swift  |  4000.00 |
|   2004 | Toyota   | Innova | 18000.00 |
|   2005 | Kia      | Seltos |  9600.00 |
|   2006 | Tata     | Nexon  | 14000.00 |
|   2007 | Mahindra | XUV700 | 10000.00 |
|   2008 | Renault  | Kwid   |  7200.00 |
|   2009 | Skoda    | Slavia | 19000.00 |
+--------+----------+--------+----------+
8 rows in set (0.01 sec)

mysql> -- 3. Available cars per model
mysql>  SELECT c.car_id,
	-> 	c.total_cars - COUNT(CASE WHEN r.status='Booked' THEN 1 END) AS available_cars
    ->  FROM Car c
    ->  LEFT JOIN Rental r ON c.car_id = r.car_id
    ->  GROUP BY c.car_id, c.total_cars;
+--------+----------------+
| car_id | available_cars |
+--------+----------------+
|   2001 |              8 |
|   2002 |             14 |
|   2003 |              8 |
|   2004 |              5 |
|   2005 |              8 |
|   2006 |             11 |
|   2007 |              4 |
|   2008 |             19 |
|   2009 |              6 |
|   2010 |              6 |
+--------+----------------+
10 rows in set (0.01 sec)

mysql> -- 4. Total spending per customer
mysql>  SELECT cu.customer_id, cu.name, SUM(p.amount) AS total_spent
    ->  FROM Customer cu
    ->  JOIN Rental r ON cu.customer_id = r.customer_id
    ->  JOIN Payment p ON r.rental_id = p.rental_id
    ->  GROUP BY cu.customer_id, cu.name;
+-------------+----------------+-------------+
| customer_id | name           | total_spent |
+-------------+----------------+-------------+
|        1001 | Ramesh Reddy   |    18000.00 |
|        1002 | Suresh Naidu   |     4000.00 |
|        1004 | Kiran Kumar    |    18000.00 |
|        1005 | Lakshmi Devi   |    12000.00 |
|        1006 | Venkat Sai     |     9600.00 |
|        1007 | Sravani        |    14000.00 |
|        1008 | Mahesh Babu    |    10000.00 |
|        1009 | Divya Priya    |     7200.00 |
|        1010 | Harsha Vardhan |    19000.00 |
+-------------+----------------+-------------+
9 rows in set (0.00 sec)

mysql>  -- 5. Cars rented more than once
mysql>  SELECT car_id, COUNT(*) AS rental_count
    ->  FROM Rental
    ->  GROUP BY car_id
    ->  HAVING rental_count > 1;
+--------+--------------+
| car_id | rental_count |
+--------+--------------+
|   2001 |            2 |
+--------+--------------+
1 row in set (0.01 sec)

mysql> -- 6. Average daily rental rate
mysql>  SELECT AVG(daily_rate) AS avg_daily_rate FROM Car;
+----------------+
| avg_daily_rate |
+----------------+
|    3360.000000 |
+----------------+
1 row in set (0.01 sec)

mysql> -- 7. Highest rental payment
mysql>  SELECT MAX(amount) AS highest_payment FROM Payment;
+-----------------+
| highest_payment |
+-----------------+
|        19000.00 |
+-----------------+
1 row in set (0.01 sec)

mysql> -- 8. Rental count per customer
mysql>  SELECT customer_id, COUNT(*) AS total_rentals
    ->  FROM Rental
    ->  GROUP BY customer_id;
+-------------+---------------+
| customer_id | total_rentals |
+-------------+---------------+
|        1001 |             1 |
|        1002 |             1 |
|        1003 |             1 |
|        1004 |             1 |
|        1005 |             1 |
|        1006 |             1 |
|        1007 |             1 |
|        1008 |             1 |
|        1009 |             1 |
|        1010 |             1 |
+-------------+---------------+
10 rows in set (0.00 sec)

mysql> -- HARD
mysql> -- 1. Customers who rented Hyundai cars
mysql>  SELECT DISTINCT cu.name
    ->  FROM Customer cu
    ->  JOIN Rental r ON cu.customer_id = r.customer_id
    ->  JOIN Car c ON r.car_id = c.car_id
    ->  WHERE c.brand = 'Hyundai';
+--------------+
| name         |
+--------------+
| Ramesh Reddy |
| Lakshmi Devi |
+--------------+
2 rows in set (0.00 sec)

mysql> -- 2. Customers who paid using UPI
mysql>  SELECT cu.name, p.payment_mode
    ->  FROM Customer cu
    ->  JOIN Rental r ON cu.customer_id = r.customer_id
    ->  JOIN Payment p ON r.rental_id = p.rental_id
    ->  WHERE p.payment_mode = 'UPI';
+--------------+--------------+
| name         | payment_mode |
+--------------+--------------+
| Ramesh Reddy | UPI          |
| Lakshmi Devi | UPI          |
| Sravani      | UPI          |
| Divya Priya  | UPI          |
+--------------+--------------+
4 rows in set (0.00 sec)

mysql> -- 3. Total rentals per brand
mysql>  SELECT c.brand, COUNT(r.rental_id) AS total_rentals
    ->  FROM Car c
    ->  JOIN Rental r ON c.car_id = r.car_id
    ->  GROUP BY c.brand;
+----------+---------------+
| brand    | total_rentals |
+----------+---------------+
| Hyundai  |             2 |
| Maruti   |             1 |
| Honda    |             1 |
| Toyota   |             1 |
| Kia      |             1 |
| Tata     |             1 |
| Mahindra |             1 |
| Renault  |             1 |
| Skoda    |             1 |
+----------+---------------+
9 rows in set (0.00 sec)

mysql> -- 4. Brand with highest revenue
mysql>  SELECT c.brand, SUM(p.amount) AS revenue
    ->  FROM Car c
    ->  JOIN Rental r ON c.car_id = r.car_id
    ->  JOIN Payment p ON r.rental_id = p.rental_id
    ->  GROUP BY c.brand
    ->  ORDER BY revenue DESC
    ->  LIMIT 1;
+---------+----------+
| brand   | revenue  |
+---------+----------+
| Hyundai | 30000.00 |
+---------+----------+
1 row in set (0.00 sec)

mysql> -- 5. Revenue generated by each brand
mysql>  SELECT c.brand, SUM(p.amount) AS revenue
    ->  FROM Car c
    ->  JOIN Rental r ON c.car_id = r.car_id
    ->  JOIN Payment p ON r.rental_id = p.rental_id
    ->  GROUP BY c.brand;
+----------+----------+
| brand    | revenue  |
+----------+----------+
| Hyundai  | 30000.00 |
| Maruti   |  4000.00 |
| Toyota   | 18000.00 |
| Kia      |  9600.00 |
| Tata     | 14000.00 |
| Mahindra | 10000.00 |
| Renault  |  7200.00 |
| Skoda    | 19000.00 |
+----------+----------+
8 rows in set (0.01 sec)

mysql> -- 6. Customer who spent the most
mysql>  SELECT cu.customer_id, cu.name, SUM(p.amount) AS total_spent
    ->  FROM Customer cu
    ->  JOIN Rental r ON cu.customer_id = r.customer_id
    ->  JOIN Payment p ON r.rental_id = p.rental_id
    ->  GROUP BY cu.customer_id, cu.name
    ->  ORDER BY total_spent DESC
    ->  LIMIT 1;
+-------------+----------------+-------------+
| customer_id | name           | total_spent |
+-------------+----------------+-------------+
|        1010 | Harsha Vardhan |    19000.00 |
+-------------+----------------+-------------+
1 row in set (0.00 sec)

mysql> -- 7. Rentals longer than 3 days
mysql>  SELECT rental_id,
    ->  DATEDIFF(end_date, start_date) AS rental_days
    ->  FROM Rental
    ->  WHERE DATEDIFF(end_date, start_date) > 3;
+-----------+-------------+
| rental_id | rental_days |
+-----------+-------------+
|      3001 |           4 |
|      3004 |           4 |
|      3005 |           4 |
|      3007 |           4 |
|      3009 |           4 |
|      3010 |           5 |
+-----------+-------------+
6 rows in set (0.02 sec)

mysql> -- 8. Cars rented by more than one customer
mysql>  SELECT car_id, COUNT(DISTINCT customer_id) AS customer_count
    ->  FROM Rental
    ->  GROUP BY car_id
    ->  HAVING customer_count > 1;
+--------+----------------+
| car_id | customer_count |
+--------+----------------+
|   2001 |              2 |
+--------+----------------+
1 row in set (0.01 sec)