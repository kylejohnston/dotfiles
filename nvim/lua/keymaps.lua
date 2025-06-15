-- clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Key mappings
vim.keymap.set("n", "E", "$")
vim.keymap.set("i", "kk", "<Esc>")
vim.keymap.set("n", "]", "o<Esc>")
vim.keymap.set("n", "[", "O<Esc>")

