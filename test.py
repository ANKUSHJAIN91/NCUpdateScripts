import uno
import urllib.request

document = XSCRIPTCONTEXT.getDocument()
url = 'https://n8n.jcityoffice.com/webhook/78aaa2aa-bd89-44ad-bc59-9ba8db3e7d00?Div=Div1&month=April'

def write_something():
    month = "APRIL"
    div = "Div1"
    sheets = document.getSheets()
    firstSheet = sheets.getByIndex(0)
    firstSheet.getCellRangeByName("A1").setString('hiwwqqii')
    with urllib.request.urlopen(url) as f:
        # print(f.read(300))
        print(f.read())
        firstSheet.getCellRangeByName("A1").setString(f.read())
    
