#!/usr/bin/env python


import sys

dict = {}

for line in sys.stdin:
	line = line.strip().split('\t')
	year, occurences = line

	try:
		year = int(year)
	except ValueError:
		continue

	try:
		occurences = int(occurences)
	except ValueError:
		continue

	if year in dict.keys():
		dict[year] = dict[year] + occurences
	else:
		dict[year] = occurences

for year, count in sorted(dict.items()):
	print('%s\t%s' %(year, count))