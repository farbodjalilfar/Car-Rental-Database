-- ===========================
-- Car Rental Database Schema
-- ===========================

-- Drop tables in reverse order for reset scripts
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS rental_contracts;
DROP TABLE IF EXISTS rentals;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS customers;

-- Table: Customers
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    street VARCHAR(100),
    city VARCHAR(50),
    postal_code VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: Vehicles
CREATE TABLE vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT CHECK (year >= 1990),
    license_plate VARCHAR(10) UNIQUE NOT NULL,
    status VARCHAR(20) CHECK (status IN ('Available', 'Rented', 'Maintenance')) DEFAULT 'Available',
    daily_rental_rate DECIMAL(10, 2) NOT NULL,
    vehicle_age INT GENERATED ALWAYS AS (EXTRACT(YEAR FROM CURRENT_DATE) - year) STORED,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: Employees
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: Rentals
CREATE TABLE rentals (
    rental_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    employee_id INT NOT NULL UNIQUE,
    rental_start_date DATE NOT NULL,
    rental_end_date DATE NOT NULL CHECK (rental_end_date >= rental_start_date),
    rental_status VARCHAR(20) CHECK (rental_status IN ('Confirmed', 'Completed', 'Cancelled')) DEFAULT 'Confirmed',
    total_rental_cost DECIMAL(10, 2) CHECK (total_rental_cost >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Table: Rental Contracts
CREATE TABLE rental_contracts (
    contract_id SERIAL PRIMARY KEY,
    rental_id INT UNIQUE NOT NULL,
    contract_terms TEXT,
    insurance_coverage VARCHAR(100),
    contract_signed_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (rental_id) REFERENCES rentals(rental_id)
);

-- Table: Payments
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    rental_id INT UNIQUE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount >= 0),
    payment_date DATE NOT NULL,
    payment_method VARCHAR(20) CHECK (payment_method IN ('Credit Card', 'Debit Card', 'Cash')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (rental_id) REFERENCES rentals(rental_id)
);
