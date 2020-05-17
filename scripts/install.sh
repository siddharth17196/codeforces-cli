#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
virtualenv .env 
source .env/bin/activate
pip install -r reqs.txt 
deactivate
