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

SELECT v.make, v.model, AVG(r.total_rental_cost) AS avg_rental_cost
FROM rentals r
JOIN vehicles v ON r.vehicle_id = v.vehicle_id
GROUP BY v.make, v.model
ORDER BY avg_rental_cost DESC;

exit;
EOF
