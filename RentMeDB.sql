USE RentMeDB

-- ====================
-- 1. Customers Table
-- ====================
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    driver_license VARCHAR(50)
);

INSERT INTO Customers (name, email, phone, driver_license)
VALUES 
('Ali Mostafa', 'ali@example.com', '01012345678', 'DL12345'),
('Sara Ahmed', 'sara@example.com', '01166558855', 'DL53921'),
('Mostafa', 'Mostafa@example.com', '01019853678', 'DL12965'),
('AHMED', 'AHMED@example.com', '01458245678', 'DL12455'),
('MOHAMED', 'MOHAMED@example.com', '01551345678', 'DL13695'),
('LAMA', 'LAMA@example.com', '01098412678', 'DL95145'),
('JOUD', 'JOUD@example.com', '01016575678', 'DL18745'),
('HANA', 'HANA@example.com', '01012345841', 'DL12395'),
('FATIMA', 'FATIMA@example.com', '01012668678', 'DL85345'),
('MERA', 'MERA@example.com', '01012348478', 'DL16545');

-- ====================
-- 2. Cars Table
-- ====================
CREATE TABLE Cars (
    car_id INT PRIMARY KEY IDENTITY(1,1),
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    status VARCHAR(20),
    price_per_day DECIMAL(10,2)
);

INSERT INTO Cars (make, model, year, status, price_per_day)
VALUES 
('Toyota', 'Corolla', 2021, 'Available', 400.00),
('MG', '7', 2021, 'Available', 400.00),
('LEXUS', 'LX', 2021, 'Available', 800.00),
('NISSAN', 'PATROL', 2021, 'Available', 600.00),
('VOLKSWAGEN', 'SUV', 2021, 'Available', 500.00),
('BMW', 'M5', 2021, 'Available', 900.00),
('KIA', 'SPORTAGE', 2021, 'Available', 400.00),
('CHEVORLET', 'CRUZE', 2021, 'Available', 400.00),
('AUDI', 'A3', 2021, 'Available', 900.00),
('Hyundai', 'Elantra', 2022, 'Available', 450.00);

-- ====================
-- 3. Employees Table
-- ====================
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    password_hash VARCHAR(255),
    role VARCHAR(50)
);

INSERT INTO Employees (name, email, phone, password_hash, role)
VALUES 
('Taqwa Ammar', 'Taqwa@rentme.com', '01233445566', 'hashed_pw1', 'Staff'),
('Kareem Nabil', 'kareem@rentme.com', '01555667788', 'hashed_pw2', 'Staff'),
('Ahmed Galal', 'Ahmed@rentme.com', '01236436621', 'hashed_pw3', 'Staff'),
('Mohamed ismail', 'Mohamed@rentme.com', '01233668866', 'hashed_pw4', 'Staff'),
('Hazem Ahmed', 'Hazem@rentme.com', '01555663658', 'hashed_pw5', 'Staff'),
('Salma Mohamed', 'Salma@rentme.com', '01278945566', 'hashed_pw6', 'Manager'),
('haneen Zaher', 'haneen@rentme.com', '0123951566', 'hashed_pw7', 'Staff'),
('Arwa Yasser', 'Arwa@rentme.com', '01555753788', 'hashed_pw8', 'Staff'),
('kazim Youssef', 'Kazim@rentme.com', '01235285566', 'hashed_pw9', 'Staff'),
('Nour Hossam', 'Nour@rentme.com', '01233842566', 'hashed_pw10', 'Staff'),
('Asmaa Salah', 'Asmaa@rentme.com', '01555645688', 'hashed_pw11', 'Staff');


select * from Employees;


-- ====================
-- 4. Reservations Table
-- ====================
CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    car_id INT FOREIGN KEY REFERENCES Cars(car_id),
    employee_id INT FOREIGN KEY REFERENCES Employees(employee_id),
    start_date DATE,
    end_date DATE,
    status VARCHAR(20)
);

INSERT INTO Reservations (customer_id, car_id, employee_id, start_date, end_date, status)
VALUES 
(1, 1, 1, '2025-05-01', '2025-05-10', 'Booked'),
(2, 2, 2, '2025-05-02', '2025-05-12', 'Booked'),
(3, 3, 3, '2025-05-03', '2025-05-14', 'available'),
(4, 4, 4, '2025-05-04', '2025-05-16', 'Booked'),
(5, 5, 5, '2025-05-05', '2025-05-18', 'available'),
(6, 6, 6, '2025-05-06', '2025-05-20', 'Booked'),
(7, 7, 7, '2025-05-07', '2025-05-22', 'available'),
(8, 8, 8, '2025-05-08', '2025-05-24', 'available'),
(9, 9, 9, '2025-05-09', '2025-05-26', 'Booked'),
(10, 10, 10, '2025-05-10', '2025-05-28', 'available');

-- ====================
-- 5. Payments Table
-- ====================
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    reservation_id INT FOREIGN KEY REFERENCES Reservations(reservation_id),
    employee_id INT FOREIGN KEY REFERENCES Employees(employee_id),
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    payment_status VARCHAR(20)
);

INSERT INTO Payments (reservation_id, employee_id, payment_date, amount, payment_method, payment_status)
VALUES 
(1, 1, '2025-05-01', 2000.00, 'Card', 'Paid'),
(2, 2, '2025-05-02', 1800.00, 'Cash', 'Paid'),
(3, 3, '2025-05-03',8000 , 'Card', 'Paid'),
(4, 4, '2025-05-04', 20000, 'Card', 'Pinding'),
(5, 5, '2025-05-05',6000 , 'Cash', 'Paid'),
(6, 6, '2025-05-06',55000, 'Card', 'Pinding'),
(7, 7, '2025-05-07',10000 , 'Card', 'Paid'),
(8, 8, '2025-05-08',7000 , 'Cash', 'Paid'),
(9, 9, '2025-05-09',5000.00 , 'Card', 'Pinding'),
(10, 10, '2025-05-10', 90000.00, 'Card', 'Paid');
 
BEGIN TRY
	BEGIN TRANSACTION;

	INSERT INTO Cars (make, model, year, status, price_per_day)
	VALUES ('MERCEDES-BENZ', 'MAYBACH' , '2025', 'RENTED', '5000' );

	

	INSERT INTO Employees (name, email, phone, password_hash, role) 
	VALUES ('AML', 'AML@RENTME.COM', '01213141516', 'HASHED_AML','OWNER');

	commit TRANSACTION;
	print 'completed successfully';

end try
begin catch
	
	rollback TRANSACTION;
	print 'failed';
end catch

-- making roles 
CREATE ROLE ManagerRole;
CREATE ROLE StaffRole;
CREATE ROLE OwnerRole;

-- owner power (full)
GRANT SELECT, INSERT, UPDATE, DELETE ON Customers TO OwnerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Cars TO OwnerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Reservations TO OwnerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Payments TO OwnerRole;

--  manger power
GRANT SELECT, INSERT, UPDATE ON Customers TO ManagerRole;
GRANT SELECT, INSERT, UPDATE ON Cars TO ManagerRole;
GRANT SELECT, INSERT, UPDATE ON Reservations TO ManagerRole;
GRANT SELECT, INSERT, UPDATE ON Payments TO ManagerRole;
REVOKE  DELETE ON Customers TO ManagerRole; 

--  Employee power 
GRANT SELECT, INSERT ON Customers TO StaffRole;
GRANT SELECT ON Cars TO StaffRole;
GRANT SELECT, INSERT, UPDATE ON Reservations TO StaffRole;
GRANT SELECT, INSERT ON Payments TO StaffRole;
REVOKE  DELETE ON Reservations TO StaffRole;
Deny insert on cars to StaffRole;

CREATE LOGIN RentMeManager WITH PASSWORD = 'StrongPassword123!';
CREATE LOGIN RentMeStaff WITH PASSWORD = 'StrongPassword234!';
CREATE LOGIN RentMeOner WITH PASSWORD = 'StrongPassword345!';

CREATE USER RentMeManager FOR LOGIN RentMeManager;
CREATE USER RentMeStaff FOR LOGIN RentMeStaff;
CREATE USER RentMeOner FOR LOGIN RentMeOner;

EXEC sp_addrolemember 'ManagerRole', 'RentMeManager';
EXEC sp_addrolemember 'StaffRole', 'RentMeStaff';
EXEC sp_addrolemember 'OnerRole', 'RentMeOner';

SELECT name FROM sys.sql_logins WHERE name = 'RentMeManager';
SELECT name FROM sys.sql_logins WHERE name = 'RentMeStaff';
SELECT name FROM sys.sql_logins WHERE name = 'RentMeOner';

