local M = {}

M.get = function(theme)
  local diag = theme.diag

  return {
    -- Base diagnostic highlights
    DiagnosticError = { fg = diag.error },
    DiagnosticWarn = { fg = diag.warn },
    DiagnosticInfo = { fg = diag.info },
    DiagnosticHint = { fg = diag.hint },

    -- Virtual text
    DiagnosticVirtualTextError = { fg = diag.error, bg = diag.error_bg },
    DiagnosticVirtualTextWarn = { fg = diag.warn, bg = diag.warn_bg },
    DiagnosticVirtualTextInfo = { fg = diag.info, bg = diag.info_bg },
    DiagnosticVirtualTextHint = { fg = diag.hint, bg = diag.hint_bg },

    -- Underlines
    DiagnosticUnderlineError = { undercurl = true, sp = diag.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = diag.warn },
    DiagnosticUnderlineInfo = { undercurl = true, sp = diag.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = diag.hint },

    -- Floating windows
    DiagnosticFloatingError = { fg = diag.error },
    DiagnosticFloatingWarn = { fg = diag.warn },
    DiagnosticFloatingInfo = { fg = diag.info },
    DiagnosticFloatingHint = { fg = diag.hint },

    -- Sign column
    DiagnosticSignError = { fg = diag.error },
    DiagnosticSignWarn = { fg = diag.warn },
    DiagnosticSignInfo = { fg = diag.info },
    DiagnosticSignHint = { fg = diag.hint },
  }
end

return M
