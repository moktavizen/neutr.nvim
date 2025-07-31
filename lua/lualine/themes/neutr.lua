local c = require('neutr.palette.dark')

-- stylua: ignore
return {
  normal   = {
    a      = { fg = c.neutral.s900, bg = c.blue.s300,    gui = 'bold' },
    b      = { fg = c.neutral.s50,  bg = c.neutral.s700               },
    c      = { fg = c.neutral.s300, bg = c.neutral.s900               },
  },
  insert   = {
    a      = { fg = c.neutral.s900, bg = c.green.s300,   gui = 'bold' },
    b      = { fg = c.neutral.s50,  bg = c.neutral.s700               },
    c      = { fg = c.neutral.s300, bg = c.neutral.s900               },
  },
  visual   = {
    a      = { fg = c.neutral.s900, bg = c.magenta.s300, gui = 'bold' },
    b      = { fg = c.neutral.s50,  bg = c.neutral.s700               },
    c      = { fg = c.neutral.s300, bg = c.neutral.s900               },
  },
  replace  = {
    a      = { fg = c.neutral.s900, bg = c.red.s300,     gui = 'bold' },
    b      = { fg = c.neutral.s50,  bg = c.neutral.s700               },
    c      = { fg = c.neutral.s300, bg = c.neutral.s900               },
  },
  inactive = {
    a      = { fg = c.neutral.s300, bg = c.neutral.s900, gui = 'bold' },
    b      = { fg = c.neutral.s300, bg = c.neutral.s900               },
    c      = { fg = c.neutral.s300, bg = c.neutral.s900               },
  },
}
