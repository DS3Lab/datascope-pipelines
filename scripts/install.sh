#!/bin/bash
python3 -m pip install --user virtualenv
python3 -m venv dspipes

source dspipes/bin/activate

pip install -r requirements.txt
python setup.py install