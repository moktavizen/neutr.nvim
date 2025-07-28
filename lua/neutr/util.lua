local MiniColors = require('mini.colors')

local M = {}

local function convert(x, to_space)
  local convert_opts = {
    -- Don't adjust lightness, just like CSS
    adjust_lightness = false,
  }
  return MiniColors.convert(x, to_space, convert_opts)
end

local function show_conversion_error(color)
  local msg = string.format('Failed to convert color (%s)', color)
  vim.notify(msg, vim.log.levels.ERROR, { title = 'Conversion Error' })
end

local function color_mod_oklch(color, f)
  local oklch = convert(color, 'oklch')
  if not oklch then
    show_conversion_error(color)
    return color
  end

  local modified_color = f(oklch)

  local new_hex = convert(modified_color, 'hex')
  return tostring(new_hex)
end

local function color_mix_oklab(color_1, color_2, percentage)
  local ratio = percentage / 100

  local oklab_1 = convert(color_1, 'oklab')
  local oklab_2 = convert(color_2, 'oklab')

  if not oklab_1 or not oklab_2 then
    show_conversion_error(color_1)
    return color_1
  end

  local mixed_oklab = {
    l = oklab_1.l * (1 - ratio) + oklab_2.l * ratio,
    a = oklab_1.a * (1 - ratio) + oklab_2.a * ratio,
    b = oklab_1.b * (1 - ratio) + oklab_2.b * ratio,
  }
  return mixed_oklab
end

local function is_valid_hue(hue)
  return type(hue) == 'number' and (0 <= hue and hue <= 360)
end

local function show_hue_error(hue)
  local msg = string.format('Hue(%s) must be a number (0 <= hue <= 360)', hue)
  vim.notify(msg, vim.log.levels.ERROR, { title = 'Hue Error' })
end

function M.mix_hue(hex, chroma, hue, percentage)
  if not is_valid_hue(hue) then
    show_hue_error(hue)
    return hex
  end

  local new_hex = color_mod_oklch(hex, function(oklch)
    if oklch.h == nil then
      oklch.c = chroma
      oklch.h = hue
      return oklch
    else
      local target_oklch = { l = oklch.l, c = oklch.c, h = hue }
      return color_mix_oklab(oklch, target_oklch, percentage)
    end
  end)

  return new_hex
end

function M.set_lightness(hex, lightness)
  local new_hex = color_mod_oklch(hex, function(oklch)
    oklch.l = lightness
    return oklch
  end)

  return new_hex
end

function M.dim(hex)
  local new_hex = color_mod_oklch(hex, function(oklch)
    oklch.l = 30
    oklch.c = 2
    return oklch
  end)

  return new_hex
end

function M.pale(hex)
  local new_hex = color_mod_oklch(hex, function(oklch)
    oklch.c = oklch.c * 0.33
    return oklch
  end)

  return new_hex
end

return M
