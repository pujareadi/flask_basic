#!/bin/bash
source $2bin/activate
export CONFIG_NAME=$1
PYTHONPATH=./ python3 start_app.py

