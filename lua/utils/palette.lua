local lush = require("lush")
local hsl = lush.hsl

local function getPallette()
	local M = {}

	M.colors = {
		black = hsl(0, 0, 0),
		white = hsl(0, 0, 80),
		grey = hsl(0, 0, 50),

		blue = hsl(210, 78, 33),
		lightblue = hsl(210, 63, 63),

		darkgreen = hsl(115, 50, 43),
		green = hsl(140, 100, 50),

		darkred = hsl(15, 74, 40),
		red = hsl(0, 100, 50),

		orange = hsl(15, 78, 52),
		purple = hsl(270, 23, 63),
		yellow = hsl(50, 83, 73),
	}

	--
	-- Base colors
	--
	M.base = hsl(0, 0, 16)

	--
	-- layers
	--
	M.layers = {
		dark = {
			M.base.da(10),
			M.base.da(20),
			M.base.da(30),
		},
		light = {
			M.base.da(-5),
			M.base.da(-10),
			M.base.da(-15),
			M.base.da(-20),
		},
	}

	--
	-- Base palette
	--
	M.fg = hsl(210, 7, 82)
	M.bg = M.base
	M.overbg = M.layers.light[1]

	--
	-- UI
	--
	M.ui = {
		border = M.layers.light[4],
		statusbar = {
			bg = M.layers.dark[1],
			fg = M.layers.light[2],
		},
		sidebar = {
			bg = M.layers.dark[3],
			fg = M.layers.light[3],
		},
	}

	--
	-- Editor
	--
	M.editor = {
		selection = hsl(200, 38, 18),
	}

	--
	-- Syntax/Semantic highlights
	--
	M.text = {
		comment = M.grey,

		-- diagnostics etc.
		error = M.colors.red,
		warn = M.colors.orange,
		info = M.layers.light[3],
	}

	--
	-- Git
	--
	M.git = {
		change = {
			fg = "",
			bg = "",
		},
	}

	return M
end

return {
	getPallette = getPallette,
	default = getPallette(),
}
