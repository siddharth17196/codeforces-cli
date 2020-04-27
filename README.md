# codeforces-cli
This repo is under development.

- Enter contest number
    - creates a folder with the contest number and sub folders with each problem and test cases
       (contest number from link of the contest)
```
$ python scrapq.py 1342
``` 
![directories](/images/tree.png)
```
# if a.py is the solution to the problem
$ ./check.sh a.py
```
![correct solution](/images/ac.png)

![wrong answer](/images/wrong.png)

### Tasks
- [x] Parsing questions and making sub folders and with test cases
- [x] checking test cases and showing differenes if wrong 
- [ ] checking multiple test cases at once
- [ ] figure out a way for it run on windows (tested on linux so far)

