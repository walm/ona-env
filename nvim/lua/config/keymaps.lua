-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- keymaps for plugins, check each plugin config file under plugins/

-- everyday use :)
map("i", "jk", "<ESC>", { desc = "jk to escape" })
map("n", "Y", "yy", { desc = "yank line" })
map("n", "<leader><leader>", "<C-^>", { desc = "Last file" })
map("n", "<leader>i", "<cmd> set list! <CR>", { desc = "Toggle invisible" })

-- move text easy
map("n", "<C-j>", "mz:m+<CR>`z", { desc = "Move text line down" })
map("n", "<C-k>", "mz:m-2<CR>`z", { desc = "Move text line up" })
map("v", "<C-j>", ":m'>+<CR>`<my`>mzgv`yo`z", { desc = "Move text line down" })
map("v", "<C-k>", ":m'<-2<CR>`>my`<mzgv`yo`z", { desc = "Move text line up" })

if vim.fn.executable("btop") == 1 then
  -- btop
  map("n", "<leader>xb", function()
    require("lazyvim.util").terminal.open({ "btop" }, { esc_esc = false, ctrl_hjkl = false })
  end, { desc = "btop" })
end

-- diagnostics
-- map("n", "<C-j>", function()
--   vim.diagnostic.goto_next()
-- end, { desc = "Jump to next diagnostic" })
--
-- map("n", "<C-k>", function()
--   vim.diagnostic.goto_prev()
-- end, { desc = "Jump to previous diagnostic" })

map("n", "<leader>zz", "<cmd> lua Snacks.zen.zoom() <CR>", { desc = "Zoom" })
