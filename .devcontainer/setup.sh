#!/bin/bash
script_dir=$(realpath $(dirname $0))

# python post create commands
python_src="$script_dir/../src/python_app"
python3 -m venv $python_src/.venv
source $python_src/.venv/bin/activate
python -m pip install --upgrade pip
pip install -r $python_src/requirements.txt

