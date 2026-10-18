local M = {}

M.get = function(theme)
  return {
    WhichKey = { fg = theme.syn.coral },
    WhichKeyGroup = { fg = theme.syn.gold },
    WhichKeySeparator = { fg = theme.ui.base5 },
    WhichKeyDesc = { fg = theme.ui.fg },
    WhichKeyFloat = { bg = theme.ui.float_bg },
    WhichKeyBorder = { fg = theme.ui.float_border },
    WhichKeyValue = { fg = theme.ui.fg_alt },
  }
end

return M
