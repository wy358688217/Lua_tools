require "Object-lua"
local http = require("socket.http")
local ltn12 = require("ltn12")

Util = class()

function Util:ctor()	-- 定义 Util 的构造函数
	--print("Util ctor")
end

function Util:http_get(u)
   local t = {}
   local r, c, h = http.request{
      url = u,
      sink = ltn12.sink.table(t)}
   return r, c, h, table.concat(t)
end

function Util:print_table( _table , _name )
	print(_name..":[")
	if type(_table) == "table" then
	  for k, v in pairs(_table) do
		  print(" "..k,v)
	  end
	end
	print("]")
end

function Util:encode( _table )
	if type(_table) == "table" then
	  for k, v in pairs(_table) do
	  	json = k.."="..v..","
		  return k.."="..v
	  end
	end
end