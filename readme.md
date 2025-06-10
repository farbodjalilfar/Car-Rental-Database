# 🚗 Car Rental Database System

A modular, normalized SQL-based project designed to manage a car rental system. This project includes a fully relational schema, sample data, stored procedures, SQL views, and shell scripts for Oracle database automation. Ideal for academic projects, demos, or small-scale deployments.

---

## 📦 Features

- 🧱 Normalized SQL schema (3NF)
- 📋 Sample data for testing and demonstration
- 🔁 Stored procedure for business logic
- 📊 Predefined SQL views for reporting
- 🖥️ Shell scripts for automation and interaction with Oracle DB
- 🧪 Testable and modular project layout
- 🐘 PostgreSQL-compatible with slight syntax adjustments

---

## 📁 Folder Structure

```
Car-Rental-Database/
├── README.md
├── LICENSE
├── .gitignore
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
│   ├── test_connection.sh
│   ├── view_customers.sh
│   ├── view_rentals.sh
│   ├── menu.sh
│   └── query1.sh → query5.sh
├── docs/
│   └── er_diagram.png
```

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/farbodjalilfar/Car-Rental-Database.git
cd Car-Rental-Database
```

### 2. Prepare Your Oracle Credentials

Copy the credentials template and update it:

```bash
cp scripts/credentials_sample.sh scripts/credentials.sh
```


---

## 🛠️ Usage Instructions

### Step 1: Create Tables

```sql
@schema/create_tables.sql
```

### Step 2: Insert Sample Data

```sql
@data/insert_data.sql
```

### Step 3: Add Views and Procedures

```sql
@views/views.sql
@procedures/complete_rental_function.sql
```

> Use `\i` instead of `@` if you're using PostgreSQL.

---

## 🧪 Shell Scripts (Oracle CLI)

Make sure you have `sqlplus64` installed. Then:

```bash
bash scripts/test_connection.sh      # Check DB connection
bash scripts/view_customers.sh       # Display all customers
bash scripts/view_rentals.sh         # Display all rentals
bash scripts/drop_tables.sh          # Drop/reset tables
bash scripts/menu.sh                 # Run interactive query menu
```

---

## 📊 SQL Views Overview

| View Name                | Description                                  |
|-------------------------|----------------------------------------------|
| `active_rentals`        | Shows active/confirmed rentals               |
| `customer_rental_summary` | Total rentals and spending per customer     |
| `vehicle_status_summary` | Usage stats and status per vehicle          |
| `payment_method_summary` | Breakdown of payments by method             |

---

## 🧠 Stored Procedure

| Procedure Name     | Description                        |
|--------------------|------------------------------------|
| `complete_rental()` | Marks a rental as 'Completed'      |

**Usage Example:**

```sql
BEGIN
  complete_rental(1);
END;
/
```

---

## 🧾 License

This project is licensed under the [MIT License](./LICENSE).

---

## 🙋‍♂️ Author

**Farbod Jalilfar**  
For academic use and practical database system demonstration.  
Feel free to fork, star, and contribute!
