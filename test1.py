import uno
import urllib.request
from urllib.parse import urlencode
from urllib.request import urlopen
import csv
import json
import sys
import requests

document = XSCRIPTCONTEXT.getDocument()
def fetch_data(url):
    url = "https://n8n.jcityoffice.com/webhook/78aaa2aa-bd89-44ad-bc59-9ba8db3e7d00?Div=Div1&month=April"
    response = requests.get(url)
    if response.status_code == 200:
        # data = json.loads(response.text)
        data = response.text
        sheets = document.getSheets()
        firstSheet = sheets.getByIndex(0)
        firstSheet.getCellRangeByName("A1").setString('hiwwqqii')
        firstSheet.getCellRangeByName("A2").setString(data)
        # Process the data as needed
        return data
    else:
        print(f"Error fetching data: {response.status_code}")
        return None   
