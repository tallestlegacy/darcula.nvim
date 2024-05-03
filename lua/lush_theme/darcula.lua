-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8

local lush = require("lush")

local bold, italic, underline, undercurl, underdashed, strikethrough =
    "bold", "italic", "underline", "undercurl", "underdashed", "strikethrough"

local C = require("utils.palette").default

local theme = lush(function(injected_functions)
  local sym = injected_functions.sym

  local scheme = {

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                        Builtin                          │
    -- ╰─────────────────────────────────────────────────────────╯

    -- layers
    Normal { fg = C.fg, bg = C.bg },                   -- background color
    NormalFloat { fg = C.fg, bg = C.layers.light[2] }, -- modal UI
    FloatBorder { fg = C.layers.light[3] },            -- Border of floating windows.
    FloatTitle { FloatBorder },                        -- Title of floating windows.
    NormalNC { fg = C.fg },
    EndOfBuffer { fg = C.bg },

    Visual { bg = C.editor.selection },
    VisualNOS { Visual },

    -- cursors
    Cursor { fg = C.bg, bg = C.fg },
    CursorLine { bg = C.overbg },
    CursorColumn { CursorLine },
    Conceal { fg = C.colors.grey },
    TermCursor { Cursor },
    MatchParen { bg = C.layers.light[3] },
    Whitespace { fg = C.overbg }, -- also used by indent-blank-line

    -- gutter
    LineNr { fg = C.layers.light[4], bg = C.bg },
    LineNrAbove { fg = C.layers.light[5] },
    LineNrBelow { LineNrAbove },
    CursorLineNr { fg = C.fg, gui = bold },
    SignColumn { LineNr },
    VertSplit { fg = C.bg.da(-25), bg = C.bg }, -- column separating vertically split windows
    Folded { fg = C.text.comment, bg = C.overbg },
    FoldColumn { LineNr },

    -- highlight
    Search { fg = C.colors.white, bg = C.colors.blue },
    IncSearch { Search },
    Substitute { Search },

    -- diffs
    DiffAdd({ bg = C.git.add.bg }),
    DiffAdded { DiffAdd },
    DiffTextAdded { DiffAdd },
    DiffChange { bg = C.git.change.bg },
    DiffText { bg = C.git.diff.text },
    DiffTextChange { DiffChange },
    DiffDelete { fg = C.git.delete.fg, bg = C.git.delete.bg },
    DiffTextDeleted { DiffDelete },
    DiffRemoved { DiffDelete },
    -- spell
    SpellBad { gui = undercurl },

    -- statusline
    StatusLine { fg = C.ui.statusline.bg, bg = C.ui.statusline.bg }, -- invisible white space
    StatusLineNC { bg = C.ui.statusline.bg },

    -- tabs
    TabLine { fg = C.ui.tabline.fg, bg = C.ui.tabline.bg },
    TabLineFill { bg = C.ui.tabline.bg },
    TabLineSel { fg = C.ui.tabline.active.fg, bg = C.ui.tabline.active.bg },

    -- pop-up menus
    Pmenu { fg = C.ui.menu.fg, bg = C.ui.menu.bg },
    PmenuSel { fg = C.ui.menu.sel.fg, bg = C.ui.menu.sel.bg },
    PmenuSbar { Pmenu },
    PmenuThumb { PmenuSel },
    WildMenu { Pmenu },
    QuickFixLine { fg = C.layers.light[3] },

    -- others
    Directory { fg = C.ui.directory },
    Title { fg = C.colors.yellow },

    -- syntax highlighting

    Comment { fg = C.text.comment, gui = italic },

    Constant { fg = C.colors.lightblue },
    Number { Constant },
    Float { Number },
    Boolean { Constant },
    Character { fg = C.colors.white },
    String { fg = C.colors.darkgreen },

    Identifier { fg = C.colors.white },
    Function { fg = C.colors.yellow },

    Statement { fg = C.colors.orange }, -- (preferred) any statement
    Label { fg = C.colors.purple },     -- case, default, etc.
    Keyword { Statement },              -- any other keyword
    Conditional { Statement },
    Repeat { Statement },
    Operator { fg = C.colors.white },
    Exception { fg = C.text.error },

    PreProc { fg = C.colors.purple }, --  generic Preprocessor
    Include { PreProc },              -- preprocessor #include
    Define { PreProc },               -- preprocessor #define
    Macro { fg = C.colors.green },    -- same as Define
    PreCondit { PreProc },            -- preprocessor #if, #else, #endif, etc.

    Type { fg = C.colors.yellow },
    Typedef { Type },
    StorageClass { fg = C.colors.purple }, -- static, register, volatile, etc.
    Structure { fg = C.colors.white },     -- struct, union, enum, etc.

    Special { fg = C.colors.orange },      -- (preferred) any special symbol
    SpecialChar { Special },               -- special character in a constant
    Tag { fg = C.colors.orange },          -- you can use CTRL-] on this
    Delimiter { fg = C.colors.white },     -- character that needs attention
    SpecialComment { Special },            -- special things inside a comment
    Debug { Special },                     -- debugging statements

    Underlined { gui = underline },
    Bold { gui = bold },
    Italic { gui = italic },
    Ignore { fg = C.text.comment },        --  left blank, hidden  |hl-Ignore|
    Error { fg = C.text.error },           --  any erroneous construct
    Todo { fg = C.text.todo, gui = bold }, --  anything that needs extra attention

    -- diagnostics
    DiagnosticError { fg = C.text.error },
    DiagnosticWarn { fg = C.text.warn },
    DiagnosticInfo { fg = C.text.info },
    DiagnosticHint { fg = C.text.info },
    DiagnosticOk { fg = C.colors.green },
    DiagnosticVirtualTextError { DiagnosticError },
    DiagnosticVirtualTextWarn { DiagnosticWarn },
    DiagnosticVirtualTextInfo { DiagnosticInfo },
    DiagnosticVirtualTextHint { DiagnosticHint },
    DiagnosticVirtualTextOk { DiagnosticOk },
    DiagnosticUnderlineError { gui = undercurl, sp = C.text.error },
    DiagnosticUnderlineWarn { gui = undercurl, sp = C.text.warn },
    DiagnosticUnderlineInfo { gui = undercurl, sp = C.text.info },
    DiagnosticUnderlineHint { gui = undercurl, sp = C.text.info },
    DiagnosticUnderlineOk { gui = undercurl, sp = C.text.green },
    DiagnosticFloatingError { DiagnosticError },
    DiagnosticFloatingWarn { DiagnosticWarn },
    DiagnosticFloatingInfo { DiagnosticInfo },
    DiagnosticFloatingHint { DiagnosticHint },
    DiagnosticFloatingOk { DiagnosticOk },
    DiagnosticSignError { DiagnosticError },
    DiagnosticSignWarn { DiagnosticWarn },
    DiagnosticSignInfo { DiagnosticInfo },
    DiagnosticSignHint { DiagnosticHint },
    DiagnosticSignOk { DiagnosticOk },
    DiagnosticUnnecessary { Comment, gui = underdashed },
    DiagnosticDeprecated { gui = strikethrough },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                     treesitter                          │
    -- ╰─────────────────────────────────────────────────────────╯

    sym "@constant" { Constant },                                      -- constant values
    sym "@constant.builtin" { Constant, gui = italic },                -- constant that are built in the language: `nil` in Lua.
    sym "@constant.macro" { Constant, gui = bold },
    sym "@constant.numeric" { fg = C.colors.lightblue },               -- numeric

    sym "@number" { Number },                                          -- number
    sym "@float" { Float },                                            -- float
    sym "@boolean" { Boolean },                                        -- boolean
    sym "@character" { Character },                                    -- character
    sym "@string" { String },                                          -- string
    sym "@string.regex" { Character },                                 -- regex
    sym "@string.escape" { Character },                                -- escape characters within a string
    sym "@symbol" { fg = C.colors.purple, gui = italic },              -- For identifiers referring to symbols or atoms.

    sym "@field" { fg = C.colors.purple },                             -- also a key
    sym "@property" { fg = C.colors.yellow },                          -- the key in key/value pairs
    sym "@parameter" { fg = C.colors.yellow },
    sym "@parameter.reference" { fg = C.colors.lightblue },            --

    sym "@variable" { fg = C.colors.white },                           -- Any variable name that does not have another highlight
    sym "@variable.builtin" { fg = C.colors.purple, gui = italic },    -- Variable names that are defined by the languages like `this` or `self`.
    sym "@variable.member" { Constant },
    sym "@variable.parameter.builtin" { Constant },                    -- special parameters (e.g. _, it)

    sym "@function" { Function },                                      -- function definitions
    sym "@function.call" { Function },
    sym "@function.builtin" { Function, gui = italic },                -- built-in functions
    sym "@function.constructor" { fg = C.colors.yellow },              -- For constructor: `{}` in Lua and Java constructors.
    sym "@function.macro" { Function },                                -- macro defined functions: each `macro_rules` in Rust
    sym "@function.method" { Function },                               --

    sym "@keyword" { Keyword },                                        -- keywords not fitting into specific categories
    sym "@keyword.conditional" { Conditional },                        -- keywords related to conditionals (e.g. if, else)
    sym "@keyword.function" { Keyword },                               --
    sym "@keyword.repeat" { Repeat },                                  --

    sym "@module" { fg = C.colors.purple, gui = italic },              -- modules or namespaces
    sym "@module.builtin" { fg = C.colors.purple },                    -- built-in modules or namespaces
    sym "@label" { Label },                                            -- GOTO and other labels (e.g. label: in C), including heredoc labels

    sym "@operator" { Operator },                                      -- +, - etc
    sym "@exception" { Exception },                                    -- keywords related to exceptions (e.g. throw, catch)
    --
    sym "@annotation" { PreProc },                                     -- C++/Dart attributes annotations that can be attached to the code to denote some kind of meta information
    sym "@attribute" { PreProc },                                      -- Unstable
    sym "@include" { PreProc },                                        -- includes: `#include` in C `use` or `extern crate` in Rust or `require` in Lua.

    sym "@type" { Type },                                              -- type or class definitions and annotations
    sym "@type.builtin" { fg = C.colors.orange, gui = italic },        -- built-in types

    sym "@comment" { Comment },                                        -- line and block comments
    sym "@comment.documentation" { Comment },                          -- comments documenting code
    sym "@comment.error" { fg = C.text.error },                        -- error-type comments (e.g. ERROR, FIXME, DEPRECATED)
    sym "@comment.warning" { fg = C.text.warn },                       -- warning-type comments (e.g. WARNING, FIX, HACK)
    sym "@comment.todo" { fg = C.text.todo },                          -- todo-type comments (e.g. TODO, WIP)
    sym "@comment.note" { fg = C.colors.lightblue },                   -- note-type comments (e.g. NOTE, INFO, XXX)

    sym "@punctuation.bracket" { Delimiter },                          -- brackets and parens.
    sym "@punctuation.delimiter" { Delimiter },                        -- delimiters ie: `.`
    sym "@punctuation.special" { Delimiter },                          -- special punctuation that does not fall in the categories before.

    sym "@tag" { Tag },                                                -- XML-style tag names (e.g. in XML, HTML, etc.)
    sym "@tag.attribute" { fg = C.colors.yellow },                     -- XML-style tag attribute
    sym "@tag.builtin" { Tag },                                        -- XML-style tag names (e.g. HTML5 tags)
    sym "@tag.delimiter" { Delimiter },                                -- XML-style tag delimeters

    sym "@text" { fg = C.colors.white },                               -- unspecific text
    sym "@text.emphasis" { fg = C.colors.white, gui = italic },
    sym "@text.literal" { String },                                    -- Literal text
    sym "@text.strike" { Comment, gui = strikethrough },               -- strikethrough
    sym "@text.strong" { fg = C.colors.white, gui = bold },
    sym "@text.title" { fg = C.colors.orange, gui = bold },            -- Text that is part of a title
    sym "@text.underline" { fg = C.colors.white, gui = underline },
    sym "@text.uri" { fg = C.colors.white, gui = "italic,underline" }, -- Any URI like a link or email

    sym "@diff.plus" { DiffAdd },                                      -- added text (for diff files)
    sym "@diff.minus" { DiffDelete },                                  -- deleted text (for diff files)
    sym "@diff.delta" { DiffChange },                                  -- changed text (for diff files)

    sym "@markup.heading" { gui = "bold,underline" },                  -- headings, titles (including markers)
    sym "@markup.heading.1" { sym("@markup.heading") },                -- top-level heading
    sym "@markup.heading.2" { sym("@markup.heading") },                -- section heading
    sym "@markup.heading.3" { sym("@markup.heading") },                -- subsection heading
    sym "@markup.heading.4" { sym("@markup.heading") },                -- and so on
    sym "@markup.heading.5" { sym("@markup.heading") },                -- and so forth
    sym "@markup.heading.6" { sym("@markup.heading") },                -- six levels ought to be enough for anybody
    --
    -- sym "@markup.quote" {},                         -- block quotes
    -- sym "@markup.math" {},                          -- math environments (e.g. $ ... $ in LaTeX)
    --
    -- sym "@markup.link" {},                          -- text references, footnotes, citations, etc.
    -- sym "@markup.link.label" {},                    -- link, reference descriptions
    -- sym "@markup.link.url" {},                      -- URL-style links
    -- sym "@markup.raw" {},                           -- literal or verbatim text (e.g. inline code)
    -- sym "@markup.raw.block" {},                     -- literal or verbatim text as a stand-alone block
    -- sym "@markup.list" {},                          -- list markers
    -- sym "@markup.list.checked" {},                  -- checked todo-style list markers
    -- sym "@markup.list.unchecked" {},                -- unchecked todo-style list markers

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                           LSP                           │
    -- ╰─────────────────────────────────────────────────────────╯

    sym "@lsp.type.property" { fg = C.colors.yellow },

    sym "@lsp.mod.library.rust" { fg = C.colors.purple },
    sym "@lsp.typemod.namespace.library" { gui = italic },
    sym "@lsp.typemod.struct.library" { fg = C.colors.white },
    sym "@lsp.typemod.interface.library" { sym("@lsp.typemod.struct.library") },
    sym "@lsp.typemod.method.consuming" { Function },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                         Plugins                         │
    -- ╰─────────────────────────────────────────────────────────╯

    GitSignsAdd({ fg = C.git.add.fg }),
    GitSignsChange({ fg = C.git.change.fg }),
    GitSignsDelete({ fg = C.git.delete.text }),

    NeoTreeNormal({ bg = C.ui.sidebar.bg }),
    NeoTreeNormalNC({ NeoTreeNormal }),
    NeoTreeSignColumn({ NeoTreeNormal }),
    NeoTreeEndOfBuffer({ fg = C.ui.sidebar.bg, bg = C.ui.sidebar.bg }),
    NeoTreeStatusLine({ NeoTreeEndOfBuffer }),
    NeoTreeWinSeparator({ fg = C.bg }),
  }

  return scheme
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
