-- Plugins
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "rebelot/kanagawa.nvim",
      config = function()
        vim.cmd.colorscheme("kanagawa-wave")
      end,
    },
    { "nvim-treesitter/nvim-treesitter",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = { "c", "css", "html", "javascript", "lua", "markdown", "query", "vim", "vimdoc" },
          auto_install = true,
          highlight = { enable = true },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "<Leader>ss",    -- start incremental selection
              node_incremental = "<Leader>si",  -- increment to the upper named node
              node_decremental = "<Leader>sc",  -- decrement to the previous node
              scope_incremental = "<Leader>sd", -- increment to the upper scope
            },
          },
        })
      end,
  },
    { "nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" }, },
    { "epwalsh/obsidian.nvim", version = "*", lazy = true,
        ft = "markdown",
        dependencies = { "nvim-lua/plenary.nvim", },
        opts = { 
          dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian",
        },
    },
  },
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
