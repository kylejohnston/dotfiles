local M = {}

M.get = function(theme)
  return {
    -- Window
    NeoTreeNormal = { fg = theme.ui.fg, bg = theme.ui.bg_alt },
    NeoTreeNormalNC = { fg = theme.ui.fg, bg = theme.ui.bg_alt },

    -- Root and directories
    NeoTreeRootName = { fg = theme.syn.coral, bold = true },
    NeoTreeDirectoryIcon = { fg = theme.syn.coral },
    NeoTreeDirectoryName = { fg = theme.ui.fg },

    -- Files
    NeoTreeFileName = { fg = theme.ui.fg_alt },
    NeoTreeFileIcon = { fg = theme.ui.fg_alt },

    -- Git status
    NeoTreeGitAdded = { fg = theme.diff.add },
    NeoTreeGitConflict = { fg = theme.diag.warn },
    NeoTreeGitDeleted = { fg = theme.diff.delete },
    NeoTreeGitModified = { fg = theme.diff.change },
    NeoTreeGitUntracked = { fg = theme.ui.base6 },

    -- Misc
    NeoTreeIndentMarker = { fg = theme.ui.base4 },
    NeoTreeSymbolicLinkTarget = { fg = theme.syn.steel },
    NeoTreeFloatBorder = { fg = theme.ui.float_border },
    NeoTreeFloatTitle = { fg = theme.syn.coral },
    NeoTreeWinSeparator = { fg = theme.ui.border, bg = theme.ui.bg },
  }
end

return M
