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
    printf "\n\033[100mTest case $num\033[0m -> "
    diff -y o"$num".txt out"$num".txt >diff.txt  2>/dev/null
    if [[ "$?" -ne 0 ]]
    then
        echo -e "Verdict: \033[0;31mWrong Answer\033[0m"   # in red color
        echo -e "\033[0;35mInput\033[0m"
        cat inp"$num".txt
        echo -e "\033[0;35mYour Output                                                    Expected Output\e[0m" | cat - diff.txt > temp && mv temp diff.txt
        cat diff.txt
    else
        echo -e "Verdict: \033[1;92mCorrect\033[0m"     # in green color
        # echo "AC"
    fi
    num=$((num+1))
done
rm "diff.txt"
for out_file in $(ls o?.txt)    # remove temp files used for o/p
do
    rm "$out_file"
done
