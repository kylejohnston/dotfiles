-- Note-taking plugins
return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    opts = {
      workspaces = {
        { path = "/Users/kylejohnston/Library/Mobile Documents/iCloud~md~obsidian/Documents/00" },
      },
      legacy_commands = false,
      footer = {
        enabled = false,
      },
    },
  },
}
