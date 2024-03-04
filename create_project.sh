#!/bin/bash

# Check for a virtual environment name argument
if [ -z "$1" ]; then
    echo "Usage: $0 <virtual_env_name>"
    exit 1
fi

# Create the virtual environment
python3 -m venv $1

# Activate the virtual environment
source $1/bin/activate

# Create the required files
touch Makefile
printf "install: \n \t pip install --upgrade pip && pip install -r requirements.txt\n" >>Makefile
printf "format:\n \t 	black *.py\n">>Makefile
printf "lint:\n \t pylint --disable=R,C hello.py\n">>Makefile
printf "test:\n \t python -m pytest -vv --cov=hello test_hello.py\n">>Makefile
touch requirements.txt
touch hello.py
touch test_hello.py

echo "Files created successfully!"
