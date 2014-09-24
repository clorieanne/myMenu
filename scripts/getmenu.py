from dosql import *
import cgi
import simplejson as json

def index(menuid):
  menuid = cgi.escape(menuid)
  x = doSql()
  restos = x.execqry("select * from get_menu_perid(" + menuid + "); " , False)
  result = []
  for resto in restos:
    stringed = map(str, resto)
    result.append(stringed)

  return json.dumps(result)
