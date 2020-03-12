#!/bin/bash
source $1bin/activate
export CONFIG_NAME=testing
PYTHONPATH=./ pytest -v