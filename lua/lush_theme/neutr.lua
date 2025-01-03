--
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
--

-- This is a starter ccheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl

local colors = {
	neutral = {
		["50"] = hsl("#ececec"),
		["100"] = hsl("#b7b7b7"),
		["200"] = hsl("#9c9c9c"),
		["300"] = hsl("#888888"),
		["400"] = hsl("#737373"),
		["500"] = hsl("#5d5d5d"),
		["600"] = hsl("#4a4a4a"),
		["700"] = hsl("#383838"),
		["800"] = hsl("#2e2e2e"),
		["900"] = hsl("#212121"),
		["950"] = hsl("#171717"),
	},
	red = {
		["300"] = hsl("#f2979c"),
		["950"] = hsl("#352c2d"),
	},
	orange = {
		["300"] = hsl("#f2d297"),
		["950"] = hsl("#352c2d"),
	},
	green = {
		["300"] = hsl("#cdf297"),
		["950"] = hsl("#31352c"),
	},
	cyan = {
		["300"] = hsl("#97d8f2"),
		["500"] = hsl("#b6cad2"),
		["950"] = hsl("#2c3235"),
	},
	blue = {
		["300"] = hsl("#97b4f2"),
		["950"] = hsl("#2c2f35"),
	},
	purple = {
		["300"] = hsl("#cd97f2"),
	},
}

local c = colors

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--
		Title({ fg = c.neutral["50"] }), -- Titles for output from ":set all", ":autocmd" etc.
		Normal({ fg = c.neutral["50"], bg = c.neutral["900"] }), -- Normal text
		NormalNC({ fg = c.neutral["50"], bg = c.neutral["900"] }), -- normal text in non-current windows
		NormalFloat({ fg = c.neutral["100"], bg = c.neutral["950"] }), -- Normal text in floating windows.
		FloatBorder({ fg = c.neutral["400"], bg = c.neutral["950"] }), -- Border of floating windows.
		FloatTitle({ Title }), -- Title of floating windows.
		ColorColumn({ bg = c.neutral["600"] }), -- Columns set with 'colorcolumn'
		Conceal({ fg = c.neutral["300"] }), -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor({ fg = c.neutral["900"], bg = c.neutral["50"] }), -- Character under the cursor
		lCursor({ fg = c.neutral["900"], bg = c.neutral["50"] }), -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM({ fg = c.neutral["900"], bg = c.neutral["50"] }), -- Like Cursor, but used when in IME mode |CursorIM|
		CursorColumn({ bg = c.neutral["800"] }), -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine({ bg = c.neutral["800"] }), -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory({ fg = c.neutral["100"] }), -- Directory names (and other special names in listings)
		EndOfBuffer({ fg = c.neutral["900"] }), -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		TermCursor({ fg = c.neutral["900"], bg = c.neutral["100"] }), -- Cursor in a focused terminal
		TermCursorNC({ fg = c.neutral["900"], bg = c.neutral["200"] }), -- Cursor in an unfocused terminal
		VertSplit({ fg = c.neutral["400"] }), -- Column separating vertically split windows
		Folded({ fg = c.neutral["200"], bg = c.neutral["800"] }), -- Line used for closed folds
		FoldColumn({ fg = c.neutral["600"] }), -- 'foldcolumn'
		SignColumn({ fg = c.neutral["600"] }), -- Column where |signs| are displayed
		IncSearch({ fg = c.neutral["950"], bg = c.orange["300"] }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Search({ fg = c.neutral["950"], bg = c.blue["300"] }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		CurSearch({ fg = c.neutral["950"], bg = c.red["300"] }), -- Highlighting a search pattern under the cursor (see 'hlsearch')
		MatchParen({ fg = c.neutral["900"], bg = c.blue["300"] }), -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		Substitute({ fg = c.red["300"], bg = c.neutral["600"] }), -- |:substitute| replacement text highlighting
		LineNr({ fg = c.neutral["500"] }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove({ LineNr }), -- Line number for when the 'relativenumber' option is set, above the cursor line
		LineNrBelow({ LineNr }), -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr({ fg = c.neutral["100"] }), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		CursorLineFold({ FoldColumn }), -- Like FoldColumn when 'cursorline' is set for the cursor line
		CursorLineSign({ SignColumn }), -- Like SignColumn when 'cursorline' is set for the cursor line
		NonText({ fg = c.neutral["700"] }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		SpecialKey({ NonText }), -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		Pmenu({ fg = c.neutral["100"], bg = c.neutral["950"] }), -- Popup menu: Normal item.
		PmenuSel({ fg = c.blue["300"], bg = c.blue["950"] }), -- Popup menu: Selected item.
		PmenuKind({ Pmenu }), -- Popup menu: Normal item "kind"
		PmenuKindSel({ PmenuSel }), -- Popup menu: Selected item "kind"
		PmenuExtra({ Pmenu }), -- Popup menu: Normal item "extra text"
		PmenuExtraSel({ PmenuSel }), -- Popup menu: Selected item "extra text"
		PmenuSbar({ bg = c.neutral["950"] }), -- Popup menu: Scrollbar.
		PmenuThumb({ bg = c.neutral["700"] }), -- Popup menu: Thumb of the scrollbar.
		Question({ fg = c.blue["300"] }), -- |hit-enter| prompt and yes/no questions
		QuickFixLine({ bg = c.neutral["600"] }), -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		StatusLine({ fg = c.neutral["100"], bg = c.neutral["950"] }), -- Status line of current window
		StatusLineNC({ fg = c.neutral["600"], bg = c.neutral["950"] }), -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine({ fg = c.neutral["600"], bg = c.neutral["950"] }), -- Tab pages line, not active tab page label
		TabLineFill({ bg = c.neutral["950"] }), -- Tab pages line, where there are no labels
		TabLineSel({ Normal }), -- Tab pages line, active tab page label
		Visual({ bg = c.neutral["700"] }), -- Visual mode selection
		VisualNOS({ bg = c.neutral["600"] }), -- Visual mode selection when vim is "Not Owning the Selection".
		ModeMsg({ gui = "bold", fg = c.neutral["100"] }), -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea({}), -- Area for messages and cmdline
		MsgSeparator({}), -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg({ fg = c.blue["300"] }), -- |more-prompt|
		Whitespace({ fg = c.neutral["600"] }), -- "nbsp", "space", "tab" and "trail" in 'listchars'
		Winseparator({ fg = c.neutral["400"] }), -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		WildMenu({ bg = c.neutral["600"] }), -- Current match in 'wildmenu' completion
		WinBar({ fg = c.neutral["100"] }), -- Window bar of current window
		WinBarNC({ fg = c.neutral["500"] }), -- Window bar of not-current windows
		SpellBad({ gui = "undercurl", sp = c.red["300"] }), -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap({ gui = "undercurl", sp = c.orange["300"] }), -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal({ gui = "undercurl", sp = c.blue["300"] }), -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare({ gui = "undercurl", sp = c.green["300"] }), -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		ErrorMsg({ gui = "bold,italic", fg = c.red["300"] }), -- Error messages on the command line
		WarningMsg({ fg = c.orange["300"] }), -- Warning messages
		DiffAdd({ bg = c.green["950"] }), -- Diff mode: Added line |diff.txt|
		DiffChange({ bg = c.blue["950"] }), -- Diff mode: Changed line |diff.txt|
		DiffDelete({ bg = c.red["950"] }), -- Diff mode: Deleted line |diff.txt|
		DiffText({ bg = c.cyan["950"] }), -- Diff mode: Changed text within a changed line |diff.txt|

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.
		-- This theme prioritize html > ts > js > css > rust > python > c/c++

		Comment({ gui = "italic", fg = c.neutral["200"] }), -- Any comment

		Constant({ fg = c.neutral["50"] }), -- (*) Any constant
		String({ fg = c.green["300"] }), --   A string constant: "this is a string"
		Character({ fg = c.cyan["300"] }), --   A character constant: 'c', '\n'
		Number({ fg = c.red["300"] }), --   A number constant: 234, 0xff
		Boolean({ fg = c.red["300"] }), --   A boolean constant: TRUE, false
		Float({ fg = c.red["300"] }), --   A floating point constant: 2.3e10

		Identifier({ fg = c.cyan["300"] }), -- (*) Any variable name
		Function({ fg = c.cyan["300"] }), --   Function name (also: methods for classes)

		Statement({ fg = c.red["300"] }), -- (*) Any statement
		Conditional({ fg = c.cyan["300"] }), --   if, then, else, endif, switch, etc.
		Repeat({ fg = c.cyan["300"] }), --   for, do, while, etc.
		Label({ fg = c.cyan["300"] }), --   case, default, etc.
		Operator({ fg = c.cyan["300"] }), --   "sizeof", "+", "*", etc.
		Keyword({ fg = c.purple["300"] }), --   any other keyword
		Exception({ fg = c.red["300"] }), --   try, catch, throw

		PreProc({ fg = c.purple["300"] }), -- (*) Generic Preprocessor
		Include({ fg = c.cyan["300"] }), --   Preprocessor #include
		Define({ fg = c.cyan["300"] }), --   Preprocessor #define
		Macro({ fg = c.blue["300"] }), --   Same as Define
		PreCondit({ fg = c.blue["300"] }), --   Preprocessor #if, #else, #endif, etc.

		Type({ fg = c.purple["300"] }), -- (*) int, long, char, etc.
		StorageClass({ fg = c.cyan["500"] }), --   static, register, volatile, etc.
		Structure({ fg = c.cyan["300"] }), --   struct, union, enum, etc.
		Typedef({ fg = c.red["300"] }), --   A typedef

		Special({ fg = c.cyan["300"] }), -- (*) Any special symbol
		SpecialChar({ fg = c.red["300"] }), --   Special character in a constant
		Tag({ fg = c.red["300"] }), --   You can use CTRL-] on this
		Delimiter({ fg = c.cyan["300"] }), --   Character that needs attention
		SpecialComment({ gui = "italic", fg = c.neutral["200"] }), --   Special things inside a comment (e.g. '\n')
		Debug({ fg = c.orange["300"] }), --   Debugging statements

		Underlined({ gui = "underline" }), -- Text that stands out, HTML links
		-- Ignore({}), -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error({ fg = c.red["300"], bg = c.red["950"] }), -- Any erroneous construct
		Todo({ fg = c.cyan["300"] }), -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		Noise({ fg = c.cyan["300"] }), -- css : and ; without treesitter

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		LspReferenceText({ bg = c.neutral["600"] }), -- Used for highlighting "text" references
		LspReferenceRead({ bg = c.neutral["600"] }), -- Used for highlighting "read" references
		LspReferenceWrite({ bg = c.neutral["600"] }), -- Used for highlighting "write" references
		LspCodeLens({ fg = c.neutral["400"] }), -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		LspCodeLensSeparator({ LspCodeLens }), -- Used to color the seperator between two or more code lens.
		LspSignatureActiveParameter({ gui = "bold", bg = c.neutral["700"] }), -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError({ fg = c.red["300"] }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn({ fg = c.orange["300"] }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo({ fg = c.blue["300"] }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint({ fg = c.cyan["300"] }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk({ fg = c.green["300"] }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticVirtualTextError({ fg = c.red["300"], bg = c.red["950"] }), -- Used for "Error" diagnostic virtual text.
		DiagnosticVirtualTextWarn({ fg = c.orange["300"], bg = c.orange["950"] }), -- Used for "Warn" diagnostic virtual text.
		DiagnosticVirtualTextInfo({ fg = c.blue["300"], bg = c.blue["950"] }), -- Used for "Info" diagnostic virtual text.
		DiagnosticVirtualTextHint({ fg = c.cyan["300"], bg = c.cyan["950"] }), -- Used for "Hint" diagnostic virtual text.
		DiagnosticVirtualTextOk({ fg = c.green["300"], bg = c.green["950"] }), -- Used for "Ok" diagnostic virtual text.
		DiagnosticUnderlineError({ gui = "underline", sp = c.red["300"] }), -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn({ gui = "underline", sp = c.orange["300"] }), -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo({ gui = "underline", sp = c.blue["300"] }), -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint({ gui = "underline", sp = c.cyan["300"] }), -- Used to underline "Hint" diagnostics.
		DiagnosticUnderlineOk({ gui = "underline", sp = c.green["300"] }), -- Used to underline "Ok" diagnostics.
		DiagnosticFloatingError({ fg = c.red["300"] }), -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		DiagnosticFloatingWarn({ fg = c.orange["300"] }), -- Used to color "Warn" diagnostic messages in diagnostics float.
		DiagnosticFloatingInfo({ fg = c.blue["300"] }), -- Used to color "Info" diagnostic messages in diagnostics float.
		DiagnosticFloatingHint({ fg = c.cyan["300"] }), -- Used to color "Hint" diagnostic messages in diagnostics float.
		DiagnosticFloatingOk({ fg = c.green["300"] }), -- Used to color "Ok" diagnostic messages in diagnostics float.
		DiagnosticSignError({ fg = c.red["300"] }), -- Used for "Error" signs in sign column.
		DiagnosticSignWarn({ fg = c.orange["300"] }), -- Used for "Warn" signs in sign column.
		DiagnosticSignInfo({ fg = c.blue["300"] }), -- Used for "Info" signs in sign column.
		DiagnosticSignHint({ fg = c.cyan["300"] }), -- Used for "Hint" signs in sign column.
		DiagnosticSignOk({ fg = c.green["300"] }), -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@variable.member")
		-- sym('@variable.member')
		-- sym"@variable.member"
		-- sym'@variable.member'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		sym("@variable")({ fg = c.neutral["50"] }), -- various variable names
		sym("@variable.builtin")({ fg = c.cyan["300"] }), -- built-in variable names (e.g. `this`, `self`)
		sym("@variable.parameter")({ gui = "italic", fg = c.neutral["50"] }), -- parameters of a function
		-- sym("@variable.parameter.builtin")({}), -- special parameters (e.g. `_`, `it`)
		sym("@variable.member")({ fg = c.neutral["50"] }), -- object and struct fields

		sym("@constant")({ fg = c.neutral["50"] }), -- constant identifiers
		sym("@constant.builtin")({ fg = c.cyan["300"] }), -- built-in constant values
		sym("@constant.macro")({ fg = c.blue["300"] }), -- constants defined by the preprocessor

		sym("@module")({ fg = c.orange["300"] }), -- modules or namespaces
		-- sym("@module.builtin")({}), -- built-in modules or namespaces
		sym("@label")({ fg = c.orange["300"] }), -- `GOTO` and other labels (e.g. `label:` in C), including heredoc labels

		sym("@string")({ fg = c.green["300"] }), -- string literals
		sym("@string.documentation")({ Comment }), -- string documenting code (e.g. Python docstrings)
		sym("@string.regexp")({ fg = c.green["300"] }), -- regular expressions
		sym("@string.escape")({ fg = c.neutral["50"] }), -- escape sequences
		-- sym("@string.special")({}), -- other special strings (e.g. dates)
		sym("@string.special.symbol")({ fg = c.cyan["300"] }), -- symbols or atoms
		-- sym("@string.special.path")({}), -- filenames
		sym("@string.special.url")({ gui = "underline" }), -- URIs (e.g. hyperlinks)

		sym("@character")({ fg = c.neutral["50"] }), -- character literals
		sym("@character.special")({ fg = c.red["300"] }), -- special characters (e.g. wildcards)

		sym("@boolean")({ fg = c.red["300"] }), -- boolean literals
		sym("@number")({ fg = c.red["300"] }), -- numeric literals
		sym("@number.float")({ fg = c.red["300"] }), -- floating-point number literals

		sym("@type")({ fg = c.orange["300"] }), -- type or class definitions and annotations
		sym("@type.builtin")({ fg = c.orange["300"] }), -- built-in types
		sym("@type.definition")({ fg = c.orange["300"] }), -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)

		sym("@attribute")({ fg = c.purple["300"] }), -- attribute annotations (e.g. Python decorators, Rust lifetimes)
		sym("@attribute.builtin")({ fg = c.orange["300"] }), -- builtin annotations (e.g. `@property` in Python)
		sym("@property")({ fg = c.cyan["500"] }), -- the key in key/value pairs

		sym("@function")({ fg = c.blue["300"] }), -- function definitions
		sym("@function.builtin")({ fg = c.blue["300"] }), -- built-in functions
		sym("@function.call")({ fg = c.blue["300"] }), -- function calls
		sym("@function.macro")({ fg = c.blue["300"] }), -- preprocessor macros

		sym("@function.method")({ fg = c.blue["300"] }), -- method definitions
		sym("@function.method.call")({ fg = c.blue["300"] }), -- method calls

		sym("@constructor")({ fg = c.purple["300"] }), -- constructor calls and definitions
		sym("@operator")({ fg = c.cyan["300"] }), -- symbolic operators (e.g. `+`, `*`)

		sym("@keyword")({ fg = c.purple["300"] }), -- keywords not fitting into specific categories
		sym("@keyword.coroutine")({ fg = c.purple["300"] }), -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
		sym("@keyword.function")({ fg = c.red["300"] }), -- keywords that define a function (e.g. `func` in Go, `def` in Python)
		sym("@keyword.operator")({ fg = c.cyan["300"] }), -- operators that are English words (e.g. `and`, `or`)
		sym("@keyword.import")({ fg = c.cyan["300"] }), -- keywords for including modules (e.g. `import`, `from` in Python)
		sym("@keyword.type")({ fg = c.purple["300"] }), -- keywords defining composite types (e.g. `struct`, `enum`)
		sym("@keyword.modifier")({ fg = c.purple["300"] }), -- keywords defining type modifiers (e.g. `const`, `static`, `public`)
		sym("@keyword.repeat")({ gui = "italic", fg = c.cyan["300"] }), -- keywords related to loops (e.g. `for`, `while`)
		sym("@keyword.return")({ gui = "italic", fg = c.cyan["300"] }), -- keywords like `return` and `yield`
		sym("@keyword.debug")({ gui = "italic", fg = c.orange["300"] }), -- keywords related to debugging
		sym("@keyword.exception")({ gui = "italic", fg = c.cyan["300"] }), -- keywords related to exceptions (e.g. `throw`, `catch`)

		sym("@keyword.conditional")({ gui = "italic", fg = c.cyan["300"] }), -- keywords related to conditionals (e.g. `if`, `else`)
		sym("@keyword.conditional.ternary")({ fg = c.cyan["300"] }), -- ternary operator (e.g. `?`, `:`)

		sym("@keyword.directive")({ gui = "italic", fg = c.cyan["300"] }), -- various preprocessor directives and shebangs
		sym("@keyword.directive.define")({ gui = "italic", fg = c.cyan["300"] }), -- preprocessor definition directives

		sym("@punctuation.delimiter")({ fg = c.cyan["300"] }), -- delimiters (e.g. `;`, `.`, `,`)
		sym("@punctuation.bracket")({ fg = c.cyan["300"] }), -- brackets (e.g. `()`, `{}`, `[]`)
		sym("@punctuation.special")({ fg = c.cyan["300"] }), -- special symbols (e.g. `{}` in string interpolation)

		sym("@comment")({ Comment }), -- line and block comments
		sym("@comment.documentation")({ Comment }), -- comments documenting code

		sym("@comment.error")({ fg = c.red["300"] }), -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
		sym("@comment.warning")({ fg = c.orange["300"] }), -- warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
		sym("@comment.todo")({ fg = c.blue["300"] }), -- todo-type comments (e.g. `TODO`, `WIP`)
		sym("@comment.note")({ fg = c.cyan["300"] }), -- note-type comments (e.g. `NOTE`, `INFO`, `XXX`)

		sym("@markup.strong")({ gui = "bold", fg = c.red["300"] }), -- bold text
		sym("@markup.italic")({ gui = "italic", fg = c.red["300"] }), -- italic text
		sym("@markup.strikethrough")({ gui = "strikethrough", fg = c.neutral["50"] }), -- struck-through text
		sym("@markup.underline")({ Underlined }), -- underlined text (only for literal underline markup!)

		sym("@markup.heading")({ fg = c.neutral["50"] }), -- headings, titles (including markers)
		sym("@markup.heading.1")({ fg = c.neutral["50"] }), -- top-level heading
		sym("@markup.heading.2")({ fg = c.neutral["50"] }), -- section heading
		sym("@markup.heading.3")({ fg = c.neutral["50"] }), -- subsection heading
		sym("@markup.heading.4")({ fg = c.neutral["50"] }), -- and so on
		sym("@markup.heading.5")({ fg = c.neutral["50"] }), -- and so forth
		sym("@markup.heading.6")({ fg = c.neutral["50"] }), -- six levels ought to be enough for anybody

		sym("@markup.quote")({ gui = "italic", fg = c.cyan["300"] }), -- block quotes
		sym("@markup.math")({ fg = c.blue["300"] }), -- math environments (e.g. `$ ... $` in LaTeX)

		sym("@markup.link")({ fg = c.cyan["300"] }), -- text references, footnotes, citations, etc.
		sym("@markup.link.label")({ fg = c.green["300"] }), -- link, reference descriptions
		sym("@markup.link.url")({ fg = c.red["300"] }), -- URL-style links

		sym("@markup.raw")({ fg = c.neutral["50"] }), -- literal or verbatim text (e.g. inline code)
		sym("@markup.raw.block")({ fg = c.neutral["100"] }), -- literal or verbatim text as a stand-alone block

		sym("@markup.list")({ fg = c.cyan["300"] }), -- list markers
		sym("@markup.list.checked")({ fg = c.green["300"] }), -- checked todo-style list markers
		sym("@markup.list.unchecked")({ fg = c.blue["300"] }), -- unchecked todo-style list markers

		sym("@diff.plus")({ fg = c.green["300"] }), -- added text (for diff files)
		sym("@diff.minus")({ fg = c.red["300"] }), -- deleted text (for diff files)
		sym("@diff.delta")({ fg = c.blue["300"] }), -- changed text (for diff files)

		sym("@tag")({ fg = c.red["300"] }), -- XML-style tag names (e.g. in XML, HTML, etc.)
		-- sym("@tag.builtin")({}), -- XML-style tag names (e.g. HTML5 tags)
		sym("@tag.attribute")({ fg = c.purple["300"] }), -- XML-style tag attributes
		sym("@tag.delimiter")({ fg = c.cyan["300"] }), -- XML-style tag delimiters

		-- Plugins
		--
		-- snacks
		--
		SnacksIndentScope({ fg = c.neutral["500"] }),
		SnacksDashboardHeader({ fg = c.neutral["50"] }),
		SnacksDashboardDesc({ fg = c.purple["300"] }),
		SnacksDashboardIcon({ fg = c.red["300"] }),
		SnacksDashboardKey({ fg = c.blue["300"] }),
		SnacksDashboardFooter({ fg = c.orange["300"] }),
		SnacksDashboardSpecial({ fg = c.orange["300"] }),
		--
		-- nvim-tree
		--
		NvimTreeRootFolder({ gui = "bold", fg = c.neutral["100"] }),
		NvimTreeWinSeparator({ fg = c.neutral["950"], bg = c.neutral["950"] }),
		NvimTreeNormal({ NormalFloat }),
		NvimTreeCursorLine({ fg = c.blue["300"], bg = c.blue["950"] }),
		--
		-- bufferline
		--
		BufferLineOffset({ fg = c.neutral["50"], bg = c.neutral["950"] }),
		BufferlineOffsetSeparator({ NvimTreeWinSeparator }),
		--
		-- fzf-lua
		--
		FzfLuaNormal({ NormalFloat }),
		FzfLuaBorder({ FloatBorder }),
		FzfLuaPreviewNormal({ NormalFloat }),
		FzfLuaHeaderText({ fg = c.red["300"] }),
		FzfLuaBufFlagCur({ fg = c.red["300"] }),
		FzfLuaLiveSym({ fg = c.red["300"] }),
		FzfLuaHeaderBind({ fg = c.orange["300"] }),
		FzfLuaBufNr({ fg = c.orange["300"] }),
		FzfLuaTabMarker({ fg = c.orange["300"] }),
		FzfLuaPathLineNr({ fg = c.green["300"] }),
		FzfLuaBufFlagAlt({ fg = c.cyan["300"] }),
		FzfLuaPathColNr({ fg = c.cyan["300"] }),
		FzfLuaTabTitle({ fg = c.blue["300"] }),
		FzfLuaBufName({ fg = c.purple["300"] }),
		--
		-- gitsigns
		--
		Added({ fg = c.green["300"] }),
		Changed({ fg = c.blue["300"] }),
		Removed({ fg = c.red["300"] }),
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
