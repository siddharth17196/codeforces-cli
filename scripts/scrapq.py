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
    intervals = []
    count_tests = 0
    dirname = []
    '''
        Create problem sub directories
    '''
    for k in problems:
        count_tests += 1
        if k.lower() not in io:
            count_tests -= 1
            intervals.append(count_tests)
            count_tests = 0
            if os.path.isdir(contest+"/"+k[:k.index('.')].lower())==False:
                os.mkdir(contest+"/"+k[:k.index('.')].lower())
            dirname.append(k[:k.index('.')].lower())
    intervals.append(count_tests)
    print(dirname)
    '''
        Add inputs and outputs in the corresponding problem directories
    '''
    for i in range(1,len(intervals)):
        j = 0
        test_num = 0
        while(j<intervals[i]):
            test_num += 1
            problem_dir = os.path.join(contest, dirname[i-1])
            test_input = problem_dir + "/inp" + str(test_num) + ".txt"
            test_output = problem_dir + "/out" + str(test_num) + ".txt"
            with open(test_input, "w") as f:
                f.write(test_cases[j][1:])
            with open(test_output, "w") as f:
                f.write(test_cases[j+1][1:])
            j += 2
else:
    print('Contest Not Available')
