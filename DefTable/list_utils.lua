local M = M or {}

function M.index_of (elem, list)
	for i, val in ipairs(list) do
		if val == elem then return i, true end
	end
	return nil, false
end

function M.for_each (func, list)
	for _, val in ipairs(list) do
		func(val)
	end
end

function M.for_each_with_index (func, list)
	for idx, val in ipairs(list) do
		func(val, idx)
	end
end

function M.map(func, list)
	local mapped = {}
	for _, val in ipairs(list) do
		local res = func(val)
		if res ~= nil then
			mapped[#mapped + 1] = res
		end
	end
	return mapped
end

function M.fold_left(func, accumulator, list)
	for idx=1, #list do
		accumulator = func(accumulator, list[idx])
	end
	return accumulator
end

function M.fold_right(func, accumulator, list)
	for idx=#list, 1, -1 do
		accumulator = func(accumulator, list[idx])
	end
	return accumulator
end

function M.filter(pred, list)
	local found = {}
	for _, val in ipairs(list) do
		if pred(val) then
			found[#found + 1] = val
		end
	end
	return found
end

function M.partition(pred, list)
	local hits = {}
	local misses = {}
	for _, val in ipairs(list) do
		if pred(val) then
			hits[#hits + 1] = val
		else
			misses[#misses + 1] = val
		end
	end
	return hits, misses
end

function M.zip(l1, l2)
	local zipped = {}
	local len = #l1
	if #l2 < len then len = #l2 end
	for idx = 1, len do
		zipped[idx] = { l1[idx], l2[idx] }
	end
	return zipped
end

function M.stitch(l1, l2)
	local stitched = {}
	local len = #l1
	if #l2 < len then len = #l2 end
	for idx = 1, len do
		stitched[l1[idx]] = l2[idx]
	end
	return stitched
end

function M.all(pred, list)
	for _, val in ipairs(list) do
		if not pred(val) then
			return false
		end
	end
	return true
end

function M.any(pred, list)
	for _, val in ipairs(list) do
		if pred(val) then
			return true
		end
	end
	return false
end

function M.member(elem, list)
	for _, val in ipairs(list) do
		if val == elem then
			return true
		end
	end
	return false
end

function M.max(t)
	local maximum = t[1]
	for _, val in ipairs(t) do
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