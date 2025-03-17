local colors = {
	blue = "#97aef2",
	green = "#c4f297",
	red = "#f29797",
	magenta = "#c497f2",
	grey = "#373737",
	light_grey = "#868686",
	black = "#1f1f1f",
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
