import requests
import os
import sys
from bs4 import BeautifulSoup

contest = sys.argv[1]
page = requests.get("https://codeforces.com/contest/"+contest+"/problems")

if page.status_code == 200:
    if os.path.isdir(contest)==False:
        os.mkdir(contest)
    soup = BeautifulSoup(page.content, 'html.parser')
    text_data = soup.find_all('div', class_="title")
    test_cases = soup.find_all('pre')
    io = ['output', 'input']
    problems = [k.get_text() for k in text_data]
    test_cases = [k.get_text() for k in test_cases]
    test_case_intervals = 0
    intervals = []  # has indices to separate test cases for each problem
    dirname = []    # name of the problem subdirectories
    '''
        Create problem sub directories
    '''
    test_case_intervals = 0 # count number of test cases for each problem
    for k in problems:
        test_case_intervals += 1
        if k.lower() not in io: # not selecting the input/output
            test_case_intervals -= 1
            intervals.append(test_case_intervals)
            test_case_intervals =  0
            if os.path.isdir(contest+"/"+k[:k.index('.')].lower())==False:
                os.mkdir(contest+"/"+k[:k.index('.')].lower())
            dirname.append(k[:k.index('.')].lower())
    intervals.append(test_case_intervals)
    '''
        Add inputs and outputs in the corresponding problem directories
    '''
    test_case_selecter = 0  # iterate over test_cases 
    for i in range(1,len(intervals)):
        test_case_num = 0   # test case number for each problem
        while(test_case_num*2<intervals[i]):
            test_case_num += 1
            problem_dir = os.path.join(contest, dirname[i-1])
            test_input = problem_dir + "/inp" + str(test_case_num) + ".txt"
            test_output = problem_dir + "/out" + str(test_case_num) + ".txt"
            with open(test_input, "w") as f:
                f.write(test_cases[test_case_selecter][1:])
            with open(test_output, "w") as f:
                f.write(test_cases[test_case_selecter+1][1:])
            test_case_selecter += 2   # as input output are in pairs of 2
else:
    print('Contest Not Available')
