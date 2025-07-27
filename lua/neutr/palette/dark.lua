local U = require('neutr.util')

-- stylua: ignore
local p   = {
  bg_alt  = '#131313',
  bg      = '#1e1e1e',
  bg_1    = '#2c2c2c',
  bg_2    = '#373737',
  fg_2    = '#717171',
  fg_1    = '#868686',
  fg_alt  = '#999999',
  fg      = '#ebebeb',
  red     = '#f2979c',
  green   = '#cdf297',
  yellow  = '#f2d297',
  blue    = '#97b4f2',
  magenta = '#cd97f2',
  cyan    = '#97d8f2',
}

-- stylua: ignore
local colors =    {
  neutral    =    {
    [50]     =    p.fg,
    [100]    =    U.set_lightness(p.fg, 80),
    [200]    =    p.fg_alt,
    [300]    =    p.fg_1,
    [400]    =    p.fg_2,
    [500]    =    U.set_lightness(p.fg, 50),
    [600]    =    U.set_lightness(p.fg, 40),
    [700]    =    p.bg_2,
    [800]    =    p.bg_1,
    [900]    =    p.bg,
    [950]    =    p.bg_alt
  },
  red        =    {
    [300]    =    p.red,
    [950]    =    U.dim(p.red),
  },
  green      =    {
    [300]    =    p.green,
    [950]    =    U.dim(p.green),
  },
  yellow     =    {
    [300]    =    p.yellow,
    [950]    =    U.dim(p.yellow),
  },
  blue       =    {
    [300]    =    p.blue,
    [950]    =    U.dim(p.blue),
  },
  magenta    =    {
    [300]    =    p.magenta,
  },
  cyan       =    {
    [300]    =    p.cyan,
    [500]    =    U.pale(p.cyan),
    [950]    =    U.dim(p.cyan),
  },
}

return colors
