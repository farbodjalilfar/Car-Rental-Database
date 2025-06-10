#!/bin/bash

# Source the credentials
source ./credentials.sh

# Query the customers table
sqlplus64 "${ORACLE_USER}/${ORACLE_PASS}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF
SELECT * FROM customers;
exit;
EOF

# Check for success
if [ $? -eq 0 ]; then
    echo "Customers table displayed successfully."
else
    echo "Failed to display customers table."
fi
