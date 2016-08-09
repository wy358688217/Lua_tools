local http = require "socket.http"
local ltn12 = require "ltn12"
-- local util = require "util"
local test = require"http_test"
print(test)

url = "http://www.baidu.com"
r,c,h,body=test.http.get(url)
if c~= 200 then
    return
end
print(body)


-- local reqbody = "anid=&protocol=1&guid=dfe49e55b63f2cf93eb9aabe44b6d9dc5286bbbedfcbf1c75b95f7a4f7439029&d_type=phone&os_version=6.1&ate=1&asid=079ABF64-A23A-4E3B-9000-19A4A608CCBE&affiliate=&modin=7c78d075f379db2f40c9f68df857cb87&os=ios&d_id=107b2734fdb7898251f62d229168484a9d14f7fb654d02d957b30c9f22bb094c&d_code=1E5D02FF-63F3-43A0-A2BF-80E63E00F76C&pn_device_id=&name_hint=iPhone%20Simulator&d_sig=dfe49e55b63f2cf93eb9aabe44b6d9dc5286bbbedfcbf1c75b95f7a4f7439029&hdid=62624a01f8715f2b838224a4a285746d&tracker=&appid=536381662&odin=1da61c680b672c4e114df45cd5f8f0aa9b088338&model=iPhone%20Simulator&ver=15&campaign=&imei=&store_type=apple&"
-- local respbody = {} 
-- local  body, code, headers, status = http.request {
--     method = "POST",
--     url = "https://freshdeck.idle-gaming.com/api/guest_session/",
--     source = ltn12.source.string(reqbody),
--     headers = 
--             {
--                     ["Accept"] = "*/*",
--                     ["Accept-Encoding"] = "gzip, deflate",
--                     ["Accept-Language"] = "en-us",
--                     ["Content-Type"] = "application/x-www-form-urlencoded",
--                     ["content-length"] = string.len(reqbody)
--             },
--     sink = ltn12.sink.table(respbody)
-- }

-- print('body:' .. tostring(body))
-- print('code:' .. tostring(code))
-- -- print('headers:' .. util.tableToString(headers))
-- -- print('status:' .. tostring(status))

-- print("respbody:[")
-- if type(respbody) == "table" then
--   -- print("  "..table.concat(respbody))
--   for k, v in pairs(respbody) do
--       print(" ".."k = "..k, " v = "..v)
--       -- local map = json.decode(v)
--       -- print(map)
--       -- for _k, _v in pairs(map) do
--       --    print(" ".."k = ".._k, " v = ".._v)
--       -- end
--   end
-- else
--   print("Not a table:", type(respbody))
-- end
-- print("]")