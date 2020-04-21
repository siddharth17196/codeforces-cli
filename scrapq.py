import requests
import os
import sys
from bs4 import BeautifulSoup

contest = sys.argv[1]
page = requests.get("https://codeforces.com/contest/"+contest+"/problems")
if page.status_code == 200:
    os.mkdir(contest)
    soup = BeautifulSoup(page.content, 'html.parser')
    text_data = soup.find_all('div', class_="title")
    test_cases = soup.find_all('pre')
    io = ['output', 'input']
    problems = [k.get_text() for k in text_data]
    test_cases = [k.get_text() for k in test_cases]
    intervals = []
    c = 0
    dirname = []
    for k in problems:
        c += 1
        if k.lower() not in io:
            c -= 1
            intervals.append(c)
            c = 0
            os.mkdir(contest+"/"+k[:k.index('.')].lower())
            dirname.append(k[:k.index('.')].lower())
    intervals.append(c)
    print(dirname) 
    for i in range(1,len(intervals)):
        j = 0
        loop = 0
        while(j<intervals[i]):
            loop += 1
            with open(contest+"/"+dirname[i-1]+"/"+"inp"+str(loop)+".txt", "w") as f:
                f.write(test_cases[j][1:])
            with open(contest+"/"+dirname[i-1]+"/"+"out"+str(loop)+".txt", "w") as f:
                f.write(test_cases[j+1][1:])
            j += 2    
        
else:
    print('Not started')
