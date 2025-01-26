local c = require("palette")

local colors = {
	blue = c.blue["300"],
	green = c.green["300"],
	black = c.neutral["900"],
	white = c.neutral["50"],
	red = c.red["300"],
	magenta = c.magenta["300"],
	grey = c.neutral["700"],
	light_grey = c.neutral["300"],
}

return {
	normal = {
		a = { gui = "bold", fg = colors.black, bg = colors.blue },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.light_grey, bg = colors.black },
	},

	insert = { a = { gui = "bold", fg = colors.black, bg = colors.green } },
	visual = { a = { gui = "bold", fg = colors.black, bg = colors.magenta } },
	replace = { a = { gui = "bold", fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.light_grey, bg = colors.black },
		b = { fg = colors.light_grey, bg = colors.black },
		c = { fg = colors.light_grey, bg = colors.black },
	},
}
