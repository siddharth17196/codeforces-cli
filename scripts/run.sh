#!/bin/bash

mode="$1"
arg="$2"
if [[ $mode == "get" ]]
then
    source .env/bin/activate
    if [[ $arg == "" ]]
    then
        echo "Not a valid format"
    else
        python scrapq.py "$arg"
    fi
    deactivate
elif [[ $mode == "check" ]]
then
    if [[ $arg == *.py || $arg == *.cpp ]]
    then
        bash check.sh "$arg"
    else
        echo "Enter path to valid python/c++ file"
    fi
else
    echo "Not a valid command"
fi
