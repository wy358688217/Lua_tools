function fastSort()
	print ('Hello.I am Lua')
end
fastSort()
-- print (fastSort())

function callBackBlock(callBackBlockFunc)
	-- body
	callBackBlockFunc('回调函数')
end

function callBack(a)
	-- body
	print (a)
end
--callBackBlock(callBack)
local json = require ("cjson")
local parameters = {["uName"] = "13611851976",["password"] = "123456"}
print(parameters.uName)
print(parameters.password)
local dataMap = {["data"] = parameters}
local parameters_map = dataMap.data
print(parameters_map.uName)
print(parameters_map.password)
local jsonStr = json.encode(dataMap);
print(jsonStr);