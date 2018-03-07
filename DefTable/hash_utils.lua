local M = M or {}

function M.key_of(val, hash)
	for k, v in pairs(hash) do
		if v == val then
			return k, true
		end
	end
	return nil, false
end

function M.index_of(val, hash)
	for i, v in ipairs(hash) do
		if v == val then
			return i, true
		end
	end
	return nil, false
end

function M.for_each(func, hash)
	for key, val in pairs(hash) do
		func(key, val)
	end
end

function M.map(func, hash)
	local mapped = {}
	for key, val in pairs(hash) do
		func(key, val, mapped)
	end
	return mapped
end

function M.reduce(func, accumulator, hash)
	for key, val in pairs(hash) do
		accumulator = func(accumulator, key, val)
	end
	return accumulator
end

function M.filter(pred, hash)
	local found = {}
	for key, val in pairs(hash) do
		if pred(key, val) then
			found[key] = val
		end
	end
	return found
end

function M.partition(pred, hash)
	local hits = {}
	local misses = {}
	for key, val in pairs(hash) do
		if pred(key, val) then
			hits[key] = val
		else
			misses[key] = val
		end
	end
	return hits, misses
end

function M.all(pred, hash)
	for key, val in pairs(hash) do
		if not pred(key, val) then
			return false
		end
	end
	return true
end

function M.any(fun, hash)
	for key, val in pairs(hash) do
		if fun(key) or fun(val) then
			return true
		end
	end
	return false
end

function M.is_key(wanted, hash)
	for key, _ in pairs(hash) do
		if key == wanted then
			return true
		end
	end
	return false
end

function M.is_value(wanted, hash)
	for _, val in pairs(hash) do
		if val == wanted then
			return true
		end
	end
	return false
end

function M.keys(hash)
	local ks = {}
	for k, _ in pairs(hash) do
		ks[#ks + 1] = k
	end
	return ks
end

function M.values(hash)
	local vs = {}
	for _, v in pairs(hash) do
		vs[#vs + 1] = v
	end
	return vs
end

return M