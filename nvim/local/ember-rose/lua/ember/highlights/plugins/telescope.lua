local M = {}

M.get = function(theme)
  return {
    -- General
    TelescopeNormal = { fg = theme.ui.fg, bg = theme.ui.float_bg },
    TelescopeBorder = { fg = theme.ui.float_border, bg = theme.ui.float_bg },
    TelescopeTitle = { fg = theme.syn.coral, bold = true },

    -- Prompt
    TelescopePromptNormal = { fg = theme.ui.fg, bg = theme.ui.base2 },
    TelescopePromptBorder = { fg = theme.ui.base4, bg = theme.ui.base2 },
    TelescopePromptTitle = { fg = theme.syn.coral, bg = theme.ui.base2, bold = true },
    TelescopePromptPrefix = { fg = theme.syn.coral },

    -- Results
    TelescopeResultsNormal = { fg = theme.ui.fg, bg = theme.ui.float_bg },
    TelescopeResultsBorder = { fg = theme.ui.float_border, bg = theme.ui.float_bg },

    -- Preview
    TelescopePreviewNormal = { fg = theme.ui.fg, bg = theme.ui.base0 },
    TelescopePreviewBorder = { fg = theme.ui.float_border, bg = theme.ui.base0 },
    TelescopePreviewTitle = { fg = theme.syn.gold, bold = true },

    -- Selection and matching
    TelescopeSelection = { fg = theme.syn.coral, bg = theme.ui.base3, bold = true },
    TelescopeSelectionCaret = { fg = theme.syn.coral },
    TelescopeMatching = { fg = theme.syn.coral, bold = true },
    TelescopeMultiSelection = { fg = theme.syn.orange },
    TelescopeMultiIcon = { fg = theme.syn.coral },
  }
end

return M
