local colors = {
	blue = "#97b4f2",
	green = "#cdf297",
	black = "#212121",
	white = "#ececec",
	red = "#f2979c",
	purple = "#cd97f2",
	grey = "#4a4a4a",
	light_grey = "#888888",
}

return {
	normal = {
		a = { gui = "bold", fg = colors.black, bg = colors.blue },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.light_grey, bg = colors.black },
	},

	insert = { a = { gui = "bold", fg = colors.black, bg = colors.green } },
	visual = { a = { gui = "bold", fg = colors.black, bg = colors.purple } },
	replace = { a = { gui = "bold", fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.light_grey, bg = colors.black },
		b = { fg = colors.light_grey, bg = colors.black },
		c = { fg = colors.light_grey, bg = colors.black },
	},
}
