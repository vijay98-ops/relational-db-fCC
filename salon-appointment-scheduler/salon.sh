#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "Welcome to My Salon, how can I help you?\n"
  fi
  echo -e "1) cut\n2) color\n3) style"
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[1-3]$ ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  # if customer does not exist
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo -e "\nWhat time would you like your$SERVICE_NAME,$CUSTOMER_NAME?"
  read SERVICE_TIME
  
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time,customer_id,service_id) VALUES('$SERVICE_TIME',$CUSTOMER_ID,$SERVICE_ID_SELECTED)")
  if [[ -z $INSERT_APPOINTMENT ]]
  then
    echo Appointment not noted
  else
    echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."
    exit 0
  fi
}

MAIN_MENU

## since $SERVICE_TIME is not from SQL query, its value is as given from keyboard.
