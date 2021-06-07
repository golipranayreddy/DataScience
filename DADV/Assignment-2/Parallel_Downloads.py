# By using pool we can achive parallelizing the downloads

from bs4 import BeautifulSoup
import time
import csv
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import pandas as pd
import multiprocessing
from multiprocessing import Pool

df_equity = pd.read_csv("C:\\Users\\DELL\\Desktop\\DADV\\Assignment-2\\Equity.csv")

security_numbers = df_equity["Security Code"].tolist()

security_names = df_equity["Security Name"].tolist()

security_data = dict(zip(security_numbers, security_names))
    
def get_date(d,m,y):

    year = driver.find_element_by_xpath('/html/body/div[1]/div/div/select[2]')   
    for opt in year.find_elements_by_tag_name("option"):
        if opt.text == y:
            opt.click()
            break
    month = driver.find_element_by_xpath('/html/body/div[1]/div/div/select[1]')   
    for opt in month.find_elements_by_tag_name("option"):
        if opt.text == m:
            opt.click()
            break
    days = driver.find_element_by_xpath('/html/body/div[1]/table')
    for row in days.find_elements_by_tag_name('tr'):
        for col in row.find_elements_by_tag_name('td'):
            if col.text == d:
                row.click()
                return

def traverse_stock(security):
    security = str(security)
    element = driver.find_element_by_xpath('//*[@id="ContentPlaceHolder1_smartSearch"]')
    element.clear()
    element.send_keys(security)
    element.send_keys(Keys.ENTER)
    time.sleep(2)

    try:
        response = driver.find_element_by_xpath("/html/body/form/div[4]/div/div/div[1]/div/div[3]/div/div/table/tbody/tr[2]/td/div/div[2]/div/div/div[2]/div[1]/table/tbody/tr/td/div/div/div/ul/li")
        time.sleep(2)
    except Exception as e:
        pass

    if response.text == "No Match Found":
        return None
    else:
        from_date = driver.find_element_by_xpath('//*[@id="ContentPlaceHolder1_txtFromDate"]')
        from_date.clear()
        from_date.click()
        get_date("31","Dec","2015")

        to_date = driver.find_element_by_xpath('//*[@id="ContentPlaceHolder1_txtToDate"]')
        to_date.clear()
        to_date.click()
        get_date("31","Dec","2020")

        submit = driver.find_element_by_xpath('//*[@id="ContentPlaceHolder1_btnSubmit"]')
        submit.click()
        time.sleep(2)

        download_stock = driver.find_element_by_xpath("/html/body/form/div[4]/div/div/div[1]/div/div[4]/div/div/div[1]/div[4]/div[2]/div/span/a/i").click()

driver = webdriver.Chrome(executable_path='C:/Windows/chromedriver')

url = "https://www.bseindia.com/markets/equity/EQReports/StockPrcHistori.aspx?flag=0"

driver.get(url)

# By using pool we can achive parallelizing the downloads

p = multiprocessing.Pool()

p.map(traverse_stock, security_numbers)

