-- ==============================================
-- Car Rental Database - Reusable SQL Views
-- ==============================================

-- ===========================
-- View 1: Active Rentals
-- ===========================
CREATE OR REPLACE VIEW active_rentals AS
SELECT
    r.rental_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    v.make || ' ' || v.model AS vehicle,
    r.rental_start_date,
    r.rental_end_date,
    r.total_rental_cost
FROM rentals r
JOIN customers c ON r.customer_id = c.customer_id
JOIN vehicles v ON r.vehicle_id = v.vehicle_id
WHERE r.rental_status = 'Confirmed';

-- ===========================
-- View 2: Rental Summary Per Customer
-- ===========================
CREATE OR REPLACE VIEW customer_rental_summary AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(r.rental_id) AS total_rentals,
    SUM(r.total_rental_cost) AS total_spent
FROM customers c
LEFT JOIN rentals r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- ===========================
-- View 3: Vehicles with Current Status
-- ===========================
CREATE OR REPLACE VIEW vehicle_status_summary AS
SELECT
    v.vehicle_id,
    v.make,
    v.model,
    v.year,
    v.license_plate,
    v.status,
    COUNT(r.rental_id) AS times_rented
FROM vehicles v
LEFT JOIN rentals r ON v.vehicle_id = r.vehicle_id
GROUP BY v.vehicle_id, v.make, v.model, v.year, v.license_plate, v.status;

-- ===========================
-- View 4: Payments Summary by Method
-- ===========================
CREATE OR REPLACE VIEW payment_method_summary AS
SELECT
    payment_method,
    COUNT(payment_id) AS total_transactions,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_method;
