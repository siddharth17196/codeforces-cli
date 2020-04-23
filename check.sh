#!/bin/bash

echo "filename : $1"
file="$1"
if [[ file == *.py ]]
then
    echo "python file"
    python "$file" <inp1.txt >o.txt
    nvim o.txt out1.txt -O
elif [[ $file == *.cpp ]]
then
    echo "C++ file"
    g++ "$file" 
    ./a.out <i.txt >o.txt
    nvim ot.txt o.txt -O
fi
