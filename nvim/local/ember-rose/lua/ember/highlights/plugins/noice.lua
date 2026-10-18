local M = {}

M.get = function(theme)
  return {
    -- Cmdline
    NoiceCmdline = { fg = theme.ui.fg },
    NoiceCmdlineIcon = { fg = theme.syn.coral },
    NoiceCmdlinePopup = { fg = theme.ui.fg, bg = theme.ui.float_bg },
    NoiceCmdlinePopupBorder = { fg = theme.ui.float_border },
    NoiceCmdlinePopupTitle = { fg = theme.syn.coral },
    NoiceCmdlineIconSearch = { fg = theme.syn.gold },

    -- Confirm
    NoiceConfirm = { fg = theme.ui.fg, bg = theme.ui.float_bg },
    NoiceConfirmBorder = { fg = theme.ui.float_border },

    -- Mini
    NoiceMini = { fg = theme.ui.fg, bg = theme.ui.base2 },

    -- Progress
    NoiceFormatProgressDone = { fg = theme.ui.bg, bg = theme.syn.coral },
    NoiceFormatProgressTodo = { bg = theme.ui.base3 },
  }
end

return M
