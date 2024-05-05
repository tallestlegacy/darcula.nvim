local helpers = require("utils.helpers")


return {
  -- @param palette any
  -- @param scheme any
  apply = function(palette, scheme)
    local M = {

      -- ╭─────────────────────────────────────────────────────────╮
      -- │                        Builtin                          │
      -- ╰─────────────────────────────────────────────────────────╯

      -- layers
      Normal = { fg = palette.fg, bg = palette.bg },                   -- background color
      NormalFloat = { fg = palette.fg, bg = palette.layers.light[2] }, -- modal UI
      FloatBorder = { fg = palette.layers.light[3] },                  -- Border of floating windows.
      FloatTitle = { link = "FloatBorder" },                           -- Title of floating windows.
      NormalNC = { fg = palette.fg },
      EndOfBuffer = { fg = palette.bg },

      Visual = { bg = palette.editor.selection },
      VisualNOS = { link = "Visual" },

      -- cursors
      Cursor = { fg = palette.bg, bg = palette.fg },
      CursorLine = { bg = palette.overbg },
      CursorColumn = { link = "CursorLine" },
      Conceal = { fg = palette.colors.grey },
      TermCursor = { link = "Cursor" },
      MatchParen = { bg = palette.layers.light[3] },
      Whitespace = { fg = palette.overbg }, -- also used by indent-blank-line

      -- gutter
      LineNr = { fg = palette.layers.light[4], bg = palette.bg },
      LineNrAbove = { fg = palette.layers.light[5] },
      LineNrBelow = { link = "LineNrAbove" },
      CursorLineNr = { fg = palette.fg, bold = true },
      SignColumn = { link = "LineNr" },
      VertSplit = { fg = palette.fg, bg = palette.bg }, -- column separating vertically split windows
      Folded = { fg = palette.text.comment, bg = palette.overbg },
      FoldColumn = { link = "LineNr" },

      -- highlight
      Search = { fg = palette.colors.white, bg = palette.colors.blue },
      IncSearch = { link = "Search" },
      Substitute = { link = "Search" },

      -- diffs
      DiffAdd = ({ bg = palette.git.add.bg }),
      DiffAdded = { link = "DiffAdd" },
      DiffTextAdded = { link = "DiffAdd" },
      DiffChange = { bg = palette.git.change.bg },
      DiffText = { bg = palette.git.diff.text },
      DiffTextChange = { link = "DiffChange" },
      DiffDelete = { fg = palette.git.delete.fg, bg = palette.git.delete.bg },
      DiffTextDeleted = { link = "DiffDelete" },
      DiffRemoved = { link = "DiffDelete" },

      -- spell
      SpellBad = { undercurl = true },

      -- statusline
      StatusLine = { fg = palette.ui.statusline.bg, bg = palette.ui.statusline.bg }, -- invisible white space
      StatusLineNC = { bg = palette.ui.statusline.bg },

      -- tabs
      TabLine = { fg = palette.ui.tabline.fg, bg = palette.ui.tabline.bg },
      TabLineFill = { bg = palette.ui.tabline.bg },
      TabLineSel = { fg = palette.ui.tabline.active.fg, bg = palette.ui.tabline.active.bg },

      -- pop-up menus
      Pmenu = { fg = palette.ui.menu.fg, bg = palette.ui.menu.bg },
      PmenuSel = { fg = palette.ui.menu.sel.fg, bg = palette.ui.menu.sel.bg },
      PmenuSbar = { link = "Pmenu" },
      PmenuThumb = { link = "PmenuSel" },
      WildMenu = { link = "Pmenu" },
      QuickFixLine = { fg = palette.layers.light[3] },

      -- -- others
      Directory = { fg = palette.ui.directory },
      Title = { fg = palette.colors.yellow },

      -- syntax highlighting

      Comment = { fg = palette.text.comment, italic = true },

      Constant = { fg = palette.colors.lightblue },
      Number = { link = "Constant" },
      Float = { link = "Number" },
      Boolean = { link = "Constant" },
      Character = { fg = palette.colors.white },
      String = { fg = palette.colors.darkgreen },

      Identifier = { fg = palette.colors.white },
      Function = { fg = palette.colors.yellow },

      Statement = { fg = palette.colors.orange }, -- (preferred) any statement
      Label = { fg = palette.colors.purple },     -- case, default, etc.
      Keyword = { link = "Statement" },           -- any other keyword
      Conditional = { link = "Statement" },
      Repeat = { link = "Statement" },
      Operator = { fg = palette.colors.white },
      Exception = { fg = palette.text.error },       -- error handlers

      PreProc = { fg = palette.colors.purple },      --  generic Preprocessor
      Include = { link = "PreProc" },                -- preprocessor #include
      Define = { link = "PreProc" },                 -- preprocessor #define
      Macro = { fg = palette.colors.green },         -- same as Define
      PreCondit = { link = "PreProc" },              -- preprocessor #if, #else, #endif, etc.

      Type = { fg = palette.colors.yellow },         -- types
      Typedef = { link = "Type" },
      StorageClass = { fg = palette.colors.purple }, -- static, register, volatile, etc.
      Structure = { fg = palette.colors.white },     -- struct, union, enum, etc.

      Special = { fg = palette.colors.orange },      -- (preferred) any special symbol
      SpecialChar = { link = "Special" },            -- special character in a constant
      Tag = { fg = palette.colors.orange },          -- you can use CTRL-] on this
      Delimiter = { fg = palette.colors.white },     -- character that needs attention
      SpecialComment = { link = "Special" },         -- special things inside a comment
      Debug = { link = "Special" },                  -- debugging statements

      Underlined = { underline = true },
      Bold = { bold = true },
      Italic = { italic = true },
      Ignore = { fg = palette.text.comment },         --  left blank, hidden  |hl-Ignore|
      Error = { fg = palette.text.error },            --  any erroneous construct
      Todo = { fg = palette.text.todo, bold = true }, --  anything that needs extra attention

      -- diagnostics
      DiagnosticError = { fg = palette.text.error },
      DiagnosticWarn = { fg = palette.text.warn },
      DiagnosticInfo = { fg = palette.text.info },
      DiagnosticHint = { fg = palette.text.info },
      DiagnosticOk = { fg = palette.colors.green },
      DiagnosticVirtualTextError = { link = "DiagnosticError" },
      DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
      DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
      DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
      DiagnosticVirtualTextOk = { link = "DiagnosticOk" },
      DiagnosticUnderlineError = { undercurl = true, sp = palette.text.error },
      DiagnosticUnderlineWarn = { undercurl = true, sp = palette.text.warn },
      DiagnosticUnderlineInfo = { undercurl = true, sp = palette.text.info },
      DiagnosticUnderlineHint = { undercurl = true, sp = palette.text.info },
      DiagnosticUnderlineOk = { undercurl = true, sp = palette.text.green },
      DiagnosticFloatingError = { link = "DiagnosticError" },
      DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
      DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
      DiagnosticFloatingHint = { link = "DiagnosticHint" },
      DiagnosticFloatingOk = { link = "DiagnosticOk" },
      DiagnosticSignError = { link = "DiagnosticError" },
      DiagnosticSignWarn = { link = "DiagnosticWarn" },
      DiagnosticSignInfo = { link = "DiagnosticInfo" },
      DiagnosticSignHint = { link = "DiagnosticHint" },
      DiagnosticSignOk = { link = "DiagnosticOk" },
      DiagnosticUnnecessary = { link = "Comment", underdashed = true },
      DiagnosticDeprecated = { strikethrough = true },
    }

    return helpers.mergeTables(scheme, M)
  end

}
