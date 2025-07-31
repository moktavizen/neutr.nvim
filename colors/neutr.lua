local config = require('neutr.config')
local U = require('neutr.util')
local c = require('neutr.palette.dark')

local hue = config.opts.hue
local chroma = config.opts.bg_chroma * 100
local percentage = config.opts.fg_hue_mix

if chroma ~= 0 or percentage ~= 0 then
  for color_name, shades in pairs(c) do
    for shade, hex in pairs(shades) do
      c[color_name][shade] = U.mix_hue(hex, chroma, hue, percentage)
    end
  end
end

-- stylua: ignore
local hl_groups = {
  -- Native TUI
  -- See :h highlight-groups
  Title                            = { fg = c.neutral[50]                              },
  Normal                           = { fg = c.neutral[50],  bg = c.neutral[900]        },
  NormalNC                         = { fg = c.neutral[50],  bg = c.neutral[900]        },
  NormalFloat                      = { fg = c.neutral[100], bg = c.neutral[950]        },
  FloatBorder                      = { fg = c.neutral[400], bg = c.neutral[950]        },
  FloatTitle                       = { fg = c.neutral[50],  bg = c.neutral[950]        },
  ColorColumn                      = { bg = c.neutral[600]                             },
  Conceal                          = { fg = c.neutral[300]                             },
  Cursor                           = { fg = c.neutral[900], bg = c.neutral[50]         },
  lCursor                          = { fg = c.neutral[900], bg = c.neutral[50]         },
  CursorIM                         = { fg = c.neutral[900], bg = c.neutral[50]         },
  CursorColumn                     = { bg = c.neutral[800]                             },
  CursorLine                       = { bg = c.neutral[800]                             },
  Directory                        = { fg = c.neutral[100]                             },
  EndOfBuffer                      = { fg = c.neutral[900]                             },
  TermCursor                       = { fg = c.neutral[900], bg = c.neutral[100]        },
  TermCursorNC                     = { fg = c.neutral[900], bg = c.neutral[200]        },
  VertSplit                        = { fg = c.neutral[400]                             },
  Folded                           = { fg = c.neutral[200], bg = c.neutral[800]        },
  FoldColumn                       = { fg = c.neutral[600]                             },
  SignColumn                       = { fg = c.neutral[600]                             },
  IncSearch                        = { fg = c.neutral[900], bg = c.blue[300]           },
  Search                           = { fg = c.neutral[900], bg = c.yellow[300]         },
  CurSearch                        = { fg = c.neutral[900], bg = c.blue[300]           },
  MatchParen                       = { fg = c.yellow[300],  bg = c.neutral[700]        },
  Substitute                       = { fg = c.neutral[900], bg = c.red[300]            },
  LineNr                           = { fg = c.neutral[500]                             },
  LineNrAbove                      = { link = 'LineNr'                                 },
  LineNrBelow                      = { link = 'LineNr'                                 },
  CursorLineNr                     = { fg = c.neutral[100]                             },
  CursorLineFold                   = { link = 'FoldColumn'                             },
  CursorLineSign                   = { link = 'SignColumn'                             },
  NonText                          = { fg = c.neutral[400]                             },
  SpecialKey                       = { link = 'NonText'                                },
  Pmenu                            = { fg = c.neutral[100], bg = c.neutral[950]        },
  PmenuSel                         = { fg = c.blue[300],    bg = c.blue[950]           },
  PmenuKind                        = { link = 'Pmenu'                                  },
  PmenuKindSel                     = { link = 'PmenuSel'                               },
  PmenuExtra                       = { link = 'Pmenu'                                  },
  PmenuExtraSel                    = { link = 'PmenuSel'                               },
  PmenuSbar                        = { bg = c.neutral[950]                             },
  PmenuThumb                       = { bg = c.neutral[700]                             },
  Question                         = { fg = c.blue[300]                                },
  QuickFixLine                     = { bg = c.neutral[600]                             },
  StatusLine                       = { fg = c.neutral[100], bg = c.neutral[900]        },
  StatusLineNC                     = { fg = c.neutral[600], bg = c.neutral[900]        },
  TabLine                          = { fg = c.neutral[600], bg = c.neutral[950]        },
  TabLineFill                      = { bg = c.neutral[950]                             },
  TabLineSel                       = { link = 'Normal'                                 },
  Visual                           = { bg = c.neutral[700]                             },
  VisualNOS                        = { bg = c.neutral[600]                             },
  ModeMsg                          = { fg = c.neutral[100], bold = true                },
  MsgArea                          = {                                                 },
  MsgSeparator                     = {                                                 },
  MoreMsg                          = { fg = c.blue[300]                                },
  Whitespace                       = { fg = c.neutral[700]                             },
  Winseparator                     = { fg = c.neutral[400]                             },
  WildMenu                         = { bg = c.neutral[600]                             },
  WinBar                           = { fg = c.neutral[100]                             },
  WinBarNC                         = { fg = c.neutral[500]                             },
  SpellBad                         = { sp = c.red[300],     undercurl = true           },
  SpellCap                         = { sp = c.yellow[300],  undercurl = true           },
  SpellLocal                       = { sp = c.blue[300],    undercurl = true           },
  SpellRare                        = { sp = c.green[300],   undercurl = true           },
  ErrorMsg                         = { fg = c.red[300],     bold = true, italic = true },
  WarningMsg                       = { fg = c.yellow[300]                              },
  DiffAdd                          = { bg = c.green[950]                               },
  DiffChange                       = { bg = c.blue[950]                                },
  DiffDelete                       = { bg = c.red[950]                                 },
  DiffText                         = { bg = c.cyan[950]                                },

  -- Native Syntax
  -- See :h group-name
  Comment                          = { fg = c.neutral[200], italic = true              },

  Constant                         = { fg = c.neutral[50]                              },
  String                           = { fg = c.green[300]                               },
  Character                        = { fg = c.cyan[300]                                },
  Number                           = { fg = c.red[300]                                 },
  Boolean                          = { fg = c.red[300]                                 },
  Float                            = { fg = c.red[300]                                 },

  Identifier                       = { fg = c.cyan[300]                                },
  Function                         = { fg = c.cyan[300]                                },

  Statement                        = { fg = c.red[300]                                 },
  Conditional                      = { fg = c.cyan[300]                                },
  Repeat                           = { fg = c.cyan[300]                                },
  Label                            = { fg = c.cyan[300]                                },
  Operator                         = { fg = c.cyan[300]                                },
  Keyword                          = { fg = c.magenta[300]                             },
  Exception                        = { fg = c.red[300]                                 },

  PreProc                          = { fg = c.magenta[300]                             },
  Include                          = { fg = c.cyan[300]                                },
  Define                           = { fg = c.cyan[300]                                },
  Macro                            = { fg = c.blue[300]                                },
  PreCondit                        = { fg = c.blue[300]                                },

  Type                             = { fg = c.magenta[300]                             },
  StorageClass                     = { fg = c.cyan[500]                                },
  Structure                        = { fg = c.cyan[300]                                },
  Typedef                          = { fg = c.red[300]                                 },

  Special                          = { fg = c.cyan[300]                                },
  SpecialChar                      = { fg = c.red[300]                                 },
  Tag                              = { fg = c.red[300]                                 },
  Delimiter                        = { fg = c.cyan[300]                                },
  SpecialComment                   = { fg = c.neutral[200], italic = true              },
  Debug                            = { fg = c.yellow[300]                              },

  Underlined                       = { underline = true                                },
  -- Ignore = {},
  Error                            = { fg = c.red[300],     bg = c.red[950]            },
  Todo                             = { fg = c.cyan[300]                                },
  Noise                            = { fg = c.cyan[300]                                },

  Added                            = { fg = c.green[300]                               },
  Changed                          = { fg = c.blue[300]                                },
  Removed                          = { fg = c.red[300]                                 },

  -- Native LSP
  -- See :h lsp-highlight,
  LspReferenceText                 = { bg = c.neutral[700]                             },
  LspReferenceRead                 = { bg = c.neutral[700]                             },
  LspReferenceWrite                = { bg = c.neutral[700]                             },
  LspCodeLens                      = { fg = c.neutral[500]                             },
  LspCodeLensSeparator             = { link = 'LspCodeLens'                            },
  LspSignatureActiveParameter      = { bg = c.neutral[800], bold = true                },

  -- Native Diagnostic
  -- See :h diagnostic-highlights
  DiagnosticError                  = { fg = c.red[300]                                 },
  DiagnosticWarn                   = { fg = c.yellow[300]                              },
  DiagnosticInfo                   = { fg = c.blue[300]                                },
  DiagnosticHint                   = { fg = c.cyan[300]                                },
  DiagnosticOk                     = { fg = c.green[300]                               },
  DiagnosticVirtualTextError       = { fg = c.red[300],     bg = c.red[950]            },
  DiagnosticVirtualTextWarn        = { fg = c.yellow[300],  bg = c.yellow[950]         },
  DiagnosticVirtualTextInfo        = { fg = c.blue[300],    bg = c.blue[950]           },
  DiagnosticVirtualTextHint        = { fg = c.cyan[300],    bg = c.cyan[950]           },
  DiagnosticVirtualTextOk          = { fg = c.green[300],   bg = c.green[950]          },
  DiagnosticUnderlineError         = { sp = c.red[300],     underline = true           },
  DiagnosticUnderlineWarn          = { sp = c.yellow[300],  underline = true           },
  DiagnosticUnderlineInfo          = { sp = c.blue[300],    underline = true           },
  DiagnosticUnderlineHint          = { sp = c.cyan[300],    underline = true           },
  DiagnosticUnderlineOk            = { sp = c.green[300],   underline = true           },
  DiagnosticFloatingError          = { fg = c.red[300]                                 },
  DiagnosticFloatingWarn           = { fg = c.yellow[300]                              },
  DiagnosticFloatingInfo           = { fg = c.blue[300]                                },
  DiagnosticFloatingHint           = { fg = c.cyan[300]                                },
  DiagnosticFloatingOk             = { fg = c.green[300]                               },
  DiagnosticSignError              = { fg = c.red[300]                                 },
  DiagnosticSignWarn               = { fg = c.yellow[300]                              },
  DiagnosticSignInfo               = { fg = c.blue[300]                                },
  DiagnosticSignHint               = { fg = c.cyan[300]                                },
  DiagnosticSignOk                 = { fg = c.green[300]                               },

  -- Tree-Sitter
  -- See :h treesitter-highlight-groups
  ['@variable']                    = { fg = c.neutral[50]                              },
  ['@variable.builtin']            = { fg = c.cyan[300]                                },
  ['@variable.parameter']          = { fg = c.neutral[50],  italic = true              },
  -- ['@variable.parameter.builtin'] = {},
  ['@variable.member']             = { fg = c.neutral[50]                              },

  ['@constant']                    = { fg = c.neutral[50]                              },
  ['@constant.builtin']            = { fg = c.cyan[300]                                },
  ['@constant.macro']              = { fg = c.blue[300]                                },

  ['@module']                      = { fg = c.yellow[300]                              },
  ['@module.python']               = { fg = c.neutral[50]                              },
  -- ['@module.builtin'] = {},
  ['@label']                       = { fg = c.yellow[300]                              },
  ['@label.markdown']              = { fg = c.green[300]                               },

  ['@string']                      = { fg = c.green[300]                               },
  ['@string.documentation']        = { link = 'Comment'                                },
  ['@string.regexp']               = { fg = c.green[300]                               },
  ['@string.escape']               = { fg = c.neutral[50]                              },
  -- ['@string.special'] = {},
  ['@string.special.symbol']       = { fg = c.cyan[300]                                },
  -- ['@string.special.path'] = {},
  ['@string.special.url']          = { underline = true                                },

  ['@character']                   = { fg = c.neutral[50]                              },
  ['@character.special']           = { fg = c.red[300]                                 },

  ['@boolean']                     = { fg = c.red[300]                                 },
  ['@number']                      = { fg = c.red[300]                                 },
  ['@number.float']                = { fg = c.red[300]                                 },

  ['@type']                        = { fg = c.yellow[300]                              },
  ['@lsp.type.class.markdown']     = { fg = c.green[300]                               },
  ['@type.builtin']                = { fg = c.yellow[300]                              },
  ['@type.builtin.c']              = { fg = c.magenta[300]                             },
  ['@type.builtin.cpp']            = { fg = c.magenta[300]                             },
  ['@type.definition']             = { fg = c.yellow[300]                              },

  ['@attribute']                   = { fg = c.magenta[300]                             },
  ['@attribute.builtin']           = { fg = c.yellow[300]                              },
  ['@property']                    = { fg = c.cyan[500]                                },

  ['@function']                    = { fg = c.blue[300]                                },
  ['@function.builtin']            = { fg = c.blue[300]                                },
  ['@function.call']               = { fg = c.blue[300]                                },
  ['@function.macro']              = { fg = c.blue[300]                                },

  ['@function.method']             = { fg = c.blue[300]                                },
  ['@function.method.call']        = { fg = c.blue[300]                                },

  ['@constructor']                 = { fg = c.magenta[300]                             },
  ['@operator']                    = { fg = c.cyan[300]                                },

  ['@keyword']                     = { fg = c.magenta[300]                             },
  ['@keyword.c']                   = { fg = c.red[300]                                 },
  ['@keyword.cpp']                 = { fg = c.red[300]                                 },
  ['@keyword.coroutine']           = { fg = c.magenta[300]                             },
  ['@keyword.function']            = { fg = c.magenta[300]                             },
  ['@keyword.function.rust']       = { fg = c.red[300]                                 },
  ['@keyword.operator']            = { fg = c.cyan[300]                                },
  ['@keyword.import']              = { fg = c.cyan[300]                                },
  ['@keyword.type']                = { fg = c.magenta[300]                             },
  ['@keyword.modifier']            = { fg = c.magenta[300]                             },
  ['@keyword.repeat']              = { fg = c.cyan[300],    italic = true              },
  ['@keyword.return']              = { fg = c.cyan[300],    italic = true              },
  ['@keyword.debug']               = { fg = c.yellow[300],  italic = true              },
  ['@keyword.exception']           = { fg = c.cyan[300],    italic = true              },

  ['@keyword.conditional']         = { fg = c.cyan[300],    italic = true              },
  ['@keyword.conditional.ternary'] = { fg = c.cyan[300]                                },

  ['@keyword.directive']           = { fg = c.cyan[300],    italic = true              },
  ['@keyword.directive.define']    = { fg = c.cyan[300],    italic = true              },

  ['@punctuation.delimiter']       = { fg = c.cyan[300]                                },
  ['@punctuation.bracket']         = { fg = c.cyan[300]                                },
  ['@punctuation.special']         = { fg = c.cyan[300]                                },

  ['@comment']                     = { link = 'Comment'                                },
  ['@comment.documentation']       = { link = 'Comment'                                },

  ['@comment.error']               = { fg = c.red[300]                                 },
  ['@comment.warning']             = { fg = c.yellow[300]                              },
  ['@comment.todo']                = { fg = c.blue[300]                                },
  ['@comment.note']                = { fg = c.cyan[300]                                },

  ['@markup.strong']               = { fg = c.red[300],     bold = true                },
  ['@markup.italic']               = { fg = c.red[300],     italic = true              },
  ['@markup.strikethrough']        = { fg = c.neutral[50],  strikethrough = true       },
  ['@markup.underline']            = { link = 'Underlined'                             },

  ['@markup.heading']              = { fg = c.neutral[50]                              },
  ['@markup.heading.1']            = { fg = c.neutral[50]                              },
  ['@markup.heading.2']            = { fg = c.neutral[50]                              },
  ['@markup.heading.3']            = { fg = c.neutral[50]                              },
  ['@markup.heading.4']            = { fg = c.neutral[50]                              },
  ['@markup.heading.5']            = { fg = c.neutral[50]                              },
  ['@markup.heading.6']            = { fg = c.neutral[50]                              },
  ['@markup.heading.markdown']     = { fg = c.yellow[300]                              },
  ['@markup.heading.1.markdown']   = { fg = c.yellow[300]                              },
  ['@markup.heading.2.markdown']   = { fg = c.yellow[300]                              },
  ['@markup.heading.3.markdown']   = { fg = c.yellow[300]                              },
  ['@markup.heading.4.markdown']   = { fg = c.yellow[300]                              },
  ['@markup.heading.5.markdown']   = { fg = c.yellow[300]                              },
  ['@markup.heading.6.markdown']   = { fg = c.yellow[300]                              },

  ['@markup.quote']                = { fg = c.cyan[300],    italic = true              },
  ['@markup.math']                 = { fg = c.blue[300]                                },

  ['@markup.link']                 = { fg = c.cyan[300]                                },
  ['@markup.link.label']           = { fg = c.green[300]                               },
  ['@markup.link.url']             = { fg = c.red[300]                                 },

  ['@markup.raw']                  = { fg = c.neutral[50]                              },
  ['@markup.raw.markdown_inline']  = { fg = c.green[300]                               },
  ['@markup.raw.block']            = { fg = c.neutral[100]                             },

  ['@markup.list']                 = { fg = c.cyan[300]                                },
  ['@markup.list.checked']         = { fg = c.green[300]                               },
  ['@markup.list.unchecked']       = { fg = c.blue[300]                                },

  ['@diff.plus']                   = { fg = c.green[300]                               },
  ['@diff.minus']                  = { fg = c.red[300]                                 },
  ['@diff.delta']                  = { fg = c.blue[300]                                },

  ['@tag']                         = { fg = c.red[300]                                 },
  -- ['@tag.builtin'] = {},
  ['@tag.attribute']               = { fg = c.magenta[300]                             },
  ['@tag.delimiter']               = { fg = c.cyan[300]                                },

  -- Plugins
  -- See :h [plugin-name]

  -- gitsigns
  GitSignsAdd                      = { fg = c.green[300]                               },
  GitSignsChange                   = { fg = c.blue[300]                                },
  GitSignsDelete                   = { fg = c.red[300]                                 },

  -- snacks
  SnacksIndentScope                = { fg = c.neutral[500]                             },
  SnacksDashboardHeader            = { fg = c.neutral[50]                              },
  SnacksDashboardDesc              = { fg = c.magenta[300]                             },
  SnacksDashboardIcon              = { fg = c.red[300]                                 },
  SnacksDashboardKey               = { fg = c.blue[300]                                },
  SnacksDashboardFooter            = { fg = c.yellow[300]                              },
  SnacksDashboardSpecial           = { fg = c.yellow[300]                              },
  SnacksPickerDir                  = { fg = c.neutral[300]                             },
  SnacksPickerTotals               = { fg = c.neutral[300]                             },
  SnacksPickerBufFlags             = { fg = c.neutral[300]                             },
  SnacksPickerKeymapRhs            = { fg = c.neutral[300]                             },
  SnacksPickerMatch                = { fg = c.yellow[300]                              },

  -- nvim-tree
  NvimTreeRootFolder               = { fg = c.neutral[100], bold = true                },
  NvimTreeWinSeparator             = { fg = c.neutral[950], bg = c.neutral[950]        },
  NvimTreeNormal                   = { fg = c.neutral[100], bg = c.neutral[950]        },
  NvimTreeCursorLine               = { fg = c.blue[300],    bg = c.blue[950]           },

  -- neo-tree
  NeoTreeRootName                  = { fg = c.neutral[100], bold = true                },
  NeoTreeWinSeparator              = { fg = c.neutral[950], bg = c.neutral[950]        },
  NeoTreeNormal                    = { fg = c.neutral[100], bg = c.neutral[950]        },
  NeoTreeCursorLine                = { fg = c.blue[300],    bg = c.blue[950]           },

  -- bufferline
  BufferLineFill                   = { bg = c.neutral[900]                             },
  BufferLineOffset                 = { fg = c.neutral[50],  bg = c.neutral[950]        },
  BufferlineOffsetSeparator        = { fg = c.neutral[950], bg = c.neutral[950]        },

  -- fzf-lua
  FzfLuaNormal                     = { fg = c.neutral[100], bg = c.neutral[950]        },
  FzfLuaPreviewNormal              = { fg = c.neutral[100], bg = c.neutral[950]        },
  FzfLuaBorder                     = { fg = c.neutral[400], bg = c.neutral[950]        },
  FzfLuaHeaderText                 = { fg = c.red[300]                                 },
  FzfLuaBufFlagCur                 = { fg = c.red[300]                                 },
  FzfLuaLiveSym                    = { fg = c.red[300]                                 },
  FzfLuaHeaderBind                 = { fg = c.yellow[300]                              },
  FzfLuaBufNr                      = { fg = c.yellow[300]                              },
  FzfLuaTabMarker                  = { fg = c.yellow[300]                              },
  FzfLuaPathLineNr                 = { fg = c.green[300]                               },
  FzfLuaBufFlagAlt                 = { fg = c.cyan[300]                                },
  FzfLuaPathColNr                  = { fg = c.cyan[300]                                },
  FzfLuaTabTitle                   = { fg = c.blue[300]                                },
  FzfLuaBufName                    = { fg = c.magenta[300]                             },

  -- noice
  NoiceMini                        = { bg = c.neutral[950]                             },

  -- mini.statusline
  MiniStatuslineModeNormal         = { fg = c.neutral[900], bg = c.blue[300],    bold=true },
  MiniStatuslineModeInsert         = { fg = c.neutral[900], bg = c.green[300],   bold=true },
  MiniStatuslineModeVisual         = { fg = c.neutral[900], bg = c.magenta[300], bold=true },
  MiniStatuslineModeCommand        = { fg = c.neutral[900], bg = c.cyan[300],    bold=true },
  MiniStatuslineModeDelete         = { fg = c.neutral[900], bg = c.red[300],     bold=true },
  MiniStatuslineModeOther          = { fg = c.neutral[900], bg = c.yellow[300],  bold=true },
  MiniStatuslineDevinfo            = { fg = c.neutral[50],  bg = c.neutral[700]            },
  MiniStatuslineFileinfo           = { link = 'MiniStatuslineDevinfo'                      },
  MiniStatuslineFilename           = { fg = c.neutral[300], bg = c.neutral[900]            },
  MiniStatuslineInactive           = { link = 'MiniStatuslineFilename'                     },
}

if vim.g.colors_name then
  vim.cmd('hi clear')
end

vim.o.termguicolors = true
vim.g.colors_name = 'neutr'

for group, hl in pairs(hl_groups) do
  vim.api.nvim_set_hl(0, group, hl)
end

-- mini.git
vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniGitUpdated',
  callback = function(data)
    local summary = vim.b[data.buf].minigit_summary
    vim.b[data.buf].minigit_summary_string = summary.head_name or ''
  end,
})
