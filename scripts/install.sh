#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pip install -r reqs.txt 
virtualenv .env 
source .env/bin/activate
deactivate
