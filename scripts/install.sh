#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pip install virtualenv
virtualenv .env 
sosurce .env/bin/activate
pip install beautifulsoup4
deactivate
