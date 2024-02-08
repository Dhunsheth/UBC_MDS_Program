# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class CourseItem(scrapy.Item):
    # define the fields for your item here like:
    course_name = scrapy.Field()
    url_link = scrapy.Field()
    pre_req = scrapy.Field()
    pass
