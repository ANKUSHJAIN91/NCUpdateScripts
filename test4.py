import uno
import ssl
ssl._create_default_https_context = ssl._create_stdlib_context
import urllib.request
document = XSCRIPTCONTEXT.getDocument()
url = 'https://n8n.jcityoffice.com/webhook/78aaa2aa-bd89-44ad-bc59-9ba8db3e7d00?Div=Div1&month=April'

def write_something():
    month = "APRIL"
    div = "Div1"
    sheets = document.getSheets()
    firstSheet = sheets.getByIndex(0)
    firstSheet.getCellRangeByName("A1").setString('hhhhhh')
    firstSheet.getCellRangeByName("A4").setString('rrrrr')
    try:
        with urllib.request.urlopen(url) as f:
            data = f.read().decode('utf-8')  # Decode bytes to string
            print(data)  # Print the data for debugging
            firstSheet.getCellRangeByName("A2").setString(data)
        firstSheet.getCellRangeByName("A3").setString('aaaa')
        firstSheet.getCellRangeByName("A4").setString('bbbb')
    except urllib.error.URLError as e:
        firstSheet.getCellRangeByName("A4").setString(str(e))
    return None
