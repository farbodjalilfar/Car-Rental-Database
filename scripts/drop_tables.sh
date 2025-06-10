#!/bin/bash

# Source the credentials
source ./credentials.sh

# Execute the drop table commands
sqlplus64 "${ORACLE_USER}/${ORACLE_PASS}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF
DROP TABLE rentals CASCADE CONSTRAINTS;
DROP TABLE vehicles CASCADE CONSTRAINTS;
DROP TABLE customers CASCADE CONSTRAINTS;
exit;
EOF

# Check for success
if [ $? -eq 0 ]; then
    echo "Tables dropped successfully."
else
    echo "Failed to drop tables."
fi
