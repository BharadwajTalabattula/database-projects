#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?\n"

MAIN_MENU(){
    if [[ $1 ]]
    then
    echo -e "\n$1"
    fi

    echo -e "1) cut\n2) color\n3) perm\n4) style\n5) trim"
    read SERVICE_ID_SELECTED

    #fetch the service id
    SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    
    if [[ -z $SERVICE_NAME_SELECTED ]]
    then
    MAIN_MENU "I could not find that service. What would you like today?"
    else
    SUB_MENU "$(echo "$SERVICE_NAME_SELECTED" | sed -E 's/^ *| *$//')"
    fi
    
  
}



SUB_MENU(){

   SERVICE_NAME=$1;

    # Ask customer phone
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'");

    # phone number check
    if [[ -z $CUSTOMER_ID ]] 
    then 
    #Ask customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    #insert new custome
    INSERT_CUSTOMER_DETAILS=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')");

    else
      # find the customer name from the table
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    fi

    #Ask customer time
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME


     #Insert customer and service id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'");
    INSERT_APPOINTMENT_DETAILS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
   
}
MAIN_MENU


