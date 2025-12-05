-- LSP Configuration
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Setup Mason (LSP installer)
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "html", "cssls", "ts_ls" },
        automatic_installation = true,
      })

      -- LSP keymaps (set on attach)
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local opts = { buffer = args.buf, noremap = true, silent = true }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'Go to definition' }))
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'Hover documentation' }))
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename symbol' }))
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code actions' }))
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = 'Find references' }))
        end,
      })

      -- Configure language servers using modern API
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Lua
      vim.lsp.config.lua_ls = {
        cmd = { 'lua-language-server' },
        root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = { checkThirdParty = false },
          }
        }
      }

      -- HTML
      vim.lsp.config.html = {
        cmd = { 'vscode-html-language-server', '--stdio' },
        root_markers = { 'package.json', '.git' },
        capabilities = capabilities,
      }

      -- CSS
      vim.lsp.config.cssls = {
        cmd = { 'vscode-css-language-server', '--stdio' },
        root_markers = { 'package.json', '.git' },
        capabilities = capabilities,
      }

      -- JavaScript/TypeScript
      vim.lsp.config.ts_ls = {
        cmd = { 'typescript-language-server', '--stdio' },
        root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
        capabilities = capabilities,
      }

      -- Enable language servers
      vim.lsp.enable({ 'lua_ls', 'html', 'cssls', 'ts_ls' })
    end,
  },
}
