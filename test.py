import uno
import urllib.request
# document = XSCRIPTCONTEXT.getDocument()
url = 'https://n8n.jcityoffice.com/webhook/78aaa2aa-bd89-44ad-bc59-9ba8db3e7d00?Div=Div1&month=April'

print(urllib.request.urlopen(url))

def write_something():
    month = "APRIL"
    div = "Div1"
    # sheets = document.getSheets()
    # firstSheet = sheets.getByIndex(0)
    # firstSheet.getCellRangeByName("A1").setString('hhhhhh')
    # firstSheet.getCellRangeByName("A4").setString('rrrrr')
    # firstSheet.getCellRangeByName("A5").setString(urllib.request.urlopen(url))
    print(urllib.request.urlopen(url))
    try:
        with urllib.request.urlopen(url) as f:
            # print(f.read(300))
            print(f.read())
            firstSheet.getCellRangeByName("A2").setString(f.read())
            firstSheet.getCellRangeByName("A3").setString('aaaa')
        firstSheet.getCellRangeByName("A4").setString('bbbb')
    except urllib.error.URLError as e:
        firstSheet.getCellRangeByName("A4").setString(e)
        return None
    
