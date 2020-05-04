# codeforces-cli
A simple parsing and checking implementation in python and bash for contests in codeforces.\
This repo is under development.

```
$ git clone "https://github.com/siddharth17196/codeforces-cli.git"
$ cd codeforces-cli/scripts
$ bash install.sh

```
Add the following to you .bashrc (run.sh is inside the scripts folder)
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

![directories](/images/tree.png)

### The images might be a bit outdated

Correct Solution                    | Wrong Solution
----------------                    | --------------
![correct solution](/images/correct.png) | ![wrong answer](/images/wa.png)

### Tasks
- [x] Parsing questions and making sub folders and with test cases
- [x] checking test cases and showing differenes if wrong 
- [x] checking multiple test cases at once
- [ ] improving the usage(directory management)
- [ ] submit from command line
- [ ] figure out a way for it run on windows (tested on linux so far)

