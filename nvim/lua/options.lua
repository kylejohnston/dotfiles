-- Set leader early
vim.g.mapleader = " " -- g = global variable
vim.g.maplocalleader = " "
-- vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")

-- Basic settings
vim.opt.number = true
vim.opt.ruler = true
vim.opt.showmode = false
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
-- sync clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.conceallevel = 2

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- show which line your cursor is on
vim.opt.cursorline = true

-- minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 999

