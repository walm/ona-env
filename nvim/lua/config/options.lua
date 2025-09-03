-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

vim.wo.colorcolumn = "120" -- some prefer 80, I just like to break the rules :)

-- disable animations
vim.g.snacks_animate = false

opt.list = true
opt.listchars = { tab = "▸ ", trail = "·", extends = "#", nbsp = "·", eol = "¬" }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Don't make mistakes, there are no such thing :)
vim.cmd("command! -nargs=* W w")
vim.cmd("command! -nargs=* Wq wq")
vim.cmd("command! -nargs=* WQ wq")
vim.cmd("command! -nargs=* Q q")
vim.cmd("command! -nargs=* Qa qa")
vim.cmd("command! -nargs=* QA qa")
