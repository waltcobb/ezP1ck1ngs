#!/usr/bin/python2.7
from BeautifulSoup import BeautifulSoup
import urllib
import html
import sys
import re

site = urllib.urlopen('http://duckduckgo.com/html/?q='+sys.argv[1])
data = site.read()
parsed = BeautifulSoup(data)

for i in parsed.findAll('div', {'class': re.compile('links_main*')}):
	url = i.a['href']
	print urllib.unquote(url)

