local M = {}

M.get = function(theme)
  return {
    normal = {
      a = { fg = theme.ui.bg, bg = theme.syn.coral, gui = "bold" },
      b = { fg = theme.ui.fg_alt, bg = theme.ui.base2 },
      c = { fg = theme.ui.fg_alt, bg = theme.ui.base1 },
    },
    insert = {
      a = { fg = theme.ui.bg, bg = theme.syn.olive, gui = "bold" },
    },
    visual = {
      a = { fg = theme.ui.bg, bg = theme.syn.gold, gui = "bold" },
    },
    replace = {
      a = { fg = theme.ui.bg, bg = theme.syn.rose, gui = "bold" },
    },
    command = {
      a = { fg = theme.ui.bg, bg = theme.syn.orange, gui = "bold" },
    },
    inactive = {
      a = { fg = theme.ui.base5, bg = theme.ui.base1 },
      b = { fg = theme.ui.base5, bg = theme.ui.base1 },
      c = { fg = theme.ui.base5, bg = theme.ui.base1 },
    },
  }
end

return M
