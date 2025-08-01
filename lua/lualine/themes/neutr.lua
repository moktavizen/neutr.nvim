local c = require('neutr.palette.dark')

-- stylua: ignore
return {
  normal   = {
    a      = { fg = c.blue.s300,    bg = c.neutral.s900, gui = 'bold' },
    b      = { fg = c.neutral.s50,  bg = c.neutral.s900               },
    c      = { fg = c.neutral.s200, bg = c.neutral.s900               },
                                                                      },
  insert   = {
    a      = { fg = c.green.s300,   bg = c.neutral.s900, gui = 'bold' },
    b      = { fg = c.neutral.s50,  bg = c.neutral.s900               },
    c      = { fg = c.neutral.s200, bg = c.neutral.s900               },
                                                                      },
  visual   = {
    a      = { fg = c.magenta.s300, bg = c.neutral.s900, gui = 'bold' },
    b      = { fg = c.neutral.s50,  bg = c.neutral.s900               },
    c      = { fg = c.neutral.s200, bg = c.neutral.s900               },
                                                                      },
  replace  = {
    a      = { fg = c.red.s300,     bg = c.neutral.s900, gui = 'bold' },
    b      = { fg = c.neutral.s50,  bg = c.neutral.s900               },
    c      = { fg = c.neutral.s200, bg = c.neutral.s900               },
                                                                      },
  inactive = {
    a      = { fg = c.neutral.s600, bg = c.neutral.s900, gui = 'bold' },
    b      = { fg = c.neutral.s600, bg = c.neutral.s900               },
    c      = { fg = c.neutral.s600, bg = c.neutral.s900               },
                                                                      },
}
