#!/bin/bash

# Variables
read -p "Enter your DB NAME: " DB_NAME
read -p "Enter your DB USER: " DB_USER
read -sp "Enter your DB PASSWORD: " DB_PASSWORD
read -p "Enter your DB HOST: " DB_HOST
DB_PORT=3306

# check if MySQL is installed
FILE=`echo \`which mysql\``
if [ ! -f "$FILE" ]; then
    echo "MySQL is not installed, installing it now."
    # Install MySQL 
    apt update && apt install mysql-server -y
    systemctl enable mysql && systemctl start mysql
    echo "MySQL server installed and running."
else
    echo "MySQL is already installed."
fi

# Add user if it doesn't exist and grant all privileges
mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'${DB_HOST}' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'${DB_HOST}';"
mysql -e "FLUSH PRIVILEGES;"

echo "------------------"
echo "DB NAME: ${DB_NAME}"
echo "DB USER: ${DB_USER}"
echo "DB PASSWORD: ${DB_PASSWORD}"
echo "DB HOST: ${DB_HOST}"
echo "DB PORT: ${DB_PORT}"
echo "------------------"
sleep 2

# create database
echo "Building ${DB_NAME} database..."
mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"

# Assuming the db.sql is in the same directory as this script.
cat ./mysql.sql | mysql -h ${DB_HOST} -P ${DB_PORT} -u ${DB_USER} -p${DB_PASSWORD} ${DB_NAME}
sleep 2

echo "${DB_NAME} database setup complete."

