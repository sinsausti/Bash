#!/bin/bash

# Description:
# A secure password generator that creates random passwords based on user-specified criteria, such as length, and whether to include uppercase letters, digits, and symbols.

# Usage:
# ./PasswordGenerator.sh

generate_password() {
    local LENGTH=$1
    local USE_UPPER=$2
    local USE_DIGITS=$3
    local USE_SYMBOLS=$4

    local CHAR_SET="abcdefghijklmnopqrstuvwxyz"
    [[ $USE_UPPER == "y" ]] && CHAR_SET+="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    [[ $USE_DIGITS == "y" ]] && CHAR_SET+="0123456789"
    [[ $USE_SYMBOLS == "y" ]] && CHAR_SET+="!@#$%^&*()-_=+[]{}|;:,.<>/?"

    PASSWORD=""
    for _ in $(seq 1 $LENGTH); do
        PASSWORD+="${CHAR_SET:RANDOM%${#CHAR_SET}:1}"
    done

    echo $PASSWORD
}

echo "Welcome to the Password Generator!"

read -p "Enter the desired length of the password: " LENGTH
read -p "Include uppercase letters? (y/n): " USE_UPPER
read -p "Include digits? (y/n): " USE_DIGITS
read -p "Include symbols? (y/n): " USE_SYMBOLS

PASSWORD=$(generate_password $LENGTH $USE_UPPER $USE_DIGITS $USE_SYMBOLS)
echo "Generated password: $PASSWORD"