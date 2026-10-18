local M = {}

M.get = function(theme)
  return {
    -- v3 (ibl)
    IblIndent = { fg = theme.ui.base3 },
    IblScope = { fg = theme.ui.base5 },

    -- v2 (legacy)
    IndentBlanklineChar = { fg = theme.ui.base3 },
    IndentBlanklineContextChar = { fg = theme.ui.base5 },
  }
end

return M
