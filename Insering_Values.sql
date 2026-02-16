mysql> -- Insert Values Into Tables
mysql> -- 1.Customer Table
mysql>  INSERT INTO Customer VALUES
    ->  (1001,'Ramesh Reddy','ramesh@gmail.com','9848012345'),
    ->  (1002,'Suresh Naidu','suresh@gmail.com','9848023456'),
    ->  (1003,'Anitha Rao','anitha@gmail.com','9848034567'),
    ->  (1004,'Kiran Kumar','kiran@gmail.com','9848045678'),
    ->  (1005,'Lakshmi Devi','lakshmi@gmail.com','9848056789'),
    ->  (1006,'Venkat Sai','venkat@gmail.com','9848067890'),
    ->  (1007,'Sravani','sravani@gmail.com','9848078901'),
    ->  (1008,'Mahesh Babu','mahesh@gmail.com','9848089012'),
    ->  (1009,'Divya Priya','divya@gmail.com','9848090123'),
    ->  (1010,'Harsha Vardhan','harsha@gmail.com','9848001234');
Query OK, 10 rows affected (0.06 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> -- 2.Car Table
mysql>  INSERT INTO Car VALUES
    ->  (2001,'Hyundai','Creta',3000,10),
    ->  (2002,'Maruti','Swift',2000,15),
    ->  (2003,'Honda','City',3500,8),
    ->  (2004,'Toyota','Innova',4500,6),
    ->  (2005,'Kia','Seltos',3200,9),
    ->  (2006,'Tata','Nexon',2800,12),
    ->  (2007,'Mahindra','XUV700',5000,5),
    ->  (2008,'Renault','Kwid',1800,20),
    ->  (2009,'Skoda','Slavia',3800,7),
    ->  (2010,'Volkswagen','Virtus',4000,6);
Query OK, 10 rows affected (0.02 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> -- 3.Rental Table
mysql>  INSERT INTO Rental VALUES
    ->  (3001,1001,2001,'2026-03-01','2026-03-05','Booked'),
    ->  (3002,1002,2002,'2026-03-02','2026-03-04','Booked'),
    ->  (3003,1003,2003,'2026-03-05','2026-03-07','Cancelled'),
    ->  (3004,1004,2004,'2026-03-06','2026-03-10','Booked'),
    ->  (3005,1005,2001,'2026-03-08','2026-03-12','Booked'),
    ->  (3006,1006,2005,'2026-03-10','2026-03-13','Booked'),
    ->  (3007,1007,2006,'2026-03-11','2026-03-15','Booked'),
    ->  (3008,1008,2007,'2026-03-12','2026-03-14','Booked'),
    ->  (3009,1009,2008,'2026-03-14','2026-03-18','Booked'),
    ->  (3010,1010,2009,'2026-03-15','2026-03-20','Booked');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> -- 4.Payment Table

mysql>  INSERT INTO Payment VALUES
    ->  (4001,3001,'UPI',12000,'2026-02-25'),
    ->  (4002,3002,'Credit Card',4000,'2026-02-26'),
    ->  (4003,3004,'Debit Card',18000,'2026-02-28'),
    ->  (4004,3005,'UPI',12000,'2026-03-01'),
    ->  (4005,3006,'Credit Card',9600,'2026-03-05'),
    ->  (4006,3007,'UPI',14000,'2026-03-06'),
    ->  (4007,3008,'Debit Card',10000,'2026-03-07'),
    ->  (4008,3009,'UPI',7200,'2026-03-08'),
    ->  (4009,3010,'Credit Card',19000,'2026-03-09'),
    ->  (4010,3001,'Debit Card',6000,'2026-03-10');
Query OK, 10 rows affected (0.02 sec)
Records: 10  Duplicates: 0  Warnings: 0