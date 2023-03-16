#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN() {
  #user input
  echo -e "Enter your username:"
  read USERNAME

  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

  #whether user is in DB or not
  if [[ -z $USER_ID ]]
  then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
    #add user to the database
    USER_INSERT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  #user in the database
  else
    GAMES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM games WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL "SELECT MIN(guess) FROM games WHERE user_id=$USER_ID")
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
  #call function to start the guess game
  GUESS
}

GUESS() {
  #random number generator
  SECRET=$((1 + $RANDOM % 1000))
  
  #guess the secret number between 1 and 1000:
  echo -e "\nGuess the secret number between 1 and 1000:"
  read INPUT

  GUESSED_NUMBER=0
  NUMBER_OF_GUESSES=0

  while [[ $GUESSED_NUMBER != 1 ]]
  do
    #check if the input is a number
    if [[ $INPUT =~ ^[0-9]+$ ]]
    then
      NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
      #check if input is smaller
      if [[ $INPUT < $SECRET ]]
      then
        echo -e "\nIt's higher than that, guess again:"
        read INPUT
      #check if input is greater
      elif [[ $INPUT > $SECRET ]]
      then
        echo -e "\nIt's lower than that, guess again:"
        read INPUT
      #check if input matches
      elif [[ $INPUT = $SECRET ]]
      then
        GUESSED_NUMBER=1

        #insert guess tries into database
        INSERT_GUESS_TRIES=$($PSQL "INSERT INTO games(user_id,guess) VALUES($USER_ID,$NUMBER_OF_GUESSES)")
        echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET. Nice job!"
        exit
      fi
    #if input not a number
    else
      echo -e "\nThat is not an integer, guess again:"
      read INPUT
    fi
  done

}

MAIN
