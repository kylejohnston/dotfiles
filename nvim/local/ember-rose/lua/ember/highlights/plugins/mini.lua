local M = {}

M.get = function(theme)
  return {
    -- Statusline modes
    MiniStatuslineModeNormal = { fg = theme.ui.bg, bg = theme.syn.coral, bold = true },
    MiniStatuslineModeInsert = { fg = theme.ui.bg, bg = theme.syn.olive, bold = true },
    MiniStatuslineModeVisual = { fg = theme.ui.bg, bg = theme.syn.gold, bold = true },
    MiniStatuslineModeReplace = { fg = theme.ui.bg, bg = theme.syn.rose, bold = true },
    MiniStatuslineModeCommand = { fg = theme.ui.bg, bg = theme.syn.orange, bold = true },
    MiniStatuslineModeOther = { fg = theme.ui.bg, bg = theme.syn.steel, bold = true },

    -- Statusline sections
    MiniStatuslineFilename = { fg = theme.ui.fg_alt },
    MiniStatuslineFileinfo = { fg = theme.ui.fg_alt },
    MiniStatuslineDevinfo = { fg = theme.ui.fg_alt, bg = theme.ui.base2 },
    MiniStatuslineInactive = { fg = theme.ui.base5, bg = theme.ui.base1 },

    -- Tabline
    MiniTablineCurrent = { fg = theme.syn.coral, bg = theme.ui.bg, bold = true },
    MiniTablineVisible = { fg = theme.ui.fg_alt, bg = theme.ui.base2 },
    MiniTablineHidden = { fg = theme.ui.base5, bg = theme.ui.base1 },
    MiniTablineModifiedCurrent = { fg = theme.syn.coral, bg = theme.ui.bg, bold = true, italic = true },
    MiniTablineModifiedVisible = { fg = theme.ui.fg_alt, bg = theme.ui.base2, italic = true },
    MiniTablineModifiedHidden = { fg = theme.ui.base5, bg = theme.ui.base1, italic = true },
    MiniTablineFill = { bg = theme.ui.base0 },
    MiniTablineTabpagesection = { fg = theme.syn.coral, bg = theme.ui.base2, bold = true },

    -- Cursorword
    MiniCursorword = { underline = true },
    MiniCursorwordCurrent = { underline = true },

    -- Indentscope
    MiniIndentscopeSymbol = { fg = theme.ui.base5 },

    -- Jump
    MiniJump = { fg = theme.syn.coral, bold = true, underline = true },
    MiniJump2dSpot = { fg = theme.syn.coral, bold = true },

    -- Notify
    MiniNotifyBorder = { fg = theme.ui.float_border },
    MiniNotifyNormal = { fg = theme.ui.fg, bg = theme.ui.float_bg },
    MiniNotifyTitle = { fg = theme.syn.coral, bold = true },

    -- Pick
    MiniPickBorder = { fg = theme.ui.float_border, bg = theme.ui.float_bg },
    MiniPickNormal = { fg = theme.ui.fg, bg = theme.ui.float_bg },
    MiniPickMatchCurrent = { fg = theme.syn.coral, bg = theme.ui.base3, bold = true },
    MiniPickMatchRanges = { fg = theme.syn.coral, bold = true },
    MiniPickPrompt = { fg = theme.syn.coral },
  }
end

return M
