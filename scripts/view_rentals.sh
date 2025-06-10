#!/bin/bash

# Source the credentials
source ./credentials.sh

# Query the rentals table
sqlplus64 "${ORACLE_USER}/${ORACLE_PASS}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF
SELECT * FROM rentals;
exit;
EOF

# Check for success
if [ $? -eq 0 ]; then
    echo "Rentals table displayed successfully."
else
    echo "Failed to display rentals table."
fi
