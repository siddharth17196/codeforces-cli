#!/bin/bash

# echo "filename : $1"
file="$1"
if [[ $file == *.py ]]
then
    echo "Lang : Python"
    python "$file" < inp1.txt > o.txt
elif [[ $file == *.cpp ]]
then
    echo "Lang : C++"
    g++ "$file" 
    ./a.out < i.txt > o.txt
fi
# nvim o.txt out1.txt -O
diff -y o.txt out1.txt >sam.txt  2>/dev/null
if [[ "$?" -ne 0 ]]
then
    echo -e "Verdict : \e[0;31mWrong Answer\e[0m"
    cat sam.txt
else
    echo -e "Verdict : \e[0;32mAC\e[0m"
    # echo "AC"
fi
