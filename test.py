import uno
document = XSCRIPTCONTEXT.getDocument()

def write_something():
    month = "APRIL"
    div = "Div1"
    sheets = document.getSheets()
    firstSheet = sheets.getByIndex(0)
    firstSheet.getCellRangeByName("A1").setString('hiwwqqii')
