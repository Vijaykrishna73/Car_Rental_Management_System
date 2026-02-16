mysql> use CarRentalSystem;
Database changed
mysql> -- Create Tables
mysql> -- 1.Customer Table
mysql> CREATE TABLE Customer (
    ->     customer_id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     email VARCHAR(50),
    ->     phone VARCHAR(15)
    -> );
Query OK, 0 rows affected (0.18 sec)

mysql> -- 2.Car Table
mysql> CREATE TABLE Car (
    ->     car_id INT PRIMARY KEY,
    ->     brand VARCHAR(30),
    ->     model VARCHAR(30),
    ->     daily_rate DECIMAL(8,2),
    ->     total_cars INT
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> -- 3.Rental Table
mysql> CREATE TABLE Rental (
    ->     rental_id INT PRIMARY KEY,
    ->     customer_id INT,
    ->     car_id INT,
    ->     start_date DATE,
    ->     end_date DATE,
    ->     status VARCHAR(20),
    ->     FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    ->     FOREIGN KEY (car_id) REFERENCES Car(car_id)
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> -- 4.Payment Table
mysql> CREATE TABLE Payment (
    ->     payment_id INT PRIMARY KEY,
    ->     rental_id INT,
    ->     payment_mode VARCHAR(20),
    ->     amount DECIMAL(8,2),
    ->     payment_date DATE,
    ->     FOREIGN KEY (rental_id) REFERENCES Rental(rental_id)
    -> );
Query OK, 0 rows affected (0.08 sec)