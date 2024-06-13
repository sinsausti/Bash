#!/bin/bash

# Description:
# A command-line scientific calculator that supports a variety of mathematical operations, including addition, subtraction, 
# multiplication, division, power, sine, cosine, tangent, logarithm, and exponential functions.

# Usage:
# ./Calculator.sh

echo "Welcome to the Scientific Calculator!"
echo "Available operations: add, subtract, multiply, divide, sin, cos, tan, log, exp, pow, quit"

while true; do
    read -p "Enter operation: " OPERATION
    
    if [[ "$OPERATION" == "quit" ]]; then
        break
    fi

    if [[ "$OPERATION" =~ ^(add|subtract|multiply|divide|pow)$ ]]; then
        read -p "Enter first number: " X
        read -p "Enter second number: " Y
    else
        read -p "Enter number: " X
    fi

    case "$OPERATION" in
        add) RESULT=$(echo "$X + $Y" | bc) ;;
        subtract) RESULT=$(echo "$X - $Y" | bc) ;;
        multiply) RESULT=$(echo "$X * $Y" | bc) ;;
        divide) RESULT=$(echo "$X / $Y" | bc) ;;
        pow) RESULT=$(echo "$X ^ $Y" | bc) ;;
        sin) RESULT=$(echo "s($X * 4 * a(1) / 180)" | bc -l) ;;
        cos) RESULT=$(echo "c($X * 4 * a(1) / 180)" | bc -l) ;;
        tan) RESULT=$(echo "s($X * 4 * a(1) / 180) / c($X * 4 * a(1) / 180)" | bc -l) ;;
        log) RESULT=$(echo "l($X)" | bc -l) ;;
        exp) RESULT=$(echo "e($X)" | bc -l) ;;
        *) RESULT="Error: Unsupported operation" ;;
    esac

    echo "Result: $RESULT"
done