#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
mode="$1"
arg="$2"
if [[ $mode == "get" ]]
then
    source $DIR/.env/bin/activate
    if [[ $arg == "" ]]
    then
        echo "Not a valid format"
    else
        python3 scrapq.py "$arg"
    fi
    deactivate
elif [[ $mode == "check" ]]
then
    if [[ $arg == *.py || $arg == *.cpp ]]
    then
        bash $DIR/check.sh "$arg"
    else
        echo "Enter path to valid python/c++ file"
    fi
else
    echo "Not a valid command"
fi
