#!/bin/bash

# Description:
# A simple and interactive number guessing game where the user tries to guess a randomly generated number between 1 and 100. 
# The script provides feedback on whether the guess is too high or too low and counts the number of attempts until the correct number is guessed.

# Usage:
# ./Guessing.sh

# Generate a random number between 1 and 100
SECRET_NUMBER=$(( RANDOM % 100 + 1 ))
ATTEMPTS=0

echo "Welcome to the guessing game!"
echo "I'm thinking of a number between 1 and 100."

while true; do
    read -p "Guess the number: " GUESS
    ATTEMPTS=$(( ATTEMPTS + 1 ))
    if (( GUESS < SECRET_NUMBER )); then
        echo "Too low, try again."
    elif (( GUESS > SECRET_NUMBER )); then
        echo "Too high, try again."
    else
        echo "Congratulations! You guessed the number in $ATTEMPTS attempts."
        break
    fi
done