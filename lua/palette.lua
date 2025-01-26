local lush = require("lush")
local hsl = lush.hsl

local colors = {
	neutral = {
		["50"] = hsl("#ebebeb"),
		["100"] = hsl("#c1c1c1"),
		["200"] = hsl("#999999"),
		["300"] = hsl("#868686"),
		["400"] = hsl("#717171"),
		["500"] = hsl("#5c5c5c"),
		["600"] = hsl("#484848"),
		["700"] = hsl("#373737"),
		["800"] = hsl("#2c2c2c"),
		["900"] = hsl("#1f1f1f"),
		["950"] = hsl("#141414"),
	},
	red = {
		["300"] = hsl("#f29797"),
		["950"] = hsl("#352c2c"),
	},
	yellow = {
		["300"] = hsl("#f2db97"),
		["950"] = hsl("#35332c"),
	},
	green = {
		["300"] = hsl("#c4f297"),
		["950"] = hsl("#30352c"),
	},
	cyan = {
		["300"] = hsl("#97f2f2"),
		["500"] = hsl("#b6d2d2"),
		["950"] = hsl("#2c3535"),
	},
	blue = {
		["300"] = hsl("#97aef2"),
		["950"] = hsl("#2c2e35"),
	},
	magenta = {
		["300"] = hsl("#c497f2"),
	},
}

return colors
