local palette = require("darcula.palette").default


return {
  load = function()
    -- load base highlights

    local scheme = require("highlights.base-highlights").apply(palette, {})
    scheme = require("highlights.plugins").apply(palette, scheme)
    scheme = require("highlights.treesitter").apply(palette, scheme)

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
