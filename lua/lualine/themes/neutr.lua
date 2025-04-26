local colors = {
	blue = "#97b4f2",
	green = "#cdf297",
	red = "#f2979c",
	magenta = "#cd97f2",
	grey = "#373737",
	light_grey = "#868686",
	black = "#1e1e1e",
	white = "#ebebeb",
}

return {
	normal = {
		a = { fg = colors.black, bg = colors.blue, gui = "bold" },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.light_grey, bg = colors.black },
	},
	insert = {
		a = { fg = colors.black, bg = colors.green, gui = "bold" },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.light_grey, bg = colors.black },
	},
	visual = {
		a = { fg = colors.black, bg = colors.magenta, gui = "bold" },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.light_grey, bg = colors.black },
	},
	replace = {
		a = { fg = colors.black, bg = colors.red, gui = "bold" },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.light_grey, bg = colors.black },
	},
	inactive = {
		a = { fg = colors.light_grey, bg = colors.black, gui = "bold" },
		b = { fg = colors.light_grey, bg = colors.black },
		c = { fg = colors.light_grey, bg = colors.black },
	},
}
