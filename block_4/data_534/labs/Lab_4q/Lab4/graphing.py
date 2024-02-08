
import matplotlib.pyplot as plt

years = []
counts = []

with open('outputs.txt', 'r') as inline:
	for line in inline:
		line = line.strip().split('\t')
		year, count = line
		years.append(int(year))
		counts.append(int(count))


plt.xlabel("Year")
plt.ylabel("Counts")
plt.title("'google' occurence in")
plt.plot(years, counts)
plt.legend()
plt.show()