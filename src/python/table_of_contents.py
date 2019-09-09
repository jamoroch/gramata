#!/usr/bin/env python

from bs4 import BeautifulSoup
from docx import Document
import os

ioc = '../../resources/table_of_contents.html'
with open(ioc) as fp:
    doc = BeautifulSoup(fp, features="lxml")

out_file = '../../resources/inhaltsverzeichnis.docx'
if os.path.isfile(out_file) :
  os.remove(out_file);
word_document = Document()
for node in doc.body.children:
    if(node.name):
        if(node.string):
          entry = node.string.strip()
          print(entry)
          word_document.add_paragraph(entry, style='List Number')
        else:
          entry = node.contents[0].strip()
          print(entry)
          word_document.add_paragraph(entry, style='List Number')
word_document.save(out_file)
