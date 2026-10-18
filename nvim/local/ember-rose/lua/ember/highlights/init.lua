local M = {}

function M.get(theme)
  local highlights = {}

  -- Core highlights
  local modules = {
    "ember.highlights.editor",
    "ember.highlights.syntax",
    "ember.highlights.treesitter",
    "ember.highlights.lsp",
    "ember.highlights.diagnostic",
  }

  -- Plugin highlights
  local plugins = {
    "ember.highlights.plugins.gitsigns",
    "ember.highlights.plugins.telescope",
    "ember.highlights.plugins.cmp",
    "ember.highlights.plugins.which-key",
    "ember.highlights.plugins.neo-tree",
    "ember.highlights.plugins.indent-blankline",
    "ember.highlights.plugins.mini",
    "ember.highlights.plugins.lazy",
    "ember.highlights.plugins.noice",
    "ember.highlights.plugins.snacks",
    -- lualine is handled separately (different format)
  }

  for _, mod_name in ipairs(modules) do
    local mod = require(mod_name)
    local hl = mod.get(theme)
    highlights = vim.tbl_deep_extend("force", highlights, hl)
  end

  for _, mod_name in ipairs(plugins) do
    local ok, mod = pcall(require, mod_name)
    if ok and mod.get then
      local hl = mod.get(theme)
      highlights = vim.tbl_deep_extend("force", highlights, hl)
    end
  end

  return highlights
end

return M
