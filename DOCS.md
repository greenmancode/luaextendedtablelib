# Lua Extended Table Library Documentation
Written By Greenman

Notice: The documentation is not finished

## Functions List
Click a function name to skip to its documentation:
WIP ignore for now

### table.copyWithin
Function: `Void table.copyWithin(table,target[,start,stop])`<br>
Purpose: Copies elements from within the array to a new position<br>
Arguments:<br>
`Table array` - The **sorted** table you want to modify
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
