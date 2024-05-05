local palette = require("darcula.palette").default
local helpers = require("utils.helpers")

local base_highlights = require("highlights.base-highlights")
local plugin_highlights = require("highlights.plugins")

return {
  load = function()
    -- load base highlights

    local scheme = base_highlights.apply(palette, {})
    scheme = plugin_highlights.apply(palette, scheme)

    -- reset colors
    if vim.g.colors_name then vim.cmd.hi("clear") end

    -- okay defaults
    vim.opt.background = "dark"
    vim.o.termguicolors = true
    vim.g.colors_name = "darcula"




    -- add highlights
    for group, settings in pairs(scheme) do
      vim.api.nvim_set_hl(0, group, settings)
    end
  end
}
