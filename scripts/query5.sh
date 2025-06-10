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

SELECT rental_status, COUNT(r.rental_id) AS total_rentals, SUM(r.total_rental_cost) AS total_revenue
FROM rentals r
GROUP BY rental_status
ORDER BY total_revenue DESC;

exit;
EOF
