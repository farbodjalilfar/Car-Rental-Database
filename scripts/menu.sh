#!/bin/bash

# Source the credentials from credentials.sh
source ./credentials.sh

# Display the menu
echo "Choose an option:"
echo "1. View Customers Who Have Rented Vehicles (Join Operation on Customers and Rentals)"
echo "2. View Total Rentals Per Customer (Aggregation using COUNT and GROUP BY)"
echo "3. View Average Rental Cost Per Vehicle (Statistical Function with AVG)"
echo "4. View Customers Without Any Rentals (Set Operation using MINUS)"
echo "5. View Rental Count and Total Cost by Rental Status (Grouping using GROUP BY and SUM)"
echo "6. Exit"

# Read user input
read -p "Enter your choice: " CHOICE

# Execute corresponding script based on user choice
if [ "$CHOICE" == "1" ]; then
    bash query1.sh
elif [ "$CHOICE" == "2" ]; then
    bash query2.sh
elif [ "$CHOICE" == "3" ]; then
    bash query3.sh
elif [ "$CHOICE" == "4" ]; then
    bash query4.sh
elif [ "$CHOICE" == "5" ]; then
    bash query5.sh
elif [ "$CHOICE" == "6" ]; then
    echo "Exiting..."
    exit 0
else
    echo "Invalid choice. Exiting..."
    exit 1
fi
