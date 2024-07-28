#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ DAVID'S SALON ~~~~~\n"
echo "Welcome to David's Salon, how can I help you?"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\n1) Cut\n2) Color\n3) Perm\n4) Style\n5) Trim\n6) Exit\n7) TRUNCATE"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) CUT_MENU ;;
    2) COLOR_MENU ;;
    3) PERM_MENU ;;
    4) STYLE_MENU ;;
    5) TRIM_MENU ;;
    6) EXIT ;;
    7) TRUNCATE ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}

CUT_MENU() {
  # get customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # if customer doesn't exist
  if [[ -z $CUSTOMER_ID ]]
  then
    # get new customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    # get new customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  else
    # get customer name
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi

  # get time of appointment
  echo -e "\nWhat time would you like your cut, $(echo $CUSTOMER_NAME | sed 's/^ *//g')?"
  read SERVICE_TIME
  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a cut at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ *//g')."
}

COLOR_MENU() {
  # get customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # if customer doesn't exist
  if [[ -z $CUSTOMER_ID ]]
  then
    # get new customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    # get new customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  else
    # get customer name
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi

  # get time of appointment
  echo -e "\nWhat time would you like to color your hair, $(echo $CUSTOMER_NAME | sed 's/^ *//g')?"
  read SERVICE_TIME
  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  echo -e "\nI have put you down for hair color at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ *//g')."
}

PERM_MENU() {
  # get customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # if customer doesn't exist
  if [[ -z $CUSTOMER_ID ]]
  then
    # get new customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    # get new customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  else
    # get customer name
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi

  # get time of appointment
  echo -e "\nWhat time would you like your perm, $(echo $CUSTOMER_NAME | sed 's/^ *//g')?"
  read SERVICE_TIME
  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a perm at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ *//g')."
}

STYLE_MENU() {
  # get customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # if customer doesn't exist
  if [[ -z $CUSTOMER_ID ]]
  then
    # get new customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    # get new customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  else
    # get customer name
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi

  # get time of appointment
  echo -e "\nWhat time would you like to style your hair, $(echo $CUSTOMER_NAME | sed 's/^ *//g')?"
  read SERVICE_TIME
  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a style at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ *//g')."
}

TRIM_MENU() {
  # get customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # if customer doesn't exist
  if [[ -z $CUSTOMER_ID ]]
  then
    # get new customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    # get new customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  else
    # get customer name
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi

  # get time of appointment
  echo -e "\nWhat time would you like your trim, $(echo $CUSTOMER_NAME | sed 's/^ *//g')?"
  read SERVICE_TIME
  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a trim at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ *//g')."
}

EXIT() {
  echo -e "\nThank you for stopping by!\n"
}

TRUNCATE() {
  echo $($PSQL "TRUNCATE TABLE appointments, customers RESTART IDENTITY CASCADE")
  echo "Deleted appointments, customers table"
}

MAIN_MENU