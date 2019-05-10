--Lua Extended Table Library
--Created by Greenman 2019

function table.copyWithin(t,target,start,stop)
  local newt = {}
  for i=start or 1,stop-1 or #t do
    table.insert(newt,t[i])
  end
  local c = 1
  for j=target,#t do
    t[j] = newt[c]
    c = c+1
    if newt[c] == nil then
      break
    end
  end
end

function table.every(t,f)
  local b = true
  for k,v in ipairs(t) do
    if f(v,k,t) == false then
      b = false
      break
    end
  end
  return b
end

function table.fill(t,val,start,stop)
  for k,v in ipairs(t) do
    if k >= start and k <= stop then
      t[k] = val
    end
  end
end

function table.filter(t,f)
  local newt = {}
  for k,v in ipairs(t) do
    if f(v,k,t) == true then
      table.insert(newt,v)
    end
  end
  return newt
end

function table.find(t,f)
  local res = nil
  for k,v in ipairs(t) do
    if f(v,k,t) == true then
      res = v
      break
    end
  end
  return res
end

function table.findIndex(t,f)
  local idx = -1
  for k,v in ipairs(t) do
    if f(v,k,t) == true then
      idx = k
      break
    end
  end
  return idx
end

function table.from(str,f)
  local newt = {}
  for i=1,#str do
    if f ~= nil then
      newt[i] = f(str:sub(i,i))
    else
      newt[i] = str:sub(i,i)
    end
  end
  return newt
end

function table.includes(t,elt,start)
  for i=start or 1, #t do
    if t[i] == elt then
      return true
    end
  end
  return false
end

function table.indexOf(t,elt,start)
  local idx = -1
  local s = start or 1
  for i=1, #t do
    if t[i] == elt and i >= s then
      idx = i
      break
    end
  end
  return idx
end

function table.join(t,sep)
  local s = sep or ","
  local out = ""
  for k,v in ipairs(t) do
    out = out..v..s
  end
  out = out:sub(1,#out-1)
  return out
end

function table.lastIndexOf(t,elt,start)
  local idx = -1
  local s = start or 0
  for i=0, #t do
    if t[i] == elt and i >= s then
      idx = i
    end
  end
  return idx
end

function table.map(t,f)
  local newt = {}
  for k,v in ipairs(t) do
    newt[k] = f(v,k,t) --value[,index,array]
  end
  return newt
end

function table.reduce(t,f,a)
  local acc = a or t[1]
  for k,v in ipairs(t) do
    if not(acc == t[1] and k == 1) then
      acc = f(acc,v,k,t)
    end
  end
  return acc
end

function table.reduceRight(t,f,a)
  local acc = a or t[#t]
  for i=#t, 1, -1 do
    if not(acc == t[#t] and i == #t) then
      acc = f(acc,t[i],i,t)
    end
  end
  return acc
end

function table.reverse(t)
  local nt = {}
  for i=#t, 1, -1 do
    table.insert(nt,t[i])
  end
  for i=1,#t do
    t[i] = nt[i]
  end
end

function table.shift(t)
  table.remove(t,1)
end

function table.slice(t,start,stop)
    local newt = {}
    local s1 = start or 1
    local s2 = stop or #t
    for i=s1, s2-1 do
      table.insert(newt,t[i])
    end
    return newt
end

function table.some(t,f)
  local b = false
  for k,v in ipairs(t) do
    if f(v,k,t) == true then
      b = true
      break
    end
  end
  return b
end

function table.toString(t)
  local out = ""
  for k,v in ipairs(t) do
    out = out..v..","
  end
  out = out:sub(1,#out-1)
  return out
end

function table.unshift(t,...)
  local elts = {...}
  table.reverse(elts)
  for k,v in ipairs(elts) do
    table.insert(t,1,v)
  end
end
