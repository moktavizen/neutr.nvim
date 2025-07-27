local MiniColors = require('mini.colors')
local config = require('neutr.config')

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

local function modify_hex_oklch(hex, f)
  local convert_opts = { adjust_lightness = false }
  local oklch = MiniColors.convert(hex, 'oklch', convert_opts)

  if not oklch then
    show_conversion_error(hex)
    return hex
  end

  f(oklch)

  local new_hex = MiniColors.convert(oklch, 'hex', convert_opts)
  return tostring(new_hex)
end

local tint = config.opts.tint_strength

function M.set_hue(hex, hue)
  if not is_valid_hue(hue) then
    show_hue_error(hue)
    return hex
  end

  local new_hex = modify_hex_oklch(hex, function(oklch)
    if oklch.h == nil then
      oklch.c = tint
    end
    oklch.h = hue
  end)

  return new_hex
end

function M.add_hue(hex, hue)
  if not is_valid_hue(hue) then
    show_hue_error(hue)
    return hex
  end

  local new_hex = modify_hex_oklch(hex, function(oklch)
    if oklch.h == nil then
      oklch.c = tint
      oklch.h = 0 -- Starting value for arithmetic operation
    end
    oklch.h = (oklch.h + hue) % 360
  end)

  return new_hex
end

function M.zero_chroma(hex)
  local new_hex = modify_hex_oklch(hex, function(oklch)
    if oklch.h ~= nil then
      oklch.c = 0
    end
  end)

  return new_hex
end

return M
