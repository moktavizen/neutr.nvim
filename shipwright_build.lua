-- shipwright_build.lua

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local lushwright = require("shipwright.transform.lush")
run(
	require("lua.lush_theme.neutr-dev"),
	-- generate lua code
	lushwright.to_lua,
	-- write the lua code into our destination.
	-- you must specify open and close markers yourself to account
	-- for differing comment styles, patchwrite isn't limited to lua files.
	{ patchwrite, "colors/neutr.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" }
)
