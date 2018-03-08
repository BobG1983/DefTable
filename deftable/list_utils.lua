local M = {}

function M.index_of(element, list)
  for i, val in ipairs(list) do
    if val == element then
      return i, true
    end
  end
  return nil, false
end

function M.for_each(func, list)
  for index, element in ipairs(list) do
    func(element, index)
  end
end

function M.map(func, list)
  local mapped = {}
  for _, element in ipairs(list) do
    local result = func(element)
    if result ~= nil then
      mapped[#mapped + 1] = result
    end
  end
  return mapped
end

function M.fold_left(func, accumulator, list)
  for index = 1, #list do
    accumulator = func(accumulator, list[index])
  end
  return accumulator
end

function M.fold_right(func, accumulator, list)
  for index = #list, 1, -1 do
    accumulator = func(accumulator, list[index])
  end
  return accumulator
end

function M.filter(predicateicate, list)
  local found = {}
  for _, element in ipairs(list) do
    if predicateicate(element) then
      found[#found + 1] = element
    end
  end
  return found
end

function M.partition(predicateicate, list)
  local hits = {}
  local misses = {}
  for _, element in ipairs(list) do
    if predicateicate(element) then
      hits[#hits + 1] = element
    else
      misses[#misses + 1] = element
    end
  end
  return hits, misses
end

function M.zip(list1, list2)
  local zipped = {}
  local len = #list1
  if #list2 < len then
    len = #list2
  end
  for index = 1, len do
    zipped[index] = {list1[index], list2[index]}
  end
  return zipped
end

function M.stitch(list1, list2)
  local stitched = {}
  local len = #list1
  if #list2 < len then
    len = #list2
  end
  for index = 1, len do
    stitched[list1[index]] = list2[index]
  end
  return stitched
end

function M.all(predicate, list)
  for _, val in ipairs(list) do
    if not predicate(val) then
      return false
    end
  end
  return true
end

function M.any(predicate, list)
  for _, val in ipairs(list) do
    if predicate(val) then
      return true
    end
  end
  return false
end

function M.member(element, list)
  for _, value in ipairs(list) do
    if value == element then
      return true
    end
  end
  return false
end

function M.max(list)
  local maximum = list[1]
  for _, val in ipairs(list) do
    if val > maximum then
      maximum = val
    end
  end
  return maximum
end

function M.min(t)
  local minimum = t[1]
  for _, val in ipairs(t) do
    if val < minimum then
      minimum = val
    end
  end
  return minimum
end

function M.sum(t)
  local total = 0
  for _, val in ipairs(t) do
    total = total + val
  end
  return total
end

function M.product(t)
  local result = 1
  for _, val in ipairs(t) do
    result = result * val
  end
  return result
end

return M
