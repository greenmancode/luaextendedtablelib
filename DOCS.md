# Lua Extended Table Library Documentation
Written By Greenman

Notice: The documentation is not finished

## Functions List
Click a function name to skip to its documentation:
WIP ignore for now

### table.copyWithin
Function: `Void table.copyWithin(target[,start,stop])`<br>
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
