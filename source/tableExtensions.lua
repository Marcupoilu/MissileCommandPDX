  function UUID()
    local fn = function(x)
      local r = math.random(16) - 1
      r = (x == "x") and (r + 1) or (r % 4) + 9
      return ("0123456789abcdef"):sub(r, r)
    end
    return (("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"):gsub("[xy]", fn))
  end

  function table.random( t )
    if type(t)~="table" then return nil end
    return t[math.ceil(math.random(#t))]
end

function table.each( t, fn )
	if type(fn)~="function" then return end
	for _, e in pairs(t) do
		fn(e)
	end
end

function enum( t )
	local result = {}

	for index, name in pairs(t) do
		result[name] = index
	end

	return result
end

function table.find(table, element)
    for key, value in pairs(table) do
      if element == value then
        return element
      end
    end
end

function table.count(table)
  count = 0
  for i,a in pairs(table) do
      count += 1
  end
  return count
end

function table.contains(table, element)
  -- print("ELEMENT RAND "..printTable(element))
  for key, value in pairs(table) do
    if element == value then
      return true
    end
  end
    return false
end

function table.findByParam(table, param, paramValue)
  for key, value in pairs(table) do
    if value[param] == paramValue then
      return value
    end
  end
end
