-- ╭─────────────────────────────────────────────────────────╮
-- │                     treesitter                          │
-- ╰─────────────────────────────────────────────────────────╯

local helpers = require("utils.helpers")

local M = {}

-- @param palette any
-- @param scheme any
function M.apply(palette, scheme)
  local M_scheme = {
    ["@constant"] = { link = "Constant" },                                          -- constant values
    ["@constant.builtin"] = { link = "Constant", italic = true },                   -- constant that are built in the language: `nil` in Lua.
    ["@constant.macro"] = { link = "Constant", bold = true },
    ["@constant.numeric"] = { fg = palette.colors.lightblue },                      -- numeric

    ["@number"] = { link = "Number" },                                              -- number
    ["@float"] = { link = "Float" },                                                -- float
    ["@boolean"] = { link = "Boolean" },                                            -- boolean
    ["@character"] = { link = "Character" },                                        -- character
    ["@string"] = { link = "String" },                                              -- string
    ["@string.regex"] = { link = "Character" },                                     -- regex
    ["@string.escape"] = { link = "Character" },                                    -- escape characters within a string
    ["@symbol"] = { fg = palette.colors.purple, italic = true },                    -- For identifiers referring to symbols or atoms.

    ["@field"] = { fg = palette.colors.purple },                                    -- also a key
    ["@property"] = { fg = palette.colors.yellow },                                 -- the key in key/value pairs
    ["@parameter"] = { fg = palette.colors.yellow },
    ["@parameter.reference"] = { fg = palette.colors.lightblue },                   --

    ["@variable"] = { fg = palette.colors.white },                                  -- Any variable name that does not have another highlight
    ["@variable.builtin"] = { fg = palette.colors.purple, italic = true },          -- Variable names that are defined by the languages like `this` or `self`.
    ["@variable.member"] = { link = "Constant" },
    ["@variable.parameter.builtin"] = { link = "Constant" },                        -- special parameters (e.g. _, it)

    ["@function"] = { link = "Function" },                                          -- function definitions
    ["@function.call"] = { link = "Function" },
    ["@function.builtin"] = { link = "Function", italic = true },                   -- built-in functions
    ["@function.constructor"] = { fg = palette.colors.yellow },                     -- For constructor: `{}` in Lua and Java constructors.
    ["@function.macro"] = { link = "Function" },                                    -- macro defined functions: each `macro_rules` in Rust
    ["@function.method"] = { link = "Function" },                                   --

    ["@keyword"] = { link = "Keyword" },                                            -- keywords not fitting into specific categories
    ["@keyword.conditional"] = { link = "Conditional" },                            -- keywords related to conditionals (e.g. if, else)
    ["@keyword.function"] = { link = "Keyword" },                                   --
    ["@keyword.repeat"] = { link = "Repeat" },                                      --

    ["@module"] = { fg = palette.colors.purple, italic = true },                    -- modules or namespaces
    ["@module.builtin"] = { fg = palette.colors.purple },                           -- built-in modules or namespaces
    ["@label"] = { link = "Label" },                                                -- GOTO and other labels (e.g. label: in C), including heredoc labels

    ["@operator"] = { link = "Operator" },                                          -- +, - etc
    ["@exception"] = { link = "Exception" },                                        -- keywords related to exceptions (e.g. throw, catch)
    --
    ["@annotation"] = { link = "PreProc" },                                         -- C++/Dart attributes annotations that can be attached to the code to denote some kind of meta information
    ["@attribute"] = { link = "PreProc" },                                          -- Unstable
    ["@include"] = { link = "PreProc" },                                            -- includes: `#include` in C `use` or `extern crate` in Rust or `require` in Lua.

    ["@type"] = { link = "Type" },                                                  -- type or class definitions and annotations
    ["@type.builtin"] = { fg = palette.colors.orange, italic = true },              -- built-in types

    ["@comment"] = { link = "Comment" },                                            -- line and block comments
    ["@comment.documentation"] = { link = "Comment" },                              -- comments documenting code
    ["@comment.error"] = { fg = palette.text.error },                               -- error-type comments (e.g. ERROR, FIXME, DEPRECATED)
    ["@comment.warning"] = { fg = palette.text.warn },                              -- warning-type comments (e.g. WARNING, FIX, HACK)
    ["@comment.todo"] = { fg = palette.text.todo },                                 -- todo-type comments (e.g. TODO, WIP)
    ["@comment.note"] = { fg = palette.colors.lightblue },                          -- note-type comments (e.g. NOTE, INFO, XXX)

    ["@punctuation.bracket"] = { link = "Delimiter" },                              -- brackets and parens.
    ["@punctuation.delimiter"] = { link = "Delimiter" },                            -- delimiters ie: `.`
    ["@punctuation.special"] = { link = "Delimiter" },                              -- special punctuation that does not fall in the categories before.

    ["@tag"] = { link = "Tag" },                                                    -- XML-style tag names (e.g. in XML, HTML, etc.)
    ["@tag.attribute"] = { fg = palette.colors.yellow },                            -- XML-style tag attribute
    ["@tag.builtin"] = { link = "Tag" },                                            -- XML-style tag names (e.g. HTML5 tags)
    ["@tag.delimiter"] = { link = "Delimiter" },                                    -- XML-style tag delimeters

    ["@text"] = { fg = palette.colors.white },                                      -- unspecific text
    ["@text.emphasis"] = { fg = palette.colors.white, italic = true },
    ["@text.literal"] = { link = "String" },                                        -- Literal text
    ["@text.strike"] = { link = "Comment", strikethrough = true },                  -- strikethrough
    ["@text.strong"] = { fg = palette.colors.white, bold = true },
    ["@text.title"] = { fg = palette.colors.orange, bold = true },                  -- Text that is part of a title
    ["@text.underline"] = { fg = palette.colors.white, underline = true },
    ["@text.uri"] = { fg = palette.colors.white, italic = true, underline = true }, -- Any URI like a link or email

    ["@diff.plus"] = { link = "DiffAdd" },                                          -- added text (for diff files)
    ["@diff.minus"] = { link = "DiffDelete" },                                      -- deleted text (for diff files)
    ["@diff.delta"] = { link = "DiffChange" },                                      -- changed text (for diff files)

    ["@markup.heading"] = { bold = true, underline = true },                        -- headings, titles (including markers)
    ["@markup.heading.1"] = { link = "@markup.heading" },                           -- top-level heading
    ["@markup.heading.2"] = { link = "@markup.heading" },                           -- section heading
    ["@markup.heading.3"] = { link = "@markup.heading" },                           -- subsection heading
    ["@markup.heading.4"] = { link = "@markup.heading" },                           -- and so on
    ["@markup.heading.5"] = { link = "@markup.heading" },                           -- and so forth
    ["@markup.heading.6"] = { link = "@markup.heading" },                           -- six levels ought to be enough for anybody

    ["@markup.quote"] = {},                                                         -- block quotes
    ["@markup.math"] = {},                                                          -- math environments (e.g. $ ... $ in LaTeX)

    ["@markup.link"] = {},                                                          -- text references, footnotes, citations, etc.
    ["@markup.link.label"] = {},                                                    -- link, reference descriptions
    ["@markup.link.url"] = {},                                                      -- URL-style links
    ["@markup.raw"] = {},                                                           -- literal or verbatim text (e.g. inline code)
    ["@markup.raw.block"] = {},                                                     -- literal or verbatim text as a stand-alone block
    ["@markup.list"] = {},                                                          -- list markers
    ["@markup.list.checked"] = {},                                                  -- checked todo-style list markers
    ["@markup.list.unchecked"] = {},                                                -- unchecked todo-style list markers

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                           LSP                           │
    -- ╰─────────────────────────────────────────────────────────╯

    ["@lsp.type.property"] = { fg = palette.colors.yellow },

    ["@lsp.mod.library.rust"] = { fg = palette.colors.purple },
    ["@lsp.typemod.namespace.library"] = { italic = true },
    ["@lsp.typemod.struct.library"] = { fg = palette.colors.white },
    ["@lsp.typemod.interface.library"] = { link = "@lsp.typemod.struct.library" },
    ["@lsp.typemod.method.consuming"] = { link = "Function" },
  }


  return helpers.mergeTables(scheme, M_scheme)
end

return M
