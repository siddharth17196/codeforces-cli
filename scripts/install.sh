#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pip install virtualenv
virtualenv .env 
source .env/bin/activate
pip install beautifulsoup4
pip install requests
deactivate
