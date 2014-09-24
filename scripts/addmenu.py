from dosql import *
import cgi
import simplejson as json

def index(menuid, menuname, menucost):
  menuid = cgi.escape(menuid)
  menuname = cgi.escape(menuname)
  menucost = cgi.escape(menucost)
  x = doSql()
  restos = x.execqry("select * from addmenu(" + menuid + ", '" + menuname + "', '" + menucost + "'); ", True)
  result = []
  for resto in restos:
    stringed = map(str, resto)
    result.append(stringed)

  return json.dumps(result)
