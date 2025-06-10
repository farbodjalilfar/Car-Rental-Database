#!/bin/bash

# Source the credentials from credentials.sh
source ./credentials.sh

# Test the connection using sqlplus64
sqlplus64 "${ORACLE_USER}/${ORACLE_PASS}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
exit;
EOF

# Check if the connection was successful
if [ $? -eq 0 ]; then
    echo "Connection successful!"
else
    echo "Connection failed!"
fi
