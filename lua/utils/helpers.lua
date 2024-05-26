local helpers = {}

helpers.tableLength = function(t)
	local count = 0
	for _ in pairs(t) do
		count = count + 1
	end
	return count
end

helpers.mergeTables = function(table1, table2)
	local M = {}

	for k, v in pairs(table1) do
		M[k] = v
	end
	for k, v in pairs(table2) do
		M[k] = v
	end

	helpers.tableLength(M)
	return M
end

helpers.concatTables = function(table1, table2)
	local M = {}

	for _, v in pairs(table1) do
		table.insert(M, v)
	end
	for _, v in pairs(table2) do
		table.insert(M, v)
	end

	return M
end

helpers.cloneTable = function(table1)
	local M = {}
	for k, v in pairs(table1) do
		M[k] = v
	end
	return M
end

return helpers
