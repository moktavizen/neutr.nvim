local U = require('neutr.util')

-- stylua: ignore
local p   = {
  bg_dim  = '#121212',
  bg      = '#1e1e1e',
  bg_alt  = '#373737',
  fg_alt  = '#717171',
  fg_dim  = '#999999',
  fg      = '#ebebeb',
  red     = '#f2979c',
  green   = '#cdf297',
  yellow  = '#f2d297',
  blue    = '#97b4f2',
  magenta = '#cd97f2',
  cyan    = '#97d8f2',
}

local s800 = { l = 30, c = 2 }
local s500 = { l = 50, c = 5 }
local pale = { c = 0.33 }

-- stylua: ignore
local colors = {
  neutral =  {
    s50   =  p.fg,
    s100  =  U.set_lch(p.fg, { l = 80 }),
    s200  =  p.fg_dim,
    s300  =  U.set_lch(p.fg, { l = 65 }),
    s400  =  p.fg_alt,
    s500  =  U.set_lch(p.fg, { l = 50 }),
    s600  =  U.set_lch(p.fg, { l = 40 }),
    s700  =  p.bg_alt,
    s800  =  U.set_lch(p.fg, { l = 30 }),
    s900  =  p.bg,
    s950  =  p.bg_dim,
  },
  red     =  {
    s300  =  p.red,
    s500  =  U.set_lch(p.red, { l = s500.l, c = s500.c }),
    s800  =  U.set_lch(p.red, { l = s800.l, c = s800.c }),
  },
  green   =  {
    s300  =  p.green,
    s500  =  U.set_lch(p.green, { l = s500.l, c = s500.c }),
    s800  =  U.set_lch(p.green, { l = s800.l, c = s800.c }),
  },
  yellow  =  {
    s300  =  p.yellow,
    s800  =  U.set_lch(p.yellow, { l = s800.l, c = s800.c }),
  },
  blue    =  {
    s300  =  p.blue,
    s500  =  U.set_lch(p.blue, { l = s500.l, c = s500.c }),
    s800  =  U.set_lch(p.blue, { l = s800.l, c = s800.c }),
  },
  magenta =  {
    s300  =  p.magenta,
  },
  cyan    =  {
    s300  =  p.cyan,
    s500  =  U.rel_lch(p.cyan, { c = pale.c }),
    s800  =  U.set_lch(p.cyan, { l = s800.l, c = s800.c }),
  },
}

return colors
