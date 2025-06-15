local M = {}

function M.generator()
  print("Creating Scratchy...")
  vim.cmd("new __Scratchy__")
  print("Scratchy created!")
end

local function mark_buffer()
  vim.opt_local.buftype = "nofile"
  vim.opt_local.bufhidden = "hide"
  vim.opt_local.swapfile = false
end

function M.setup()
  -- Create an autocommand for new files named __Scratchy__
  vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "__Scratchy__",
    callback = mark_buffer,
  })

  -- Create a user command named Scratchy
  vim.api.nvim_create_user_command("Scratchy", M.generator, {})
  
  vim.keymap.set('n', '<C-s>', ':Scratchy<CR>', { noremap = true, silent = true })
end

return M