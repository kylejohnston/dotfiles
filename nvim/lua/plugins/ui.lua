-- UI and colorscheme plugins
return {
  {
    -- "ember-theme/nvim",
    dir = vim.fn.stdpath("config") .. "/local/ember-rose",
    name = "ember",
    priority = 1000,
    config = function()
      require("ember").setup({
        variant = "ember", -- "ember" | "ember-soft" | "ember-light"
      })
      vim.cmd("colorscheme ember")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    nfig = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          component_separators = "|",
          section_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "filename",
              path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
          },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}
