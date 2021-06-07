from bs4 import BeautifulSoup
import time
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

driver = webdriver.Chrome(executable_path='C:/Windows/chromedriver')

url = "https://www.bseindia.com/corporates/List_Scrips.aspx"

driver.get(url)

segment_element = driver.find_element_by_xpath('//*[@id="ContentPlaceHolder1_ddSegment"]').send_keys("Equity")

status_element = driver.find_element_by_xpath('//*[@id="ContentPlaceHolder1_ddlStatus"]').send_keys("Active")

submit = driver.find_element_by_xpath('//*[@id="ContentPlaceHolder1_btnSubmit"]').send_keys(Keys.RETURN)

download = driver.find_element_by_xpath('/html/body/div[1]/form/div[4]/div/div/div[2]/div/div/div[2]/a/i').click()
time.sleep(5)

driver.quit()

