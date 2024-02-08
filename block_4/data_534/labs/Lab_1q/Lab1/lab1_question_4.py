from bs4 import BeautifulSoup
import pandas as pd
import requests
import re
import time

got_request = requests.get("https://en.wikipedia.org/wiki/List_of_Game_of_Thrones_episodes")
print('connected')

text = BeautifulSoup(got_request.text)

url = "https://en.wikipedia.org"
temp = []
df = []
tables = text.find_all("table")
for i in range(1,9):
    for j,entry in enumerate(tables[i].find_all("td")):
        if '"' in entry.text:
            temp.append(i)
            result_string = entry.text.replace('"','')
            temp.append(result_string)
            #for k,row in enumerate(entry.find_all("a")):
            temp_url = url + str(entry.find("a").get('href'))
            temp_request = requests.get(temp_url)
            text2 = BeautifulSoup(temp_request.text)
            tds = text2.find_all("td")
            for min in tds:
                if 'minutes' in min.text:
                    pattern = re.compile(r'\[.*?\]')
                    result_string = re.sub(pattern, '', min.text)
                    temp.append(result_string)
                    break
        if '[' in entry.text:
            pattern = re.compile(r'\[.*?\]')
            result_string = re.sub(pattern, '', entry.text)
            temp.append(result_string)
            df.append(temp)
            temp = []
        time.sleep(.005)
    time.sleep(.005)
df_got = pd.DataFrame(df, columns = ["Season", "Episode Title", "Episode Runtime", "U.S Viewers"])
print(df_got)