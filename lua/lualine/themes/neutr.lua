local colors = {
	blue = "#97aef2",
	green = "#c4f297",
	black = "#1f1f1f",
	white = "#ebebeb",
	red = "#f29797",
	magenta = "#c497f2",
	grey = "#373737",
	light_grey = "#868686",
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

	command = {
		a = { fg = colors.whte, bg = colors.black },
		b = { fg = colors.whte, bg = colors.black },
		c = { fg = colors.whte, bg = colors.black },
	},

	inactive = {
		a = { fg = colors.light_grey, bg = colors.black },
		b = { fg = colors.light_grey, bg = colors.black },
		c = { fg = colors.light_grey, bg = colors.black },
	},
}
