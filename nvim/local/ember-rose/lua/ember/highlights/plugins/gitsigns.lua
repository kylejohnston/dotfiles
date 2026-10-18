local M = {}

M.get = function(theme)
  return {
    -- Sign column
    GitSignsAdd = { fg = theme.diff.add },
    GitSignsChange = { fg = theme.diff.change },
    GitSignsDelete = { fg = theme.diff.delete },

    -- Line number
    GitSignsAddNr = { fg = theme.diff.add },
    GitSignsChangeNr = { fg = theme.diff.change },
    GitSignsDeleteNr = { fg = theme.diff.delete },

    -- Line highlights
    GitSignsAddLn = { bg = theme.diff.add_bg },
    GitSignsChangeLn = { bg = theme.diff.change_bg },
    GitSignsDeleteLn = { bg = theme.diff.delete_bg },

    -- Blame
    GitSignsCurrentLineBlame = { fg = theme.ui.base5, italic = true },
  }
end

return M
