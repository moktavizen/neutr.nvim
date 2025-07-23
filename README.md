# neutr.nvim

Neovim theme with neutral background color.

## Installation

[lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
return {
  'moktavizen/neutr.nvim',
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'neutr'
  end,
}
```
