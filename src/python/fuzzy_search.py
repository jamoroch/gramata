#!/usr/bin/env python

from fuzzywuzzy import fuzz
str1 = "Amorocho"
str2 = "duran"

print(fuzz.partial_ratio(str1, str2))
