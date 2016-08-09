
map = {}

--创建一个map
function map:new()
	local object = {}
	
	setmetatable(object, self)
	self.__index = self
	
	--用一个table来保存key
	self.__keyList = {}
	
	return object
end

--插入元素[如果已存在该key,则不做改动，和STL一致]
function map:insert(key, value)
	if(self[key] == nil) then
		self[key] = value
		table.insert(self.__keyList, key)
	end
	return self
end

--插入元素[如果已存在该key,则用新的value覆盖原有的value，与STL的“[key] = value 类似”]
function map:assign(key, value)
	if(self[key] == nil) then
		self[key] = value
		table.insert(self.__keyList, key)
	else
		self[key] = nil
		self[key] = value
	end
	return self
end

--返回map中元素的个数
function map:size()
	return table.getn(self.__keyList)
end

--如果map为空则返回true
function map:empty()
	if(map:size() == 0) then
		return true
	else
		return false
	end
end

--删除一个元素,根据key删除value【只实现stl的其中一个重载】
function map:erase(key)
	if(self[key] == nil) then
		return self
	else
		for i = 1, table.getn(self.__keyList) do
			if(self.__keyList[i] == key) then
				table.remove(self.__keyList, i)
				break;
			end
		end
		self[key] = nil
	end
end

--删除所有元素
function map:clear()
	for i = 1, map:size() do
		self[self.__keyList[1] ] = nil
		table.remove(self.__keyList, 1)
	end
	
end

--根据key返回对应的value[lua特有，stl无此功能]
function map:value(key)
	return self[key]
end

--返回迭代器函数[lua特有，stl无此功能]
function map:iter()
	local i = 0
	local n = self:size()
	return function()
		i = i + 1
		if(i <= n) then
			return self.__keyList[i]
		else
			return nil
		end
	end
end

--传入key，返回key所在的迭代函数[lua特有，stl无此功能]
function map:find(key)
	local idx = 0
	local n = self:size()
	for i = 1, n do
		if(self.__keyList[i] == key) then
			idx = i - 1
			break
		end
	end
	return function()
		idx = idx + 1
		if(idx <= n) then
			return self.__keyList[idx]
		else
			return nil
		end
	end
end

---------------------------------------------------------------------------------------
--部分测试代码：
--stl-vector map
-- dofile("./stl_map.lua")

--创建map
stlMap = map:new()

--插入元素方法1【对于已存在的key不会改变他的value】：
stlMap:insert("a", 1)
stlMap:insert("b", 2)

--插入元素方法2【对于已存在的key会改变他的value】：
stlMap:assign("b", 3)
stlMap:assign("c", 4)
stlMap:assign("d", 5)
stlMap:assign("e", 6)

--删除一个参数
stlMap:erase("a")

--删除所有参数
--stlMap:clear()

--用iter产生迭代函数遍历
it = stlMap:iter()
--用find函数，产生迭代函数遍历key之后的值
it = stlMap:find("b")
while true do
	local temp = it()
	if temp == nil then
		break
	else
		print(stlMap:value(temp))
	end
end