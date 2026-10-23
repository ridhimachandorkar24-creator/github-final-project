#!/bin/bash

# Simple Interest Calculator
# Formula: SI = (Principal * Rate * Time) / 100

echo "================================"
echo "     Simple Interest Calculator"
echo "================================"

read -r -p "Enter the principal amount: " principal
read -r -p "Enter the annual interest rate (%): " rate
read -r -p "Enter the time period (in years): " time

# Validate numeric inputs and calculate the interest
if ! awk -v p="$principal" -v r="$rate" -v t="$time" 
    'BEGIN {
        if (p !~ /^[0-9]+([.][0-9]+)?$/ ||
            r !~ /^[0-9]+([.][0-9]+)?$/ ||
            t !~ /^[0-9]+([.][0-9]+)?$/ ||
            p + 0 <= 0 || r + 0 < 0 || t + 0 < 0)
            exit 1
    }'
then
    echo "Error: Enter valid numbers. Principal must be positive; rate and time cannot be negative."
    exit 1
fi

interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" 
    'BEGIN { printf "%.2f", (p * r * t) / 100 }')

echo "--------------------------------"
echo "Principal Amount : $principal"
echo "Annual Rate      : $rate%"
echo "Time Period      : $time years"
echo "Simple Interest  : $interest"
echo "================================"