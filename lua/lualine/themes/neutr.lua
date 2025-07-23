local c = require('neutr.palette.dark')

-- stylua: ignore
return {
  normal   = {
    a      = { fg = c.neutral[900], bg = c.blue[300],    gui = 'bold' },
    b      = { fg = c.neutral[50],  bg = c.neutral[700]               },
    c      = { fg = c.neutral[300], bg = c.neutral[900]               },
  },
  insert   = {
    a      = { fg = c.neutral[900], bg = c.green[300],   gui = 'bold' },
    b      = { fg = c.neutral[50],  bg = c.neutral[700]               },
    c      = { fg = c.neutral[300], bg = c.neutral[900]               },
  },
  visual   = {
    a      = { fg = c.neutral[900], bg = c.magenta[300], gui = 'bold' },
    b      = { fg = c.neutral[50],  bg = c.neutral[700]               },
    c      = { fg = c.neutral[300], bg = c.neutral[900]               },
  },
  replace  = {
    a      = { fg = c.neutral[900], bg = c.red[300],     gui = 'bold' },
    b      = { fg = c.neutral[50],  bg = c.neutral[700]               },
    c      = { fg = c.neutral[300], bg = c.neutral[900]               },
  },
  inactive = {
    a      = { fg = c.neutral[300], bg = c.neutral[900], gui = 'bold' },
    b      = { fg = c.neutral[300], bg = c.neutral[900]               },
    c      = { fg = c.neutral[300], bg = c.neutral[900]               },
  },
}
