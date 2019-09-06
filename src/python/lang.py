#!/usr/bin/env python

import sys
from langdetect import detect

for line in sys.stdin:
    print(detect(line))