import scrapy
import html5lib
from bs4 import BeautifulSoup
import pandas as pd
from prereq_project.items import CourseItem
import requests

class MySpider(scrapy.Spider):

    name = "mySpider"
    allowed_domains = ["ubc.ca"]
    start_urls = [
        "https://courses.students.ubc.ca/cs/courseschedule?tname=subj-department&campuscd=UBCO&dept=DATA&pname=subjarea"
    ]
    custom_settings = {
        'USER_AGENT': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36',
    }

    def __init__(self):
        self.log_file = open('log_file', 'w')

    def parse(self, response):
        url = "https://courses.students.ubc.ca/cs/courseschedule?pname=subjarea&tname=subj-course&campuscd=UBCO"
        soup = BeautifulSoup(response.text, 'html5lib')
        tables = soup.find_all("table")
        row = []
        df = []
        df2 = []
        for i,entry in enumerate(tables[0].find_all("td")):
            if "DATA 5" in entry.text:
                item = CourseItem()
                df.append(entry.text)
                item['course_name'] = entry.text
                for j,ent in enumerate(entry.find_all("a")):
                    df2.append(url + str(ent.get('href'))[-21:])
                    item["url_link"] = (url + str(ent.get('href'))[-21:])
                    ubc_request = requests.get(item["url_link"])
                    pre_reqs = self.parse_course_details(ubc_request)
                    item["pre_req"] = pre_reqs
                yield item
                # print(item['course_name'], file=self.log_file)
                # print(item['url_link'], file=self.log_file)
                # print(item['pre_req'], file=self.log_file)
        df_courses = pd.DataFrame(df, columns = ["Course"])
        df_course_links = pd.DataFrame(df2, columns = ["Course Page"])
        
        final_df = pd.concat([df_courses, df_course_links])
        return

    def parse_course_details(self, response):
        text = BeautifulSoup(response.text, 'html5lib')
        d_f = []
        p_all = text.find_all("p")
        test = 0
        data_list = "N/A"
        for i in p_all:
            if "Pre-reqs" in i.text and "DATA" in i.text:
                test = 1
                temp = i.text
                temp = temp.replace("Pre-reqs:", '')
                temp = temp.replace(".", '')
                temp = temp.replace("All of ", '')
                data_list = [item.strip() for item in temp.split(',')]
                d_f.append(data_list)
        if test == 0:
            d_f.append("N/A")
        return data_list
        pass