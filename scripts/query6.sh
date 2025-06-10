#!/bin/bash

# Source the credentials
source ./credentials.sh

# Execute the query for customers with completed or ongoing rentals
sqlplus64 "${ORACLE_USER}/${ORACLE_PASS}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF
SET LINESIZE 150;
SET PAGESIZE 50;
COLUMN customer_id FORMAT 9999;
COLUMN first_name FORMAT A20;
COLUMN last_name FORMAT A20;
COLUMN rental_status FORMAT A10;

(
    SELECT c.customer_id, c.first_name, c.last_name, 'Completed' AS rental_status
    FROM customers c
    WHERE EXISTS (
        SELECT 1
        FROM rentals r
        WHERE r.customer_id = c.customer_id AND r.rental_status = 'completed'
    )
)
UNION
(
    SELECT c.customer_id, c.first_name, c.last_name, 'Ongoing' AS rental_status
    FROM customers c
    WHERE EXISTS (
        SELECT 1
        FROM rentals r
        WHERE r.customer_id = c.customer_id AND r.rental_status = 'ongoing'
    )
)
ORDER BY last_name, first_name;

exit;
EOF
