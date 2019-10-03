#!/bin/bash
#
# this script demonstrates doing arithmetic

# Improve this script by asking the user to supply the two numbers
# Improve this script by demonstrating using subtraction and multiplication
# Improve this script by demonstrating the modulus operation
#   - the output should look something like:
#   - first divided by second gives X with a remainder of Y
# Improve this script by calculating and displaying the first number raised to the power of the second number

#asking two inputs from the user
read -p "Enter first number" firstnum
read -p "Enter second number" secondnum

#perform arithmetic operations
sum=$(($firstnum + $secondnum))
subtract=$(($firstnum - $secondnum))
multi=$(($firstnum * $secondnum))
dividend=$(($firstnum / $secondnum))
modulo=$(($firstnum % $secondnum))
power=$(($firstnum ** $secondnum))
fpdividend=$(awk "BEGIN{printf \"%.2f\", $firstnum/$secondnum}")

#displaying outputs of arithmetic operations
#displaying sepcific line as asked improved task
cat <<EOF
$firstnum plus $secondnum is $sum
$firstnum subtract $secondnum is $subtract
$firstnum multiplied by $secondnum is $multi
$firstnum divided by $secondnum gives $dividend with a remainde of $modulo
$firstnum raised to the power of $secondnum gives $power
  - More precisely, it is $fpdividend
EOF
