# Lua Extended Table Library Documentation
Written By Greenman

Notice: The documentation is not finished

### Quick Tip
If the return type of a function in here is `None`, it means that the function modifies the table that was passed in.

## Functions List
Click a function name to skip to its documentation:<br>
[copyWithin](#tablecopywithin)<br>
[every](#tableevery)<br>
[fill](#tablefill)<br>
[filter](#tablefilter)<br>
[find](#tablefind)<br>
[findIndex](#tablefindindex)<br>
[from](#tablefrom)<br>
Unfinished

### table.copyWithin
Function: `Void table.copyWithin(table,target[,start,stop])`<br>
Purpose: Copies elements from within the array to a new position<br>
Arguments:<br>
`Table array` - The **sorted** table you want to modify<br>
`Number<int> target` - The position to move the copied array elements to<br>
Optional Arguments:<br>
`Number<int> start` - The index to start copying elements from. The default value is 1.<br>
`Number<int> stop` - The index to stop copying elements from. The default value is the last index.<br>
Example:
```lua
local cart = {"Apples", "Oranges", "Bananas", "Pineapples", "Kiwis"}
table.copyWithin(cart,3,1,3) --copied "Apples","Oranges"
--the elements will be pasted at index 3 (where "Bananas" is)
table.foreach(cart,print)
```
Output:
```
1 "Apples"
2 "Oranges"
3 "Apples"
4 "Oranges"
5 "Kiwis"
```

### table.every
Function: `Boolean table.every(table,callback)`<br>
Purpose: Checks every element in the array meets a condition (which is provided by the function). If all elements meet the condition, true is returned, but if one of the elements does not meet the condition, false is returned.<br>
Arguments:<br>
`Table array` - The **sorted** table you want to check<br>
`callback - function(currentValue[,index,table])` - The function that is ran for each element of the array. The function must return a boolean.<br>
Example:
```lua
local ages = {10,13,16,18,20,21}

function canVote(val) --most of the time, all you need to use is the element argument
  return val >= 18 --this condition will result in a boolean
end

print("Everyone can vote: "..tostring(table.every(ages,canVote))) --false because there are numbers less than 18 in the table
```
Output:
```
false
```

### table.fill
Function: `None table.fill(table,value,start,stop)`<br>
Purpose: Fills a table with a value from start to end. It only fills indices were the value is not `nil` and modifies the original table.
Arguments:<br>
`Table array` - The **sorted** table you want to fill<br>
`Variant value` - The value to fill the table with<br>
Optional Arguments:<br>
`Number<int> start` - The index to start filling values at. The default is 0. <br>
`Number<int> stop` - The index to stop filling values at. The default is the last index.<br>
Example:
```lua
local x = {1,2,3,4,5,6,7,8,9,10}
table.fill(x,0,5,7) --the numbers 5-7 in the table will now be 0
table.foreach(x,print)
```
Output:
```
1 1
2 2
3 3
4 4
5 0
6 0
7 0
8 8
9 9
10 10
```

### table.filter
Function: `Table table.filter(table,callback)`<br>
Purpose: Passes the table elements into the function and if the value makes the function return true, it is inserted into the new table.<br>
Arguments:<br>
`Table array` - The **sorted** table you want to filter<br>
`callback - function(currentValue[,index,table])` - The function that is ran for each element of the array. The function must return a boolean.<br>
Example:
```lua
local randomAges = {3, 8, 10, 14, 15, 20, 25, 34, 46, 47}
local adults = table.filter(randomAges,function(val) --adults will contain numbers 18 or higher
  return val >= 18
  --breakdown: index 1 - 3 >= 18 resolves to false so 3 is not inserted into the new table
end)
table.foreach(adults,print)
```
Output:
```
1 20
2 25
3 34
4 46
5 47
```

### table.find
Function: `Variant table.find(table,callback)`<br>
Purpose: Passes each element of the table into the function and returns the first value that makes the function return true. If the function doesn't return true for any of the elements, nil is returned.<br>
Arguments:<br>
`Table array` - The **sorted** table that you want to search<br>
`callback - function(currentValue[,index,table])`- The function that is ran for each element of the array. The function must return a boolean.<br>
Example:
```lua
local x = {1, 3, 11, 14, 19}
print("First even number: "..table.find(x,function(val)
	return val%2 == 0
end))
--tip: if the value is not a string or number, use tostring
```
Output:
```
First even number: 14
```

### table.findIndex
Function: `Variant table.findIndex(table,callback)`<br>
Purpose: Passes each element of the table into the function and returns the index of first value that makes the function return true. If the function doesn't return true for any of the elements, nil is returned.<br>
Arguments:<br>
`Table array` - The **sorted** table that you want to search<br>
`callback - function(currentValue[,index,table])`- The function that is ran for each element of the array. The function must return a boolean.<br>
Example:
```lua
local x = {1, 3, 11, 14, 19}
print("Index of first even number: "..table.findIndex(x,function(val)
	return val%2 == 0
end))
```
Output:
```
Index of first even number: 4
```

### table.from
Function: `Table table.from(string[,callback])`<br>
Purpose: Takes a string and splits it into characters which are inserted into the table in order. If the callback is provided, each character of the string is passed into the function and the returned value will be the new value of that character.<br>
Arguments:<br>
`Table array` - The **sorted** table that you want to search<br>
`String string` - The string you want to split into a table from<br>
Optional Arguments:<br> 
`callback - function(currentValue[,index,table])`- The function that is ran for each character of the string. The function must return a value.<br>
Example:
```lua
local message = "HELLO"
local x = table.from(message,function(c)
    return string.lower(c) --makes every character lowercase
end)
table.foreach(x,print)
```
Output:
```
1   h
2   e
3   l
4   l
5   o
```
