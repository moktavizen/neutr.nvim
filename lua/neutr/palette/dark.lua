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

local dim = { l = 30, c = 2 }
local pale = { c = 0.33 }

-- stylua: ignore
local colors =    {
  neutral    =    {
    [50]     =    p.fg,
    [100]    =    U.set_lch(p.fg, { l = 80 }),
    [200]    =    p.fg_dim,
    [300]    =    U.set_lch(p.fg, { l = 65 }),
    [400]    =    p.fg_alt,
    [500]    =    U.set_lch(p.fg, { l = 50 }),
    [600]    =    U.set_lch(p.fg, { l = 40 }),
    [700]    =    p.bg_alt,
    [800]    =    U.set_lch(p.fg, { l = 30 }),
    [900]    =    p.bg,
    [950]    =    p.bg_dim
  },
  red        =    {
    [300]    =    p.red,
    [950]    =    U.set_lch(p.red, { l = dim.l, c = dim.c }),
  },
  green      =    {
    [300]    =    p.green,
    [950]    =    U.set_lch(p.green, { l = dim.l, c = dim.c }),
  },
  yellow     =    {
    [300]    =    p.yellow,
    [950]    =    U.set_lch(p.yellow, { l = dim.l, c = dim.c }),
  },
  blue       =    {
    [300]    =    p.blue,
    [950]    =    U.set_lch(p.blue, { l = dim.l, c = dim.c }),
  },
  magenta    =    {
    [300]    =    p.magenta,
  },
  cyan       =    {
    [300]    =    p.cyan,
    [500]    =    U.rel_lch(p.cyan, { c = pale.c }),
    [950]    =    U.set_lch(p.cyan, { l = dim.l, c = dim.c }),
  },
}

return colors
