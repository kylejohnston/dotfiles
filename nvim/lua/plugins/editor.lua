-- Editor enhancement plugins
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local filetypes = { "c", "css", "html", "javascript", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc" }
      require("nvim-treesitter").install(filetypes)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function() vim.treesitter.start() end,
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
