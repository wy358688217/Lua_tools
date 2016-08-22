local http = require("socket.http")
local ltn12 = require("ltn12")
 
function http.get(u)
   local t = {}
   local r, c, h = http.request{
      url = u,
      sink = ltn12.sink.table(t)}
   return r, c, h, table.concat(t)
end
 
-- url = "http://www.baidu.com"
-- r,c,h,body=http.get(url)
-- if c~= 200 then
--     return
-- end
-- print(body)