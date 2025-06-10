#!/bin/bash

# Source the credentials
source ./credentials.sh

# Execute the query to show total rentals per customer
sqlplus64 "${ORACLE_USER}/${ORACLE_PASS}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF
SET LINESIZE 150;
SET PAGESIZE 50;
COLUMN first_name FORMAT A20;
COLUMN last_name FORMAT A20;
COLUMN total_rentals FORMAT 999;

SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals
FROM customers c
JOIN rentals r ON c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_rentals DESC;

exit;
EOF
