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
  Title                            = { fg = c.neutral.s50                                   },
  Normal                           = { fg = c.neutral.s50,  bg = c.neutral.s900             },
  NormalNC                         = { fg = c.neutral.s50,  bg = c.neutral.s900             },
  NormalFloat                      = { fg = c.neutral.s100, bg = c.neutral.s950             },
  FloatBorder                      = { fg = c.neutral.s400, bg = c.neutral.s950             },
  FloatTitle                       = { fg = c.neutral.s50,  bg = c.neutral.s950             },
  ColorColumn                      = { bg = c.neutral.s600                                  },
  Conceal                          = { fg = c.neutral.s300                                  },
  Cursor                           = { fg = c.neutral.s900, bg = c.neutral.s50              },
  lCursor                          = { fg = c.neutral.s900, bg = c.neutral.s50              },
  CursorIM                         = { fg = c.neutral.s900, bg = c.neutral.s50              },
  CursorColumn                     = { bg = c.neutral.s800                                  },
  CursorLine                       = { bg = c.neutral.s800                                  },
  Directory                        = { fg = c.neutral.s100                                  },
  EndOfBuffer                      = { fg = c.neutral.s900                                  },
  TermCursor                       = { fg = c.neutral.s900, bg = c.neutral.s100             },
  TermCursorNC                     = { fg = c.neutral.s900, bg = c.neutral.s200             },
  VertSplit                        = { fg = c.neutral.s400                                  },
  Folded                           = { fg = c.neutral.s200, bg = c.neutral.s800             },
  FoldColumn                       = { fg = c.neutral.s600                                  },
  SignColumn                       = { fg = c.neutral.s600                                  },
  IncSearch                        = { fg = c.neutral.s900, bg = c.yellow.s300              },
  Search                           = { fg = c.neutral.s900, bg = c.green.s300               },
  CurSearch                        = { fg = c.neutral.s900, bg = c.blue.s300                },
  MatchParen                       = { fg = c.yellow.s300,  bg = c.neutral.s700             },
  Substitute                       = { fg = c.neutral.s900, bg = c.blue.s300,   bold = true },
  LineNr                           = { fg = c.neutral.s500                                  },
  LineNrAbove                      = { link = 'LineNr'                                      },
  LineNrBelow                      = { link = 'LineNr'                                      },
  CursorLineNr                     = { fg = c.neutral.s100                                  },
  CursorLineFold                   = { link = 'FoldColumn'                                  },
  CursorLineSign                   = { link = 'SignColumn'                                  },
  NonText                          = { fg = c.neutral.s300                                  },
  SpecialKey                       = { link = 'NonText'                                     },
  Pmenu                            = { fg = c.neutral.s100, bg = c.neutral.s950             },
  PmenuSel                         = { fg = c.blue.s300,    bg = c.blue.s800                },
  PmenuKind                        = { link = 'Pmenu'                                       },
  PmenuKindSel                     = { link = 'PmenuSel'                                    },
  PmenuExtra                       = { link = 'Pmenu'                                       },
  PmenuExtraSel                    = { link = 'PmenuSel'                                    },
  PmenuSbar                        = { bg = c.neutral.s950                                  },
  PmenuThumb                       = { bg = c.neutral.s700                                  },
  Question                         = { fg = c.blue.s300                                     },
  QuickFixLine                     = { bg = c.neutral.s600                                  },
  StatusLine                       = { fg = c.neutral.s200, bg = c.neutral.s900             },
  StatusLineNC                     = { fg = c.neutral.s600, bg = c.neutral.s900             },
  TabLine                          = { fg = c.neutral.s200, bg = c.neutral.s900             },
  TabLineFill                      = { bg = c.neutral.s900                                  },
  TabLineSel                       = { link = 'Normal'                                      },
  Visual                           = { bg = c.neutral.s700                                  },
  VisualNOS                        = { bg = c.neutral.s600                                  },
  ModeMsg                          = { fg = c.neutral.s100, bold = true                     },
  MsgArea                          = {                                                      },
  MsgSeparator                     = {                                                      },
  MoreMsg                          = { fg = c.blue.s300                                     },
  Whitespace                       = { fg = c.neutral.s700                                  },
  Winseparator                     = { fg = c.neutral.s400                                  },
  WildMenu                         = { bg = c.neutral.s600                                  },
  WinBar                           = { fg = c.neutral.s100                                  },
  WinBarNC                         = { fg = c.neutral.s500                                  },
  SpellBad                         = { sp = c.red.s300,     undercurl = true                },
  SpellCap                         = { sp = c.yellow.s300,  undercurl = true                },
  SpellLocal                       = { sp = c.blue.s300,    undercurl = true                },
  SpellRare                        = { sp = c.green.s300,   undercurl = true                },
  ErrorMsg                         = { fg = c.red.s300,     bold = true, italic = true      },
  WarningMsg                       = { fg = c.yellow.s300                                   },
  DiffAdd                          = { bg = c.green.s800                                    },
  DiffChange                       = { bg = c.blue.s800                                     },
  DiffDelete                       = { bg = c.red.s800                                      },
  DiffText                         = { bg = c.cyan.s800                                     },

  -- Native Syntax
  -- See :h group-name
  Comment                          = { fg = c.neutral.s200, italic = true                   },

  Constant                         = { fg = c.neutral.s50                                   },
  String                           = { fg = c.green.s300                                    },
  Character                        = { fg = c.cyan.s300                                     },
  Number                           = { fg = c.red.s300                                      },
  Boolean                          = { fg = c.red.s300                                      },
  Float                            = { fg = c.red.s300                                      },

  Identifier                       = { fg = c.cyan.s300                                     },
  Function                         = { fg = c.cyan.s300                                     },

  Statement                        = { fg = c.red.s300                                      },
  Conditional                      = { fg = c.cyan.s300                                     },
  Repeat                           = { fg = c.cyan.s300                                     },
  Label                            = { fg = c.cyan.s300                                     },
  Operator                         = { fg = c.cyan.s300                                     },
  Keyword                          = { fg = c.magenta.s300                                  },
  Exception                        = { fg = c.red.s300                                      },

  PreProc                          = { fg = c.magenta.s300                                  },
  Include                          = { fg = c.cyan.s300                                     },
  Define                           = { fg = c.cyan.s300                                     },
  Macro                            = { fg = c.blue.s300                                     },
  PreCondit                        = { fg = c.blue.s300                                     },

  Type                             = { fg = c.magenta.s300                                  },
  StorageClass                     = { fg = c.cyan.s500                                     },
  Structure                        = { fg = c.cyan.s300                                     },
  Typedef                          = { fg = c.red.s300                                      },

  Special                          = { fg = c.cyan.s300                                     },
  SpecialChar                      = { fg = c.red.s300                                      },
  Tag                              = { fg = c.red.s300                                      },
  Delimiter                        = { fg = c.cyan.s300                                     },
  SpecialComment                   = { fg = c.neutral.s200, italic = true                   },
  Debug                            = { fg = c.yellow.s300                                   },

  Underlined                       = { underline = true                                     },
  -- Ignore = {},
  Error                            = { fg = c.red.s300,     bg = c.red.s800                 },
  Todo                             = { fg = c.cyan.s300                                     },
  Noise                            = { fg = c.cyan.s300                                     },

  Added                            = { fg = c.green.s300                                    },
  Changed                          = { fg = c.blue.s300                                     },
  Removed                          = { fg = c.red.s300                                      },

  -- Native LSP
  -- See :h lsp-highlight,
  LspReferenceText                 = { bg = c.neutral.s700                                  },
  LspReferenceRead                 = { bg = c.neutral.s700                                  },
  LspReferenceWrite                = { bg = c.neutral.s700                                  },
  LspCodeLens                      = { fg = c.neutral.s500                                  },
  LspCodeLensSeparator             = { link = 'LspCodeLens'                                 },
  LspSignatureActiveParameter      = { bg = c.neutral.s800, bold = true                     },

  -- Native Diagnostic
  -- See :h diagnostic-highlights
  DiagnosticError                  = { fg = c.red.s300                                      },
  DiagnosticWarn                   = { fg = c.yellow.s300                                   },
  DiagnosticInfo                   = { fg = c.blue.s300                                     },
  DiagnosticHint                   = { fg = c.cyan.s300                                     },
  DiagnosticOk                     = { fg = c.green.s300                                    },
  DiagnosticVirtualTextError       = { fg = c.red.s300,     bg = c.red.s800                 },
  DiagnosticVirtualTextWarn        = { fg = c.yellow.s300,  bg = c.yellow.s800              },
  DiagnosticVirtualTextInfo        = { fg = c.blue.s300,    bg = c.blue.s800                },
  DiagnosticVirtualTextHint        = { fg = c.cyan.s300,    bg = c.cyan.s800                },
  DiagnosticVirtualTextOk          = { fg = c.green.s300,   bg = c.green.s800               },
  DiagnosticUnderlineError         = { sp = c.red.s300,     underline = true                },
  DiagnosticUnderlineWarn          = { sp = c.yellow.s300,  underline = true                },
  DiagnosticUnderlineInfo          = { sp = c.blue.s300,    underline = true                },
  DiagnosticUnderlineHint          = { sp = c.cyan.s300,    underline = true                },
  DiagnosticUnderlineOk            = { sp = c.green.s300,   underline = true                },
  DiagnosticFloatingError          = { fg = c.red.s300,     bg = c.neutral.s950             },
  DiagnosticFloatingWarn           = { fg = c.yellow.s300,  bg = c.neutral.s950             },
  DiagnosticFloatingInfo           = { fg = c.blue.s300,    bg = c.neutral.s950             },
  DiagnosticFloatingHint           = { fg = c.cyan.s300,    bg = c.neutral.s950             },
  DiagnosticFloatingOk             = { fg = c.green.s300,   bg = c.neutral.s950             },
  DiagnosticSignError              = { fg = c.red.s300                                      },
  DiagnosticSignWarn               = { fg = c.yellow.s300                                   },
  DiagnosticSignInfo               = { fg = c.blue.s300                                     },
  DiagnosticSignHint               = { fg = c.cyan.s300                                     },
  DiagnosticSignOk                 = { fg = c.green.s300                                    },

  -- Tree-Sitter
  -- See :h treesitter-highlight-groups
  ['@variable']                    = { fg = c.neutral.s50                                   },
  ['@variable.builtin']            = { fg = c.cyan.s300                                     },
  ['@variable.parameter']          = { fg = c.neutral.s50,  italic = true                   },
  -- ['@variable.parameter.builtin'] = {},
  ['@variable.member']             = { fg = c.neutral.s50                                   },

  ['@constant']                    = { fg = c.neutral.s50                                   },
  ['@constant.builtin']            = { fg = c.cyan.s300                                     },
  ['@constant.macro']              = { fg = c.blue.s300                                     },

  ['@module']                      = { fg = c.yellow.s300                                   },
  ['@module.python']               = { fg = c.neutral.s50                                   },
  -- ['@module.builtin'] = {},
  ['@label']                       = { fg = c.yellow.s300                                   },
  ['@label.markdown']              = { fg = c.green.s300                                    },

  ['@string']                      = { fg = c.green.s300                                    },
  ['@string.documentation']        = { link = 'Comment'                                     },
  ['@string.regexp']               = { fg = c.green.s300                                    },
  ['@string.escape']               = { fg = c.neutral.s50                                   },
  -- ['@string.special'] = {},
  ['@string.special.symbol']       = { fg = c.cyan.s300                                     },
  -- ['@string.special.path'] = {},
  ['@string.special.url']          = { underline = true                                     },

  ['@character']                   = { fg = c.neutral.s50                                   },
  ['@character.special']           = { fg = c.red.s300                                      },

  ['@boolean']                     = { fg = c.red.s300                                      },
  ['@number']                      = { fg = c.red.s300                                      },
  ['@number.float']                = { fg = c.red.s300                                      },

  ['@type']                        = { fg = c.yellow.s300                                   },
  ['@lsp.type.class.markdown']     = { fg = c.green.s300                                    },
  ['@type.builtin']                = { fg = c.yellow.s300                                   },
  ['@type.builtin.c']              = { fg = c.magenta.s300                                  },
  ['@type.builtin.cpp']            = { fg = c.magenta.s300                                  },
  ['@type.definition']             = { fg = c.yellow.s300                                   },

  ['@attribute']                   = { fg = c.magenta.s300                                  },
  ['@attribute.builtin']           = { fg = c.yellow.s300                                   },
  ['@property']                    = { fg = c.cyan.s500                                     },

  ['@function']                    = { fg = c.blue.s300                                     },
  ['@function.builtin']            = { fg = c.blue.s300                                     },
  ['@function.call']               = { fg = c.blue.s300                                     },
  ['@function.macro']              = { fg = c.blue.s300                                     },

  ['@function.method']             = { fg = c.blue.s300                                     },
  ['@function.method.call']        = { fg = c.blue.s300                                     },

  ['@constructor']                 = { fg = c.magenta.s300                                  },
  ['@operator']                    = { fg = c.cyan.s300                                     },

  ['@keyword']                     = { fg = c.magenta.s300                                  },
  ['@keyword.c']                   = { fg = c.red.s300                                      },
  ['@keyword.cpp']                 = { fg = c.red.s300                                      },
  ['@keyword.coroutine']           = { fg = c.magenta.s300                                  },
  ['@keyword.function']            = { fg = c.magenta.s300                                  },
  ['@keyword.function.rust']       = { fg = c.red.s300                                      },
  ['@keyword.operator']            = { fg = c.cyan.s300                                     },
  ['@keyword.import']              = { fg = c.cyan.s300                                     },
  ['@keyword.type']                = { fg = c.magenta.s300                                  },
  ['@keyword.modifier']            = { fg = c.magenta.s300                                  },
  ['@keyword.repeat']              = { fg = c.cyan.s300,    italic = true                   },
  ['@keyword.return']              = { fg = c.cyan.s300,    italic = true                   },
  ['@keyword.debug']               = { fg = c.yellow.s300,  italic = true                   },
  ['@keyword.exception']           = { fg = c.cyan.s300,    italic = true                   },

  ['@keyword.conditional']         = { fg = c.cyan.s300,    italic = true                   },
  ['@keyword.conditional.ternary'] = { fg = c.cyan.s300                                     },

  ['@keyword.directive']           = { fg = c.cyan.s300,    italic = true                   },
  ['@keyword.directive.define']    = { fg = c.cyan.s300,    italic = true                   },

  ['@punctuation.delimiter']       = { fg = c.cyan.s300                                     },
  ['@punctuation.bracket']         = { fg = c.cyan.s300                                     },
  ['@punctuation.special']         = { fg = c.cyan.s300                                     },

  ['@comment']                     = { link = 'Comment'                                     },
  ['@comment.documentation']       = { link = 'Comment'                                     },

  ['@comment.error']               = { fg = c.red.s300                                      },
  ['@comment.warning']             = { fg = c.yellow.s300                                   },
  ['@comment.todo']                = { fg = c.blue.s300                                     },
  ['@comment.note']                = { fg = c.cyan.s300                                     },

  ['@markup.strong']               = { fg = c.red.s300,     bold = true                     },
  ['@markup.italic']               = { fg = c.red.s300,     italic = true                   },
  ['@markup.strikethrough']        = { fg = c.neutral.s50,  strikethrough = true            },
  ['@markup.underline']            = { link = 'Underlined'                                  },

  ['@markup.heading']              = { fg = c.neutral.s50                                   },
  ['@markup.heading.1']            = { fg = c.neutral.s50                                   },
  ['@markup.heading.2']            = { fg = c.neutral.s50                                   },
  ['@markup.heading.3']            = { fg = c.neutral.s50                                   },
  ['@markup.heading.4']            = { fg = c.neutral.s50                                   },
  ['@markup.heading.5']            = { fg = c.neutral.s50                                   },
  ['@markup.heading.6']            = { fg = c.neutral.s50                                   },
  ['@markup.heading.markdown']     = { fg = c.yellow.s300                                   },
  ['@markup.heading.1.markdown']   = { fg = c.yellow.s300                                   },
  ['@markup.heading.2.markdown']   = { fg = c.yellow.s300                                   },
  ['@markup.heading.3.markdown']   = { fg = c.yellow.s300                                   },
  ['@markup.heading.4.markdown']   = { fg = c.yellow.s300                                   },
  ['@markup.heading.5.markdown']   = { fg = c.yellow.s300                                   },
  ['@markup.heading.6.markdown']   = { fg = c.yellow.s300                                   },

  ['@markup.quote']                = { fg = c.cyan.s300,    italic = true                   },
  ['@markup.math']                 = { fg = c.blue.s300                                     },

  ['@markup.link']                 = { fg = c.cyan.s300                                     },
  ['@markup.link.label']           = { fg = c.green.s300                                    },
  ['@markup.link.url']             = { fg = c.red.s300                                      },

  ['@markup.raw']                  = { fg = c.neutral.s50                                   },
  ['@markup.raw.markdown_inline']  = { fg = c.green.s300                                    },
  ['@markup.raw.block']            = { fg = c.neutral.s100                                  },

  ['@markup.list']                 = { fg = c.cyan.s300                                     },
  ['@markup.list.checked']         = { fg = c.green.s300                                    },
  ['@markup.list.unchecked']       = { fg = c.blue.s300                                     },

  ['@diff.plus']                   = { fg = c.green.s300                                    },
  ['@diff.minus']                  = { fg = c.red.s300                                      },
  ['@diff.delta']                  = { fg = c.blue.s300                                     },

  ['@tag']                         = { fg = c.red.s300                                      },
  -- ['@tag.builtin'] = {},
  ['@tag.attribute']               = { fg = c.magenta.s300                                  },
  ['@tag.delimiter']               = { fg = c.cyan.s300                                     },

  -- Plugins
  -- See :h .splugin-name

  -- gitsigns
  GitSignsAdd                      = { fg = c.green.s300                                    },
  GitSignsChange                   = { fg = c.blue.s300                                     },
  GitSignsDelete                   = { fg = c.red.s300                                      },

  -- snacks
  SnacksIndentScope                = { fg = c.neutral.s500                                  },
  SnacksDashboardHeader            = { fg = c.neutral.s50                                   },
  SnacksDashboardDesc              = { fg = c.magenta.s300                                  },
  SnacksDashboardIcon              = { fg = c.red.s300                                      },
  SnacksDashboardKey               = { fg = c.blue.s300                                     },
  SnacksDashboardFooter            = { fg = c.yellow.s300                                   },
  SnacksDashboardSpecial           = { fg = c.yellow.s300                                   },
  SnacksPickerDir                  = { fg = c.neutral.s300                                  },
  SnacksPickerTotals               = { fg = c.neutral.s300                                  },
  SnacksPickerBufFlags             = { fg = c.neutral.s300                                  },
  SnacksPickerKeymapRhs            = { fg = c.neutral.s300                                  },
  SnacksPickerMatch                = { fg = c.yellow.s300                                   },

  -- nvim-tree
  NvimTreeRootFolder               = { fg = c.neutral.s100, bold = true                     },
  NvimTreeWinSeparator             = { fg = c.neutral.s950, bg = c.neutral.s950             },
  NvimTreeNormal                   = { fg = c.neutral.s100, bg = c.neutral.s950             },
  NvimTreeCursorLine               = { fg = c.blue.s300,    bg = c.blue.s800                },

  -- neo-tree
  NeoTreeRootName                  = { fg = c.neutral.s100, bold = true                     },
  NeoTreeWinSeparator              = { fg = c.neutral.s950, bg = c.neutral.s950             },
  NeoTreeNormal                    = { fg = c.neutral.s100, bg = c.neutral.s950             },
  NeoTreeCursorLine                = { fg = c.blue.s300,    bg = c.blue.s800                },

  -- bufferline
  BufferLineFill                   = { bg = c.neutral.s900                                  },
  BufferLineOffset                 = { fg = c.neutral.s50,  bg = c.neutral.s950             },
  BufferlineOffsetSeparator        = { fg = c.neutral.s950, bg = c.neutral.s950             },

  -- fzf-lua
  FzfLuaNormal                     = { fg = c.neutral.s100, bg = c.neutral.s950             },
  FzfLuaPreviewNormal              = { fg = c.neutral.s100, bg = c.neutral.s950             },
  FzfLuaBorder                     = { fg = c.neutral.s400, bg = c.neutral.s950             },
  FzfLuaHeaderText                 = { fg = c.red.s300                                      },
  FzfLuaBufFlagCur                 = { fg = c.red.s300                                      },
  FzfLuaLiveSym                    = { fg = c.red.s300                                      },
  FzfLuaHeaderBind                 = { fg = c.yellow.s300                                   },
  FzfLuaBufNr                      = { fg = c.yellow.s300                                   },
  FzfLuaTabMarker                  = { fg = c.yellow.s300                                   },
  FzfLuaPathLineNr                 = { fg = c.green.s300                                    },
  FzfLuaBufFlagAlt                 = { fg = c.cyan.s300                                     },
  FzfLuaPathColNr                  = { fg = c.cyan.s300                                     },
  FzfLuaTabTitle                   = { fg = c.blue.s300                                     },
  FzfLuaBufName                    = { fg = c.magenta.s300                                  },

  -- noice
  NoiceMini                        = { bg = c.neutral.s950                                  },

  -- mini.statusline
  MiniStatuslineModeNormal         = { fg = c.blue.s300,    bg=c.neutral.s900, bold=true    },
  MiniStatuslineModeInsert         = { fg = c.green.s300,   bg=c.neutral.s900, bold=true    },
  MiniStatuslineModeVisual         = { fg = c.magenta.s300, bg=c.neutral.s900, bold=true    },
  MiniStatuslineModeCommand        = { fg = c.cyan.s300,    bg=c.neutral.s900, bold=true    },
  MiniStatuslineModeDelete         = { fg = c.red.s300,     bg=c.neutral.s900, bold=true    },
  MiniStatuslineModeOther          = { fg = c.yellow.s300,  bg=c.neutral.s900, bold=true    },
  MiniStatuslineDevinfo            = { fg = c.neutral.s50,  bg=c.neutral.s900, bold=true    },
  MiniStatuslineFileinfo           = { link = 'MiniStatuslineDevinfo'                       },
  MiniStatuslineFilename           = { fg = c.neutral.s200,bg=c.neutral.s900, bold=true     },
  MiniStatuslineInactive           = { link = 'StatusLineNC'                                },

  -- mini.diff
  MiniDiffSignAdd                  = { fg = c.green.s500                                    },
  MiniDiffSignChange               = { fg = c.blue.s500                                     },
  MiniDiffSignDelete               = { fg = c.red.s500                                      },

  -- mini.icons
  MiniIconsRed                     = { fg = c.red.s300                                      },
  MiniIconsGreen                   = { fg = c.green.s300                                    },
  MiniIconsYellow                  = { fg = c.yellow.s300                                   },
  MiniIconsBlue                    = { fg = c.blue.s300                                     },
  MiniIconsPurple                  = { fg = c.magenta.s300                                  },
  MiniIconsCyan                    = { fg = c.cyan.s300                                     },
  MiniIconsGrey                    = { fg = c.neutral.s100                                  },
  MiniIconsOrange                  = { fg = c.yellow.s300                                   },
  MiniIconsAzure                   = { fg = c.blue.s300                                     },

  -- whichkey
  WhichKeyIconRed                  = { link = 'MiniIconsRed'                                },
  WhichKeyIconGreen                = { link = 'MiniIconsGreen'                              },
  WhichKeyIconYellow               = { link = 'MiniIconsYellow'                             },
  WhichKeyIconBlue                 = { link = 'MiniIconsBlue'                               },
  WhichKeyIconPurple               = { link = 'MiniIconsPurple'                             },
  WhichKeyIconCyan                 = { link = 'MiniIconsCyan'                               },
  WhichKeyIconGrey                 = { link = 'MiniIconsGrey'                               },
  WhichKeyIconOrange               = { link = 'MiniIconsOrange'                             },
  WhichKeyIconAzure                = { link = 'MiniIconsAzure'                              },
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
