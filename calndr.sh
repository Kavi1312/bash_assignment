#!/bin/bash

# Function to perform the calculation
calculate() {
	    case "$2" in
		            +) result=$(echo "$1 + $3" | bc);;
			            -) result=$(echo "$1 - $3" | bc);;
				            '*') result=$(echo "$1 * $3" | bc);;  # Match the multiplication symbol without needing user to escape it
					            /) 
							                if [ "$3" -eq 0 ]; then
										                echo "Error: Division by zero is not allowed."
												                exit 1
														            else
																                    result=$(echo "scale=2; $1 / $3" | bc)
																		                fi
																				            ;;
																					            *) echo "Invalid operator"; exit 1;;
																						        esac
																							    echo "Result: $result"
																						    }

																						    # Prompt the user for input
																						    read -p "Enter the first number: " num1
																						    read -p "Enter the operator (+, -, *, /): " operator
																						    read -p "Enter the second number: " num2

																						    # Perform the calculation
																						    calculate "$num1" "$operator" "$num2"
