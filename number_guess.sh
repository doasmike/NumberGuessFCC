#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USER

USERCHECK=$($PSQL "SELECT username FROM gamedata WHERE username='$USER';" | sed 's/ //g')

PLAY_GAME() {
    echo -e "\nGuess the secret number between 1 and 1000:"
    RANDOM_NUMBER=$((1 + $RANDOM % 1000))
    echo $RANDOM_NUMBER

    while true; do
        read PICK

        if [[ ! $PICK =~ ^[0-9]+$ ]]; then
            echo -e "That is not an integer, guess again:"
            continue
        fi

        SCORE=$((SCORE + 1))

        if [[ $PICK != $RANDOM_NUMBER ]]; then

            if [[ $PICK -lt $RANDOM_NUMBER ]]; then
                echo -e "It's lower than that, guess again:"
            else
                echo -e "It's higher than that, guess again:"
            fi
        else
            echo -e "You guessed it in $SCORE tries. The secret number was $RANDOM_NUMBER. Nice job!"
            PUSH_DB=$($PSQL "INSERT INTO gamedata(username, gameresult) VALUES ('$USER', $SCORE)")
            break
        fi

    done
}

if [[ -z $USERCHECK ]]; then
    echo "Welcome, $USER! It looks like this is your first time here."
    PLAY_GAME
else
    GAMESPLAYED=$($PSQL "SELECT COUNT(username) FROM gamedata WHERE username='$USER';" | sed 's/ //g')
    BESTGAME=$($PSQL "SELECT MIN(gameresult) FROM gamedata WHERE username='$USER';" | sed 's/ //g')
    echo "Welcome back, $USER! You have played $GAMESPLAYED games, and your best game took $BESTGAME guesses."
    PLAY_GAME
fi
