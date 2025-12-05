-- clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Key mappings
vim.keymap.set("n", "E", "$")
vim.keymap.set("i", "kk", "<Esc>")
vim.keymap.set("i", "ii", "<Esc>")
vim.keymap.set("n", "]", "o<Esc>")
vim.keymap.set("n", "[", "O<Esc>")

-- CHANGE without copying (to black hole register)
vim.keymap.set({'n', 'x'}, 'c', '"_c', { noremap = true, silent = true })
vim.keymap.set({'n', 'x'}, 'C', '"_C', { noremap = true, silent = true })
vim.keymap.set('n', 'cc', '"_cc', { noremap = true, silent = true })

-- DELETE without copying (to black hole register)
vim.keymap.set({'n', 'x'}, 'd', '"_d', { noremap = true, silent = true })
vim.keymap.set({'n', 'x'}, 'D', '"_D', { noremap = true, silent = true })
vim.keymap.set('n', 'dd', '"_dd', { noremap = true, silent = true })
