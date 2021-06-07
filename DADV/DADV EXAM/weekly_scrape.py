import requests
import urllib
from bs4 import BeautifulSoup
import re
import io
import gzip
import time
import csv
import os
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import pandas as pd
from multiprocessing import Pool


def Weekly_Scrape(symbol):
    driver = webdriver.Chrome("C:\Windows\chromedriver.exe")
    url = "https://query1.finance.yahoo.com/v7/finance/download/"+symbol+"?period1=1451692800&period2=1609545600&interval=1wk&events=history&includeAdjustedClose=true"
    driver.get(url)
    time.sleep(2)

driver = webdriver.Chrome(executable_path='C:/Windows/chromedriver')
url = "https://en.wikipedia.org/wiki/List_of_S%26P_500_companies"
driver.get(url)

table = driver.find_element_by_xpath("/html/body/div[3]/div[3]/div[5]/div[1]/table[1]/tbody")

table_data = table.text.encode("utf-8")
table_rows = table_data.decode("utf-8")
table_rows = table_rows.split("\n")

symbols_list = []
for each_row in table_rows:
    temp_list = each_row.split(" ")
    symbols_list.append(temp_list[0])

# Weekly_Scrape("MMM")

for symbol in symbols_list:
    Weekly_Scrape(symbol)

# if __name__ == '__main__':
#     p = Pool(25)
#     df_daily_list = p.map(Daily_Scrape, symbols_list)
#     p.close()
