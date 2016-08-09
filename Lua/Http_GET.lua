-- load the http module
local io = require("io")
local http = require("socket.http")
local ltn12 = require("ltn12")
local json = require ("json")
require ("Util")

--������ʽ����
local PUBLIC_NET = "http://www.guokaodashi.com/gkapp_server/"
--����system����
local PRIVATE_NET = "http://system.guokaodashi.com/gkapp_server/"
--ʵ������
local TAIL_URL = "resolve"--/get?data={\"repId\":65,\"repType\":\"3\"}"--"onlineExam/list"--"onlineExam/getUserExamReport" --up5/user/login"

--�ɱ�����ͷ
local cache_token   = ""
local platform     = 2 -- 1.Androd 2.iOS
local version      = "4.4.3"
local user_agent   = "GuoKao/4.4.3 (iPhone; iOS 9.3.3; Scale/2.00)"
local device_id    = "cd60379e6fb30011f8d2ce61de486eb00c20f398298a1df7a0ec1ac7ad5c2179" -- iphone

local user_token_map = {
  ["time"]  = 1470457552263,
  ["sign"]  = "b19a034da0ea490f0331f8014d41ae76",
  ["uid"]   = "20160806122552263~629962554",
  ["token"] = "IFe51txrQpM6T64HWOHDOx1kZC0Jb73pYT3E2gS/Q7SHRHH1d2x/3GLUEIKADRiG",
  ["rm"]    = "pXYUM4hEDdP9xlDNqAkMtJyBpIMhFqwY8EgXQDSCYMsPwdCxHcBHq45R25qUf0oMcBskM2j3mwVmABpjit+M/7b7aG0cShg2aDI4a4iOKo6yPHiFLFWQLIaglYv26iLdCkfqxvKHV+7W1UEuxa6eOkC1ZLuyw/spr4fDB88s9RxWfm2L4WO/CLCAZrpba/TrxDhIU4ET6v7BB2cRyhRKQnkaS4YFU2jNlOdTLUlAQ2ika+eWU9HkwqcDzWzdOYigK99FFhcY48FSQzp9HPX+L3QfPBB8prCpXxYej9h6dXmjZ65U5qjjDnMTvHYUQSB1rdK3zv3WFJQQLongWK0shcLmAdPxGHLq+0y++9C6kLZlePO4MYrfoR0crhVAlImJ"
} --iphone

local user_token = json.encode(user_token_map)

--���ϲ��� תjson
local parameters = {
  ["repId"] = 65,
  ["repType"] =3
}--"{\"size\":\"10\",\"page\":1}"

print("URL:"..PRIVATE_NET..TAIL_URL)

local parameters_json = json.encode(parameters)
--print("parameters_json ��"..parameters_json)
local request_body_map = {["data"] = parameters_json}

util = Util.new()
local request_body = json.encode(request_body_map)--util:sz_T2S(request_body_map)
print("Content-Length :"..string.len(request_body))

-- �첽����
local response_body = {}
local res, code, response_headers = http.request{
  url = PRIVATE_NET..TAIL_URL,
  method = "POST",  --Ĭ�ϲ�д����GET
  headers =  {
  --��������ͷ�����̶�
    ["Content-Type"] = "application/x-www-form-urlencoded",
    ["Content-Length"] =  string.len(request_body),
    ["Transfer-Encoding"] = Identity,
    ["Connection"] = "keep-alive",
    ["Accept-Language"] = "zh-Hans-CN;q=1",
    ["User-Agent"] = user_agent,
    ["device_id"] = device_id,
    ["userToken"] = user_token,
    ["platform"] = platform,
    ["version"] = version,
  --ΨһҪ�������ͷ����
    ["cacheToken"] = cache_token,
  },
  -- source = ltn12.source.string([[data=parameters_json]]),
  source = ltn12.source.string(request_body),
  sink = ltn12.sink.table(response_body)
}

-- ��ӡ��ز���
print("res = "..res)
print("code = "..code)
print("request_body = "..request_body)

util:print_table(response_headers , "response_headers")

--print("request_body = "..request_body)
util:print_table(response_body , "response_body")



