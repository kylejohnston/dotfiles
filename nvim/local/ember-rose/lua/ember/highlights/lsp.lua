local M = {}

M.get = function(theme)
  local syn = theme.syn

  return {
    -- Type links (LSP semantic tokens → treesitter captures)
    ["@lsp.type.class"] = { link = "@type" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.decorator"] = { link = "@attribute" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { link = "@type" },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.macro"] = { link = "@function.macro" },
    ["@lsp.type.method"] = { link = "@function.method" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.string"] = { link = "@string" },
    ["@lsp.type.struct"] = { link = "@type" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    ["@lsp.type.variable"] = { link = "@variable" },

    -- Modifier overrides (unique LSP semantic info)
    ["@lsp.typemod.variable.global"] = { fg = syn.constant },
    ["@lsp.typemod.variable.defaultLibrary"] = { fg = syn.variable_builtin, italic = true },
    ["@lsp.typemod.function.defaultLibrary"] = { fg = syn.func, italic = true },
    ["@lsp.typemod.type.defaultLibrary"] = { fg = syn.type, italic = true },
    ["@lsp.typemod.variable.readonly"] = { fg = syn.constant },
  }
end

return M
