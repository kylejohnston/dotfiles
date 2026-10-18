local M = {}

M.get = function(theme)
  return {
    -- nvim-cmp: general
    CmpItemAbbr = { fg = theme.ui.fg },
    CmpItemAbbrMatch = { fg = theme.syn.coral, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = theme.syn.coral, bold = true },
    CmpItemAbbrDeprecated = { fg = theme.ui.base5, strikethrough = true },
    CmpItemMenu = { fg = theme.ui.base6 },
    CmpItemKind = { fg = theme.syn.gold },

    -- nvim-cmp: kind icons
    CmpItemKindFunction = { fg = theme.syn.gold },
    CmpItemKindMethod = { fg = theme.syn.sage },
    CmpItemKindVariable = { fg = theme.ui.fg },
    CmpItemKindKeyword = { fg = theme.syn.coral },
    CmpItemKindConstant = { fg = theme.syn.orange },
    CmpItemKindField = { fg = theme.syn.orange },
    CmpItemKindProperty = { fg = theme.syn.orange },
    CmpItemKindClass = { fg = theme.syn.type },
    CmpItemKindInterface = { fg = theme.syn.type },
    CmpItemKindStruct = { fg = theme.syn.type },
    CmpItemKindModule = { fg = theme.syn.coral },
    CmpItemKindText = { fg = theme.ui.fg_alt },
    CmpItemKindSnippet = { fg = theme.syn.mauve },
    CmpItemKindFile = { fg = theme.ui.fg_alt },
    CmpItemKindFolder = { fg = theme.syn.coral },
    CmpItemKindEnum = { fg = theme.syn.type },
    CmpItemKindEnumMember = { fg = theme.syn.constant },
    CmpItemKindValue = { fg = theme.syn.orange },
    CmpItemKindEvent = { fg = theme.syn.coral },
    CmpItemKindOperator = { fg = theme.syn.operator },
    CmpItemKindTypeParameter = { fg = theme.syn.type },
    CmpItemKindUnit = { fg = theme.syn.orange },
    CmpItemKindColor = { fg = theme.syn.coral },
    CmpItemKindReference = { fg = theme.syn.steel },

    -- blink.cmp
    BlinkCmpMenu = { fg = theme.ui.fg, bg = theme.ui.float_bg },
    BlinkCmpMenuBorder = { fg = theme.ui.float_border, bg = theme.ui.float_bg },
    BlinkCmpMenuSelection = { fg = theme.syn.coral, bg = theme.ui.base3, bold = true },
    BlinkCmpLabel = { fg = theme.ui.fg },
    BlinkCmpLabelMatch = { fg = theme.syn.coral, bold = true },
    BlinkCmpLabelDeprecated = { fg = theme.ui.base5, strikethrough = true },
    BlinkCmpKind = { fg = theme.syn.gold },
  }
end

return M
