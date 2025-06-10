# 🚗 Car Rental Database

A fully normalized and modular SQL project for managing a car rental system. This project includes table definitions, sample data, reusable views, procedures, and shell scripts for automation and interaction with an Oracle database.

---

## 📁 Project Structure

```
car-rental-database/
├── README.md
├── LICENSE
├── schema/
│   └── create_tables.sql
├── data/
│   └── insert_data.sql
├── views/
│   └── views.sql
├── procedures/
│   └── complete_rental_function.sql
├── scripts/
│   ├── credentials_sample.sh
│   ├── drop_tables.sh
│   ├── menu.sh
│   ├── test_connection.sh
│   ├── view_customers.sh
│   ├── view_rentals.sh
│   └── query1.sh .. query5.sh
├── docs/
│   └── er_diagram.png (optional)
```

---

## 🧱 Features

- ✅ Normalized schema (3NF)
- ✅ Clean modular SQL design
- ✅ Realistic sample data
- ✅ Reusable views for reporting
- ✅ Stored procedures for business logic
- ✅ Bash scripts for automation & querying
- ✅ Oracle compatibility via `sqlplus64`
- ✅ Ready for use in school projects or enterprise mockups

---

## ▶️ Usage Guide

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/car-rental-database.git
cd car-rental-database
```

### 2. Set Up Database

In your Oracle SQL environment or compatible SQL tool:

```sql
-- Step 1: Create tables
@schema/create_tables.sql

-- Step 2: Insert sample data
@data/insert_data.sql

-- Step 3: Add views and stored procedures
@views/views.sql
@procedures/complete_rental_function.sql
```

> Replace `@` with `\i` if using PostgreSQL or psql.

---

## ⚙️ Shell Scripts (Optional for Oracle users)

### 🛡️ Credentials

Copy and edit the sample credentials:

```bash
cp scripts/credentials_sample.sh scripts/credentials.sh
```

Add your Oracle username and password in `credentials.sh`.

### 🔧 Common Scripts

```bash
bash scripts/test_connection.sh       # Test Oracle DB connection
bash scripts/view_customers.sh        # View all customers
bash scripts/view_rentals.sh          # View all rentals
bash scripts/drop_tables.sh           # Drop main tables (reset)
bash scripts/menu.sh                  # Interactive SQL query menu
```

---

## 📊 SQL Views Overview

| View Name               | Description                                  |
|------------------------|----------------------------------------------|
| `active_rentals`       | Shows currently confirmed rentals            |
| `customer_rental_summary` | Shows rental count and total spend per customer |
| `vehicle_status_summary` | Tracks usage and status of vehicles         |
| `payment_method_summary` | Aggregates payments by method               |

---

## 🔁 Stored Procedure

| Procedure Name      | Description                                     |
|---------------------|-------------------------------------------------|
| `complete_rental()` | Updates a rental status to `'Completed'`        |

Example (Oracle):
```sql
BEGIN
  complete_rental(1);
END;
/
```

---

## 📜 License

This project is licensed under the [MIT License](./LICENSE).

---

## 💡 Credits

Developed by Farbod Jalilfar
For academic, professional, and demonstration use.  
