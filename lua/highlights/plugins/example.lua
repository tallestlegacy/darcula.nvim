---@diagnostic disable: unused-local

return {
	apply = function(palette, scheme)
		local M = {
			-- add highlights here
		}

		return require("utils.helpers").mergeTables(scheme, M)
	end,
}
