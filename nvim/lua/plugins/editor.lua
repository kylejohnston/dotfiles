-- Editor enhancement plugins
return {
  {
    "nvim-treesitter/nvim-treesitter",
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
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Telescope: Find files' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Telescope: Live grep' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Telescope: Find buffers' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Telescope: Help tags' },
    },
  },
}
