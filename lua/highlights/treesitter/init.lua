-- ╭─────────────────────────────────────────────────────────╮
-- │                     treesitter                          │
-- ╰─────────────────────────────────────────────────────────╯

local helpers = require("utils.helpers")

local M = {}

-- @param palette any
-- @param scheme any
local function M.apply(palette, scheme)
  local bold, italic, underline, undercurl, underdashed, strikethrough =
      "bold", "italic", "underline", "undercurl", "underdashed", "strikethrough"

  local M_scheme = {
    ["@constant"] = { Constant },                                            -- constant values
    ["@constant.builtin"] = { Constant, gui = italic },                      -- constant that are built in the language: `nil` in Lua.
    ["@constant.macro"] = { Constant, gui = bold },
    ["@constant.numeric"] = { fg = palette.colors.lightblue },               -- numeric

    ["@number"] = { Number },                                                -- number
    ["@float"] = { Float },                                                  -- float
    ["@boolean"] = { Boolean },                                              -- boolean
    ["@character"] = { Character },                                          -- character
    ["@string"] = { String },                                                -- string
    ["@string.regex"] = { Character },                                       -- regex
    ["@string.escape"] = { Character },                                      -- escape characters within a string
    ["@symbol"] = { fg = palette.colors.purple, gui = italic },              -- For identifiers referring to symbols or atoms.

    ["@field"] = { fg = palette.colors.purple },                             -- also a key
    ["@property"] = { fg = palette.colors.yellow },                          -- the key in key/value pairs
    ["@parameter"] = { fg = palette.colors.yellow },
    ["@parameter.reference"] = { fg = palette.colors.lightblue },            --

    ["@variable"] = { fg = palette.colors.white },                           -- Any variable name that does not have another highlight
    ["@variable.builtin"] = { fg = palette.colors.purple, gui = italic },    -- Variable names that are defined by the languages like `this` or `self`.
    ["@variable.member"] = { Constant },
    ["@variable.parameter.builtin"] = { Constant },                          -- special parameters (e.g. _, it)

    ["@function"] = { Function },                                            -- function definitions
    ["@function.call"] = { Function },
    ["@function.builtin"] = { Function, gui = italic },                      -- built-in functions
    ["@function.constructor"] = { fg = palette.colors.yellow },              -- For constructor: `{}` in Lua and Java constructors.
    ["@function.macro"] = { Function },                                      -- macro defined functions: each `macro_rules` in Rust
    ["@function.method"] = { Function },                                     --

    ["@keyword"] = { Keyword },                                              -- keywords not fitting into specific categories
    ["@keyword.conditional"] = { Conditional },                              -- keywords related to conditionals (e.g. if, else)
    ["@keyword.function"] = { Keyword },                                     --
    ["@keyword.repeat"] = { Repeat },                                        --

    ["@module"] = { fg = palette.colors.purple, gui = italic },              -- modules or namespaces
    ["@module.builtin"] = { fg = palette.colors.purple },                    -- built-in modules or namespaces
    ["@label"] = { Label },                                                  -- GOTO and other labels (e.g. label: in C), including heredoc labels

    ["@operator"] = { Operator },                                            -- +, - etc
    ["@exception"] = { Exception },                                          -- keywords related to exceptions (e.g. throw, catch)
    --
    ["@annotation"] = { PreProc },                                           -- C++/Dart attributes annotations that can be attached to the code to denote some kind of meta information
    ["@attribute"] = { PreProc },                                            -- Unstable
    ["@include"] = { PreProc },                                              -- includes: `#include` in C `use` or `extern crate` in Rust or `require` in Lua.

    ["@type"] = { Type },                                                    -- type or class definitions and annotations
    ["@type.builtin"] = { fg = palette.colors.orange, gui = italic },        -- built-in types

    ["@comment"] = { Comment },                                              -- line and block comments
    ["@comment.documentation"] = { Comment },                                -- comments documenting code
    ["@comment.error"] = { fg = palette.text.error },                        -- error-type comments (e.g. ERROR, FIXME, DEPRECATED)
    ["@comment.warning"] = { fg = palette.text.warn },                       -- warning-type comments (e.g. WARNING, FIX, HACK)
    ["@comment.todo"] = { fg = palette.text.todo },                          -- todo-type comments (e.g. TODO, WIP)
    ["@comment.note"] = { fg = palette.colors.lightblue },                   -- note-type comments (e.g. NOTE, INFO, XXX)

    ["@punctuation.bracket"] = { Delimiter },                                -- brackets and parens.
    ["@punctuation.delimiter"] = { Delimiter },                              -- delimiters ie: `.`
    ["@punctuation.special"] = { Delimiter },                                -- special punctuation that does not fall in the categories before.

    ["@tag"] = { Tag },                                                      -- XML-style tag names (e.g. in XML, HTML, etc.)
    ["@tag.attribute"] = { fg = palette.colors.yellow },                     -- XML-style tag attribute
    ["@tag.builtin"] = { Tag },                                              -- XML-style tag names (e.g. HTML5 tags)
    ["@tag.delimiter"] = { Delimiter },                                      -- XML-style tag delimeters

    ["@text"] = { fg = palette.colors.white },                               -- unspecific text
    ["@text.emphasis"] = { fg = palette.colors.white, gui = italic },
    ["@text.literal"] = { String },                                          -- Literal text
    ["@text.strike"] = { Comment, gui = strikethrough },                     -- strikethrough
    ["@text.strong"] = { fg = palette.colors.white, gui = bold },
    ["@text.title"] = { fg = palette.colors.orange, gui = bold },            -- Text that is part of a title
    ["@text.underline"] = { fg = palette.colors.white, gui = underline },
    ["@text.uri"] = { fg = palette.colors.white, gui = "italic,underline" }, -- Any URI like a link or email

    ["@diff.plus"] = { DiffAdd },                                            -- added text (for diff files)
    ["@diff.minus"] = { DiffDelete },                                        -- deleted text (for diff files)
    ["@diff.delta"] = { DiffChange },                                        -- changed text (for diff files)

    ["@markup.heading"] = { gui = "bold,underline" },                        -- headings, titles (including markers)
    ["@markup.heading.1"] = { link = "@markup.heading" },                    -- top-level heading
    ["@markup.heading.2"] = { link = "@markup.heading" },                    -- section heading
    ["@markup.heading.3"] = { link = "@markup.heading" },                    -- subsection heading
    ["@markup.heading.4"] = { link = "@markup.heading" },                    -- and so on
    ["@markup.heading.5"] = { link = "@markup.heading" },                    -- and so forth
    ["@markup.heading.6"] = { link = "@markup.heading" },                    -- six levels ought to be enough for anybody

    ["@markup.quote"] = {},                                                  -- block quotes
    ["@markup.math"] = {},                                                   -- math environments (e.g. $ ... $ in LaTeX)

    ["@markup.link"] = {},                                                   -- text references, footnotes, citations, etc.
    ["@markup.link.label"] = {},                                             -- link, reference descriptions
    ["@markup.link.url"] = {},                                               -- URL-style links
    ["@markup.raw"] = {},                                                    -- literal or verbatim text (e.g. inline code)
    ["@markup.raw.block"] = {},                                              -- literal or verbatim text as a stand-alone block
    ["@markup.list"] = {},                                                   -- list markers
    ["@markup.list.checked"] = {},                                           -- checked todo-style list markers
    ["@markup.list.unchecked"] = {},                                         -- unchecked todo-style list markers

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                           LSP                           │
    -- ╰─────────────────────────────────────────────────────────╯

    ["@lsp.type.property"] = { fg = palette.colors.yellow },

    ["@lsp.mod.library.rust"] = { fg = palette.colors.purple },
    ["@lsp.typemod.namespace.library"] = { gui = italic },
    ["@lsp.typemod.struct.library"] = { fg = palette.colors.white },
    ["@lsp.typemod.interface.library"] = { link = "@lsp.typemod.struct.library" },
    ["@lsp.typemod.method.consuming"] = { Function },
  }


  return helpers.mergeTables(scheme, M_scheme)
end


return M
