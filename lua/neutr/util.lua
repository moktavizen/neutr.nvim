local ColorUtils = require('mini.colors')
local config = require('neutr.config')

local tint = config.opts.tint_strength

local M = {}

local function is_valid_hue(hue)
  return type(hue) == 'number' and (0 <= hue and hue <= 360)
end

local function show_hue_error(hue)
  local msg = string.format('Hue(%s) must be a number (0 <= hue <= 360)', hue)
  vim.notify(msg, vim.log.levels.ERROR, { title = 'Hue Error' })
end

local function show_conversion_error(hex)
  local msg = string.format('Failed to convert hex(%s) to oklch', hex)
  vim.notify(msg, vim.log.levels.ERROR, { title = 'Conversion Error' })
end

local function modify_color(hex, f)
  local convert_opts = { adjust_lightness = false }
  local oklch = ColorUtils.convert(hex, 'oklch', convert_opts)

  if not oklch then
    show_conversion_error(hex)
    return hex
  end

  f(oklch)

  local new_hex = ColorUtils.convert(oklch, 'hex', convert_opts)
  return tostring(new_hex)
end

function M.set_hue(hex, hue)
  if not is_valid_hue(hue) then
    show_hue_error(hue)
    return hex
  end

  return modify_color(hex, function(oklch)
    if oklch.h == nil then
      oklch.c = tint
    end
    oklch.h = hue
  end)
end

function M.add_hue(hex, hue)
  if not is_valid_hue(hue) then
    show_hue_error(hue)
    return hex
  end

  return modify_color(hex, function(oklch)
    if oklch.h == nil then
      oklch.c = tint
      oklch.h = 0 -- Starting value for arithmetic operation
    end
    oklch.h = (oklch.h + hue) % 360
  end)
end

function M.zero_chroma(hex)
  return modify_color(hex, function(oklch)
    if oklch.h ~= nil then
      oklch.c = 0
    end
  end)
end

return M
