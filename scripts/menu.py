from dosql import *
import cgi
import json

def addmenu(menuid, menuname, menucost):
  menuid = cgi.escape(menuid)
  menuname = cgi.escape(menuname)
  menucost = cgi.escape(menucost)
  x = doSql()
  resto = x.execqry("select * from get_menu_perid('" + menuid + "', '" + menuname + "', '" + menucost + "',); " , False)
  result = []
  for restos in resto:
    stringed = map(str, restos)
    result.append(stringed)

  return json.dumps(result)
