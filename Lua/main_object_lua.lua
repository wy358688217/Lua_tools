require "test_object_lua"
require "table"
a = test.new(1)	-- 输出两行，base_type ctor 和 test ctor 。这个对象被正确的构造了。
a:print_x()	-- 输出 1 ，这个是基类 base_type 中的成员函数。
a:hello()	-- 输出 hello test ，这个函数被重载了。

local tblTest2 =
{
    1,
    a = 2,
    3,
    4,
    6,
}

-- print(table.getn(tblTest2))
print(#tblTest2)