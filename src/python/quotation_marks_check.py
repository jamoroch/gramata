#!/usr/bin/env python
import subprocess, sys, re
from langdetect import detect
fileName = 'resources/data.txt'
qms = {
    'en': {'left':"“", 'right':"”"},
    'de':{'left': "„", 'right':"“"}
}
lineList = [line.rstrip('\n') for line in open(fileName)]

def check_quotation_marks(line) :
    if ('In:' in line):
        line_id = line.split(':')[0]
        title = line.split('In:')[0]
        lang = detect(line)
        qm = qms.get(lang)
        if not qm:
            print('{} uknown language'.format(line_id))
            return;
        if not qm.get('left') in title :
            print('{} No left (opening) quotation mark'.format(line_id))
        if not qm.get('right') in title :
            print('{} No right (closing) quotation mark'.format(line_id))
        

[check_quotation_marks(line) for line in lineList]