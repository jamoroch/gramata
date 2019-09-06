#!/usr/bin/env python

import sys
from langdetect import detect
line = sys.argv[0]
print(detect(line))
