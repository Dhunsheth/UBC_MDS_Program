#!/usr/bin/env python

import sys

for line in sys.stdin:
	line = line.strip().split("\t")
	word = str(line[0]).lower()

	if word == None:
		continue

	if 'google' in word:
		year = int(line[1])
		occurances = int(line[2])
		print('%s\t%s' %(year,occurances))