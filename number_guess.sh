#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME
USERNAME_RESEUILT=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT count(*) FROM users INNER JOIN games USING(user_id) WHERE username='$USERNAME'")
BEST_GAME=$($PSQL "SELECT min(number_guesses) FROM users INNER JOIN games USING(user_id) WHERE username='$USERNAME'")

if [[ -z $USERNAME_RESEUILT ]]
then
  ADD_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  echo "Welcome back, $USERNAME_RESEUILT! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

RANDOM_NUMBER=$((1 + $RANDOM % 1000))
GUESS=1
echo "Guess the secret number between 1 and 1000:"

while read NUM
do
  if [[ ! $NUM =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ $NUM -lt $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    elif [[ $NUM -gt $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    else
      
      echo "You guessed it in $GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
      break;
    fi
  fi
  GUESS=$(( $GUESS +1 ))
done

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

INSERT_GAME=$($PSQL "INSERT INTO games(number_guesses, user_id) VALUES($GUESS, '$USER_ID')")



