import time
from selenium import webdriver

driver = webdriver.Chrome(executable_path='C:/Windows/chromedriver')

driver.get("https://datasets.imdbws.com/")

driver.find_element_by_partial_link_text("name.basics.tsv.gz").click()
driver.find_element_by_partial_link_text("title.akas.tsv.gz").click()
driver.find_element_by_partial_link_text("title.basics.tsv.gz").click()
driver.find_element_by_partial_link_text("title.crew.tsv.gz").click()
driver.find_element_by_partial_link_text("title.episode.tsv.gz").click()
driver.find_element_by_partial_link_text("title.principals.tsv.gz").click()
driver.find_element_by_partial_link_text("title.ratings.tsv.gz").click()


