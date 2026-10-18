local M = {}

M.get = function(theme)
  local ui = theme.ui
  local syn = theme.syn
  local diag = theme.diag
  local diff = theme.diff

  return {
    -- Variables & Identifiers
    -- Emacs: variable-name = fg, variable-use = fg-alt
    ["@variable"] = { fg = syn.variable_use },
    ["@variable.builtin"] = { fg = syn.variable_builtin, italic = true },
    ["@variable.parameter"] = { fg = ui.fg, italic = true },
    ["@variable.member"] = { fg = syn.property },

    -- Constants — only builtins (undefined, null, true) get accent color
    -- Regular constants/enum members stay close to fg like Emacs
    ["@constant"] = { fg = syn.constant },
    ["@constant.builtin"] = { fg = syn.constant, bold = true },
    ["@constant.macro"] = { fg = syn.preproc },

    -- Modules — Emacs treats these as regular identifiers (fg-alt)
    ["@module"] = { fg = ui.fg_alt },
    ["@module.builtin"] = { fg = syn.variable_builtin, italic = true },

    -- Labels
    ["@label"] = { fg = syn.coral },

    -- Strings
    ["@string"] = { fg = syn.string },
    ["@string.documentation"] = { fg = syn.doc_comment, italic = true },
    ["@string.escape"] = { fg = syn.orange, bold = true },
    ["@string.special"] = { fg = syn.orange },
    ["@string.special.url"] = { fg = syn.steel, underline = true },
    ["@string.special.symbol"] = { fg = syn.orange },
    ["@string.regexp"] = { fg = syn.orange, bold = true },

    -- Numbers & Booleans
    ["@number"] = { fg = syn.number },
    ["@number.float"] = { fg = syn.number },
    ["@boolean"] = { fg = syn.constant },
    ["@character"] = { fg = syn.string },
    ["@character.special"] = { fg = syn.orange },

    -- Types
    ["@type"] = { fg = syn.type, bold = true },
    ["@type.builtin"] = { fg = syn.type, italic = true },
    ["@type.definition"] = { fg = syn.type, bold = true },
    ["@type.qualifier"] = { fg = syn.keyword },

    -- Attributes & Properties
    ["@attribute"] = { fg = syn.steel },
    ["@attribute.builtin"] = { fg = syn.steel, italic = true },
    ["@property"] = { fg = syn.property },

    -- Functions
    ["@function"] = { fg = syn.func },
    ["@function.builtin"] = { fg = syn.func, italic = true },
    ["@function.call"] = { fg = syn.func },
    ["@function.macro"] = { fg = syn.preproc },
    ["@function.method"] = { fg = syn.method },
    ["@function.method.call"] = { fg = syn.method },

    -- Constructor
    ["@constructor"] = { fg = syn.type },

    -- Operators & Punctuation
    ["@operator"] = { fg = syn.operator },
    ["@punctuation.bracket"] = { fg = ui.fg_alt },
    ["@punctuation.delimiter"] = { fg = ui.fg_alt },
    ["@punctuation.special"] = { fg = syn.operator },

    -- Keywords
    ["@keyword"] = { fg = syn.keyword, bold = true },
    ["@keyword.coroutine"] = { fg = syn.keyword, bold = true },
    ["@keyword.function"] = { fg = syn.keyword, bold = true },
    ["@keyword.operator"] = { fg = syn.keyword },
    ["@keyword.import"] = { fg = syn.keyword, bold = true },
    ["@keyword.type"] = { fg = syn.keyword, bold = true },
    ["@keyword.modifier"] = { fg = syn.keyword, italic = true },
    ["@keyword.repeat"] = { fg = syn.keyword, bold = true },
    ["@keyword.return"] = { fg = syn.keyword, bold = true },
    ["@keyword.debug"] = { fg = syn.rose },
    ["@keyword.exception"] = { fg = syn.keyword, bold = true },
    ["@keyword.conditional"] = { fg = syn.keyword, bold = true },
    ["@keyword.conditional.ternary"] = { fg = syn.keyword },
    ["@keyword.directive"] = { fg = syn.preproc },
    ["@keyword.directive.define"] = { fg = syn.preproc },

    -- Comments
    ["@comment"] = { fg = syn.comment, italic = true },
    ["@comment.documentation"] = { fg = syn.doc_comment, italic = true },
    ["@comment.error"] = { fg = diag.error, bold = true },
    ["@comment.warning"] = { fg = diag.warn, bold = true },
    ["@comment.todo"] = { fg = syn.coral, bold = true },
    ["@comment.note"] = { fg = syn.steel, bold = true },

    -- Markup
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    -- Headings — match Emacs outline levels exactly
    ["@markup.heading"] = { fg = syn.coral, bold = true },
    ["@markup.heading.1"] = { fg = syn.coral, bold = true },       -- Emacs: red
    ["@markup.heading.2"] = { fg = syn.orange, bold = true },      -- Emacs: orange
    ["@markup.heading.3"] = { fg = syn.gold, bold = true },        -- Emacs: yellow
    ["@markup.heading.4"] = { fg = syn.olive, bold = true },       -- Emacs: green
    ["@markup.heading.5"] = { fg = syn.steel, bold = true },       -- Emacs: blue
    ["@markup.heading.6"] = { fg = theme.ui.base7, bold = true },  -- Emacs: base7
    ["@markup.quote"] = { fg = ui.fg_alt, italic = true },
    ["@markup.math"] = { fg = syn.orange },
    ["@markup.link"] = { fg = syn.coral, underline = true },
    ["@markup.link.label"] = { fg = syn.steel },
    ["@markup.link.url"] = { fg = syn.steel, underline = true },
    ["@markup.raw"] = { fg = syn.orange },
    ["@markup.raw.block"] = { fg = ui.fg },
    ["@markup.list"] = { fg = syn.coral },
    ["@markup.list.checked"] = { fg = syn.olive },
    ["@markup.list.unchecked"] = { fg = ui.base5 },

    -- Tags (HTML/XML)
    ["@tag"] = { fg = syn.coral },
    ["@tag.builtin"] = { fg = syn.coral },
    ["@tag.attribute"] = { fg = syn.gold },
    ["@tag.delimiter"] = { fg = ui.fg_alt },

    -- Diff
    ["@diff.plus"] = { fg = diff.add },
    ["@diff.minus"] = { fg = diff.delete },
    ["@diff.delta"] = { fg = diff.change },
  }
end

return M
