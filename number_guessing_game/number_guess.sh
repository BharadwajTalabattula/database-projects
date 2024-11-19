#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\nEnter your username:"
read USERNAME_INPUT

#find the userdetails from database
USER_ID=$($PSQL "SELECT user_id FROM userdetails WHERE username='$USERNAME_INPUT'")
if [[ -z $USER_ID ]]
then

INSERT_USERNAME=$($PSQL "INSERT INTO userdetails(username) VALUES('$USERNAME_INPUT')")
echo "Welcome, $USERNAME_INPUT! It looks like this is your first time here."

else
USER_NAME=$($PSQL "SELECT username FROM userdetails WHERE username='$USERNAME_INPUT'")
GAMES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM games WHERE user_id=$USER_ID")
BEST_GAME=$($PSQL "SELECT MIN(no_of_attempts) FROM games WHERE user_id=$USER_ID")
echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

fi


#GAME
RANDOM_NUMBER=$(((RANDOM % 1000) + 1 ))

echo -e "\nGuess the secret number between 1 and 1000:"

#main menu
MAIN_MENU (){
COUNT=$((i+=1))
read USERINPUT

if [[ ! "$USERINPUT" =~ ^-?[0-9]+$ ]]
then
echo -e "\nThat is not an integer, guess again:"
COUNT=$((i--))
MAIN_MENU

elif [[ $USERINPUT -lt $RANDOM_NUMBER ]]
then

echo -e "\nIt's lower than that, guess again:"
MAIN_MENU
elif [[ $USERINPUT -gt $RANDOM_NUMBER ]]
then

echo -e "\nIt's higher than that, guess again:"
MAIN_MENU
else
USER_ID=$($PSQL "SELECT user_id FROM userdetails WHERE username='$USERNAME_INPUT'")
INSERT_GAME=$($PSQL "INSERT INTO games(no_of_attempts, user_id) VALUES($COUNT, $USER_ID )")
echo -e "\nYou guessed it in $COUNT tries. The secret number was $USERINPUT. Nice job!"

fi

}

MAIN_MENU









