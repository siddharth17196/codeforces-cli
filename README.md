# codeforces-cli
A simple parsing and checking implementation in python and bash for contests in codeforces.\

```
$ git clone "https://github.com/siddharth17196/codeforces-cli.git"
$ cd codeforces-cli/scripts
$ bash install.sh

```
Add the following to your .bashrc (run.sh is inside the scripts folder)
`alias cf="bash (path to run.sh)"`

## Usage

- use `get` command to get the questions and test cases
- use `check` to check the output of the test cases
    - the file can be named as you wish
    - this command should be run where the file and the input and output test cases are present
```
$ cf get 1348   #get the questions for the contest 1348
$ cd 1348/a
$ cf check a.py
```

![directories](/images/tr.png)


Correct Solution                    | Wrong Solution
----------------                    | --------------
![Correct Solution](/images/cf_wrong.png) | ![Wrong Solution](/images/cf_correct.png)

## Templates

Initialize each problem directory with a py/cpp/any file with a specific template\
A sample template could be (for a python file):
```
# author : siddharth

t = int(input())
for _ in range(t):
    n = list(map(int, input().split()))
```
If you want to change the template file go [here](/scripts/templates) and change the template.py or template.cpp etc whichever language you want the template to be in.


### Tasks
- [x] Parsing questions and making sub folders and with test cases
- [x] checking test cases and showing differenes if wrong 
- [x] checking multiple test cases at once
- [x] include templates
- [ ] improving the usage(directory management)
- [ ] submit from command line

