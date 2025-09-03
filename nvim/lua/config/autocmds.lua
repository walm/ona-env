-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

-- Fix mini.comment "commenstring" empty issue
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "vue" },
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

-- Don't show invisibles and diagnostic on some types of files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "mod", "markdown" },
  callback = function()
    vim.opt_local.list = false
    vim.diagnostic.enable(false)
  end,
})
