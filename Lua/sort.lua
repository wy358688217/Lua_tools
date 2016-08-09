--[[  
print an array with some descriptions  
    descriptions  打印array之前的描述信息  
    array 需要打印的数组  
--]]  
function show(descriptions,array)  
    io.write(descriptions,"\n\r\t")  
    for i,value in ipairs(array) do  
        io.write(value)  
        if array[i+1] then  
            io.write(",")  
        end  
    end  
    io.write("\n\r")  
end  
--[[  
获取数组的长度  
--]]  
function GetArrayLength(array)  
    local n=0;  
    while array[n+1] do  
        n=n+1  
    end  
    return n;  
end  
--[[  
冒泡排序  
    array 需要排序的数字  
    compareFunc 比较函数  
--]]  
function bubbleSort(array,compareFunc)  
    local len = GetArrayLength(array)  
    local i = len  
    while i > 0 do  
        j=1  
        while j< len do  
            if compareFunc(array[j],array[j+1]) then  
                array[j],array[j+1] = array[j+1],array[j]  
            end  
            j = j + 1  
        end  
        i = i - 1  
    end  
end  
  
  
--[[  
选择排序算法  
    array 需要排序的数字  
    compareFunc 比较函数  
--]]  
function selectSort(array,compareFunc)  
    local len = GetArrayLength(array)  
    local i = 1  
    while i <= len do  
        local j= i + 1  
        while j <=len do  
            if compareFunc(array[i],array[j]) then  
                array[i],array[j] = array[j],array[i]  
            end  
            j = j + 1  
        end  
        i = i + 1  
    end  
end  
  
--[[  
快速排序方便统一调用  
    array 需要排序的数字  
    compareFunc 比较函数  
--]]  
function quickSort(array,compareFunc)  
    quick(array,1,GetArrayLength(array),compareFunc)  
end  
  
--[[  
快速排序  
    array 需要排序的数字  
    left  左边已经完成比较的数组下标  
    right 右边已经完成比较的数组下标  
    compareFunc 比较函数  
--]]  
function quick(array,left,right,compareFunc)  
    if(left < right ) then  
        local index = partion(array,left,right,compareFunc)  
        quick(array,left,index-1,compareFunc)  
        quick(array,index+1,right,compareFunc)  
    end  
end  
  
--[[  
快速排序的一趟排序  
    array 需要排序的数字  
    left  左边已经完成比较的数组下标  
    right 右边已经完成比较的数组下标  
    compareFunc 比较函数  
--]]  
function partion(array,left,right,compareFunc)  
    local key = array[left] -- 哨兵  一趟排序的比较基准  
    local index = left  
    local temp = array[index]
    array[index] = array[right]
    array[right] = temp
    -- array[index],array[right] = array[right],array[index] -- 与最后一个元素交换  
    local i = left  
    while i< right do  
        if compareFunc( key,array[i]) then  
            local temp = array[index]
            array[index] = array[i]
            array[i] = temp 
            -- array[index],array[i] = array[i],array[index]-- 发现不符合规则 进行交换  
            index = index + 1  
        end  
        i = i + 1  
    end  
    local endTemp = array[right]
    array[right] = array[index]
    array[index] = endTemp
    -- array[right],array[index] = array[index],array[right] -- 把哨兵放回  
    return index;  
end  
  
  
array={5,6,7,9,2,3,4,8,1,12,11,10}  
show("original array",array)  
  
bubbleSort(array, function(x,y) return x<y end)  
show("after bubbleSort array",array)  
selectSort(array, function(x,y) return y<x end)  
show("after selectsort array", array)  
quickSort(array, function(x,y) return x<y end)  
show("after quickSort array", array) 