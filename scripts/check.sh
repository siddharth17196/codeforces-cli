#!/bin/bash

file="$1"
if [[ $file == *.py ]]
then
    echo "Lang : Python"
    declare -i inp_no=1
    for input in $(ls inp?.txt)
    do
        python "$file" < inp"$inp_no".txt > o"$inp_no".txt
        inp_no=$((inp_no+1))
    done
elif [[ $file == *.cpp ]]
then
    echo "Lang : C++"
    g++ "$file" 
    declare -i inp_no=1
    for input in $(ls inp?.txt)
    do
        ./a.out < inp"$inp_no".txt > o"$inp_no".txt
        inp_no=$((inp_no+1))
    done
fi
declare -i num=1
while true
do
    if [[ $num -eq $inp_no ]]; 
    then
        break;
    fi
    echo -e "\e[34mTest case $num\e[0m"
    diff -y o"$num".txt out"$num".txt >diff.txt  2>/dev/null
    if [[ "$?" -ne 0 ]]
    then
        echo -e "Verdict : \e[0;31mWrong Answer\e[0m"   # in red color
        cat sam.txt
    else
        echo -e "Verdict : \e[0;32mAC\e[0m"     # in green color
        # echo "AC"
    fi
    num=$((num+1))
done
rm "diff.txt"
for out_file in $(ls o?.txt)    # remove temp files used for o/p
do
    rm "$out_file"
done
