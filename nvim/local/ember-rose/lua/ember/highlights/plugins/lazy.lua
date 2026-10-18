local M = {}

M.get = function(theme)
  return {
    -- UI chrome
    LazyButton = { fg = theme.ui.fg, bg = theme.ui.base2 },
    LazyButtonActive = { fg = theme.syn.coral, bg = theme.ui.base4, bold = true },
    LazyH1 = { fg = theme.ui.bg, bg = theme.syn.coral, bold = true },
    LazyH2 = { fg = theme.syn.coral, bold = true },

    -- Text
    LazyComment = { fg = theme.ui.base6 },
    LazyCommit = { fg = theme.syn.gold },
    LazyCommitType = { fg = theme.syn.coral, bold = true },
    LazyDimmed = { fg = theme.ui.base5 },
    LazyProp = { fg = theme.ui.fg_alt },

    -- Reasons
    LazyReasonPlugin = { fg = theme.syn.gold },
    LazyReasonEvent = { fg = theme.syn.orange },
    LazyReasonKeys = { fg = theme.syn.coral },
    LazyReasonStart = { fg = theme.syn.olive },
    LazyReasonFt = { fg = theme.syn.steel },
    LazyReasonCmd = { fg = theme.syn.coral },
    LazyReasonSource = { fg = theme.ui.base6 },

    -- Misc
    LazySpecial = { fg = theme.syn.coral },
    LazyUrl = { fg = theme.syn.steel, underline = true },
    LazyLocal = { fg = theme.syn.gold },
    LazyProgressDone = { fg = theme.syn.coral },
    LazyProgressTodo = { fg = theme.ui.base4 },
  }
end

return M
