#!/bin/bash

# Source the credentials
source ./credentials.sh

# Execute the query to show customers who have rented vehicles
sqlplus64 "${ORACLE_USER}/${ORACLE_PASS}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF
SET LINESIZE 150;
SET PAGESIZE 50;
COLUMN first_name FORMAT A20;
COLUMN last_name FORMAT A20;
COLUMN make FORMAT A20;
COLUMN model FORMAT A20;
COLUMN rental_start_date FORMAT A20;

SELECT c.first_name, c.last_name, v.make, v.model, r.rental_start_date
FROM customers c
JOIN rentals r ON c.customer_id = r.customer_id
JOIN vehicles v ON r.vehicle_id = v.vehicle_id
ORDER BY r.rental_start_date DESC;

exit;
EOF
