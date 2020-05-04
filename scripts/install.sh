#!/bin/bash

pip install virtualenv
virtualenv .env 
sosurce .env/bin/activate
pip install beautifulsoup4
deactivate
