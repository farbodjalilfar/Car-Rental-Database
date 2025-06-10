-- ===================================
-- Car Rental Database Sample Data
-- ===================================

-- =========================
-- Customers
-- =========================
INSERT INTO customers (first_name, last_name, email, phone, street, city, postal_code)
VALUES 
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St', 'Toronto', 'M5V1E3'),
('Alice', 'Johnson', 'alice.johnson@example.com', '9876543210', '456 Elm St', 'Toronto', 'M5A1B6'),
('Bob', 'Williams', 'bob.williams@example.com', '5647382910', '789 Oak St', 'Mississauga', 'L5B3C9');

-- =========================
-- Vehicles
-- =========================
INSERT INTO vehicles (make, model, year, license_plate, status, daily_rental_rate)
VALUES 
('Toyota', 'Camry', 2018, 'AB123CD', 'Available', 50.00),
('Honda', 'Civic', 2019, 'XY456ZT', 'Available', 55.00),
('Ford', 'Fiesta', 2021, 'GH123JK', 'Rented', 60.00);

-- =========================
-- Employees
-- =========================
INSERT INTO employees (first_name, last_name, position, email)
VALUES 
('Soroush', 'Smith', 'Manager', 'soroush.manager@example.com'),
('Farbod', 'White', 'IT Support', 'farbod.white@example.com'),
('Omar', 'Adam', 'Clerk', 'omar.adam@example.com');

-- =========================
-- Rentals
-- =========================
-- Assumes auto-incrementing rental_id
INSERT INTO rentals (customer_id, vehicle_id, employee_id, rental_start_date, rental_end_date, rental_status, total_rental_cost)
VALUES 
(1, 1, 1, DATE '2024-09-25', DATE '2024-09-30', 'Confirmed', 250.00),
(2, 2, 2, DATE '2024-10-01', DATE '2024-10-05', 'Confirmed', 220.00),
(3, 3, 3, DATE '2024-10-10', DATE '2024-10-12', 'Completed', 120.00);

-- =========================
-- Rental Contracts
-- =========================
INSERT INTO rental_contracts (rental_id, contract_terms, insurance_coverage, contract_signed_date)
VALUES 
(1, 'Full coverage with zero deductible', 'Yes', DATE '2024-09-25'),
(2, 'Basic coverage only', 'No', DATE '2024-10-01'),
(3, 'Basic coverage with limited liability', 'Yes', DATE '2024-10-10');

-- =========================
-- Payments
-- =========================
INSERT INTO payments (rental_id, amount, payment_date, payment_method)
VALUES 
(1, 250.00, DATE '2024-09-25', 'Credit Card'),
(2, 220.00, DATE '2024-10-01', 'Debit Card'),
(3, 120.00, DATE '2024-10-10', 'Cash');
