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
[includes](#tableincludes)<br>
[indexOf](#tableindexof)<br>
[join](#tablejoin)<br>
[lastIndexOf](#tablelastindexof)<br>
[indexOf](#tableindexof)<br>
[map](#tablemap)<br>
[reduce](#tablereduce)<br>
[reduceRight](#tablereduceright)<br>
[reverse](#tablereverse)<br>
[shift](#tableshift)<br>
[slice](#tableslice)<br>
[some](#tablesome)<br>
[toString](#tabletostring)<br>
[unshift](#tableunshift)

### table.copyWithin
Function: `Void table.copyWithin(table,target[,start,stop])`<br>
Purpose: Copies elements from within the table to a new position<br>
Arguments:<br>
`Table array` - The **sorted** table you want to modify<br>
`Number<int> target` - The position to move the copied table elements to<br>
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
Purpose: Checks every element in the table meets a condition (which is provided by the function). If all elements meet the condition, true is returned, but if one of the elements does not meet the condition, false is returned.<br>
Arguments:<br>
`Table array` - The **sorted** table you want to check<br>
`callback - function(currentValue[,index,table])` - The function that is ran for each element of the table. The function must return a boolean.<br>
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
`callback - function(currentValue[,index,table])` - The function that is ran for each element of the table. The function must return a boolean.<br>
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
`callback - function(currentValue[,index,table])`- The function that is ran for each element of the table. The function must return a boolean.<br>
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
Function: `Number<int> table.findIndex(table,callback)`<br>
Purpose: Passes each element of the table into the function and returns the index of first value that makes the function return true. If the function doesn't return true for any of the elements, nil is returned.<br>
Arguments:<br>
`Table array` - The **sorted** table that you want to search<br>
`callback - function(currentValue[,index,table])`- The function that is ran for each element of the table. The function must return a boolean.<br>
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

### table.includes
Function: `Boolean table.includes(table,value[,start])`<br>
Purpose: Searches the table for the value and if the value is found, true is returned but if the value is not found, false is returned. If start is provided, the table will only be searched starting from that index.<br>
Arguments:<br>
`Table array` - The **sorted** table that you want to search<br>
`Variant value` - The value you want to search for in the table<br>
Optional Arguments:<br> 
`Number<int> start`- The index in the table to start searching from. If the argument isn't provided, the search starts at index 1 in the table.<br>
Example:
```lua
local accounts = {"John","Michael","Beth","Karen","Joe","Jane"}

local accountname = io.read() --user input

if table.includes(accounts,accountname) then
    print("Your account was found")
else
    print("Your account was not found")
end
```
Output:
```
> Beth
Your account was found
```

### table.indexOf
Function: `Number<int> table.indexOf(table,value[,start])`<br>
Purpose: Searches the table for the value and if the value is found, the index of that value is returned but if the value is not found, -1 is returned. If start is provided, the table will only be searched starting from that index.<br>
Arguments:<br>
`Table array` - The **sorted** table that you want to search<br>
`Variant value` - The value you want to search for in the table<br>
Optional Arguments:<br> 
`Number<int> start`- The index in the table to start searching from. If the argument isn't provided, the search starts at index 1 in the table.<br>
Example:
```lua
local numbers = {1, 3, 11, 14, 19}
local search = io.read("*n") --user input that only accepts numbers
local result = table.indexOf(numbers,search)

if result ~= -1 then
  print(search.." is in the table at index "..result)
else
  print(search.." is not in the table exist")
end
```
Output:
```
> 19
19 is in the table at index 5
```

### table.join
Function: `String table.join(table[,separator])`<br>
Purpose: Joins all of the elements of the table into a string and each element is separated by a separator. If no separator is provided, the default separator is a comma<br>
Arguments:<br>
`Table array` - The **sorted** table that you want to join<br>
Optional Arguments:<br> 
`String separator`- The string that will separate each element of the table in the formed string<br>
Example:
```lua
local numbers = {1, 3, 11, 14, 19}
print(table.join(numbers,"|"))
```
Output:
```
1|3|11|14|19
```

### table.lastIndexOf
Function: `Number<int> table.lastIndexOf(table,value[,start])`<br>
Purpose: Searches the table for the value and if the value is found, the index of the last occurence of that value in the table is returned but if the value is not found at all, -1 is returned. If start is provided, the table will only be searched starting from that index.<br>
Arguments:<br>
`Table array` - The **sorted** table that you want to join<br>
`Variant value` - The element to search for in the table<br>
Optional Arguments:<br> 
`String separator`- The string that will separate each element of the table in the formed string<br>
Example:
```lua
local numbers = {1, 3, 11, 14, 19, 14, 15, 13}
print("The last occurence of 14 is at index: "..table.lastIndexOf(numbers,14))
```
Output:
```
The last occurence of 14 is at index: 6
```

### table.map
Function: `Table table.map(table,callback)`<br>
Purpose: Passes each element of the table into the callback function and puts the results of the callback into the new table.<br>
Arguments:<br>
`Table array` - The **sorted** table that you want to join<br>
`Function callback - function(currentValue[,index,table])` - The function that will be executed for every element of the table. If the function returns a value, that value will be the value of the element in the new table.
Example:
```lua
local numbers = {1, 3, 11, 14, 19}
local squaredNumbers = table.map(numbers,function(val)
	return val*val
end)
table.foreach(squaredNumbers,print)
```
Output:
```
1   1
2   9
3   121
4   196
5   361
```

### table.reduce
Function: `Variant table.reduce(table,callback[,initalValue])`<br>
Purpose: Reduces the table down to one value. This value is created by running every element of the table through the callback function. The value returned is the accumulator after the function has been called on each element on the table and the accumulator is set to the value returned by the function each time.<br>
Arguments:<br>
`Table array`- The **sorted** table that you want to reduce<br>
`Function callback - function(accumulator,currentValue[,index,table])` - The function that will be executed for every element of the table. The accumulator is intially set to the first element of the table if the initalValue is not set.<br>
Optional Arguments:<br>
`Variant initialValue` - The initial value of the accumulator. If this argument isn't provided, the default value of the accumulator is the first element in the table and the function will not be executed on the first element of the table.
Example:
```lua
--number example
local numbers = {3,6,7,4,1}
local sum = table.reduce(numbers,function(acc,val)
	return acc+val 
end)
print("The sum of the numbers is "..sum)

--string example
local words = {"this","table","library","is","awesome"}
local message = table.reduce(words,function(acc,val)
	return acc.." "..val
end)
print("If you put all of the words together you get: "..message)
```
Output:
```
The sum of the numbers is 21
If you put all of the words together you get: this table library is awesome
```

### table.reduceRight
Function: `Variant table.reduceRight(table,callback[,initalValue])`<br>
Purpose: Reduces the table down to one value. This value is created by iterating backwards through the table and running every element of the table through the callback function. The value returned is the accumulator after the function has been called on each element on the table and the accumulator is set to the value returned by the function each time.<br>
Arguments:<br>
`Table array`- The **sorted** table that you want to reduce right<br>
`Function callback - function(accumulator,currentValue[,index,table])` - The function that will be executed for every element of the table. The accumulator is intially set to the first element of the table if the initalValue is not set.<br>
Optional Arguments:<br>
`Variant initialValue` - The initial value of the accumulator. If this argument isn't provided, the default value of the accumulator is the first element in the table and the function will not be executed on the first element of the table.
Example:
```lua
local words = {"the","words","of","this","sentence","are","in","the","wrong","order"}
local message = table.reduceRight(words,function(acc,val)
	return acc.." "..val
end)
print("If you put the words together from right to left you get: "..message)
```
Output:
```
If you put the words together from right to left you get: order wrong the in are sentence this of words the
```

### table.reverse
Function: `None table.reverse(table)`<br>
Purpose: Reverses the order of the elements in the table<br>
Arguments:<br>
`Table array` - The **sorted** table you want to reverse<br>
Example:<br>
```lua
local numbers = {1,2,3,4,5}
table.reverse(numbers)
table.foreach(numbers,print)
```
Output:
```
1   5
2   4
3   3
4   2
5   1
```

### table.shift
Function: `None table.shift(table)`<br>
Purpose: Removes the first element of the table and shifts the remaining elements down the indices<br>
Arguments:<br>
`Table array` - The **sorted** table you want to remove the first element from and shift<br>
Example:
```lua
local numbers = {1,2,3,4,5}
table.shift(numbers)
table.foreach(numbers,print)
```
Output:
```
1   2
2   3
3   4
4   5
```

### table.slice
Function: `Table table.slice(table[,start,end])`<br>
Purpose: Selects elements from the table and returns a new table with those selected elements<br>
Arguments:<br>
`Table array` - The **sorted** table you want to select elements from<br>
Optional Arguments:<br>
`Number<int> start` - The index to start selecting elements from. If this argument is not provided, the default value is 1.<br>
`Number<int> stop` - The index to stop selecting elements from. If this argument is not provided, the default value is the last index of the table. Keep in mind that the element at this index is not part of the selection unless this argument is not provided.<br>
Example:
```lua
local numbers = {1,2,3,4,5,6,7,8,9,10}
--it's better to set it to the table itself but I did it for demo purposes
local numbersCopy = table.slice(numbers) --no start and stop
local firstFive = table.slice(numbers,1,6) --start and stop
print("Copy of numbers:")
table.foreach(numbersCopy,print)
print("") --line break
print("First 5 elements of numbers:")
table.foreach(firstFive,print)
```
Output:
```
Copy of numbers:
1   1
2   2
3   3
4   4
5   5
6   6
7   7
8   8
9   9
10  10

First 5 elements of numbers:
1   1
2   2
3   3
4   4
5   5
```

### table.some
Function: `Boolean table.some(table,callback)`<br>
Purpose: Passes the table elements into the callback function and if the value makes the callback return true, true is returned and no other values are checked. Otherwise, false is returned.<br>
Arguments:<br>
`Table array` - The **sorted** table you want to select elements from<br>
`callback - function(currentValue[,index,table])` - The function that is ran for each element of the table. The function must return a boolean.<br>
Example:
```lua
local ages = {3, 10, 18, 20}
local result = table.some(ages,function(val)
	return val >= 18
end)

if result == true then
	print("There is an adult in the table")
end
```
Output:
```
There is an adult in the table
```

### table.toString
Function: `String table.toString(table)`<br>
Purpose: Converts the table to a string by concatenating all of the elements together and separating each element with a comma<br>
Arguments:<br>
`Table array` - The **sorted** table to convert to a string<br>
Example:
```lua
local lotteryNumbers = {21,34,17,50,42}
print("Today's lottery numbers: "..table.toString(lotteryNumbers))
```
Output:
```
Today's lottery numbers: 21,34,17,50,42
```

### table.unshift
Function: `None table.unshift(table,value1,value2, ... value_n)`<br>
Purpose: Inserts a variable amount of elements into the beginning of the table in the order they were passed into the function<br>
Arguments:<br>
`Table array` - The **sorted** table to insert elements into<br>
Example:
```lua
local numbers = {3,4,5}
table.unshift(numbers,1,2)
table.foreach(numbers,print)
```
Output:
```
1   1
2   2
3   3
4   4
5   5
```
