-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- stylua: ignore
local cutils = require("cutils")
local map = vim.keymap.set
map("n", "<C-z>", "u", { desc = "Undo" })
map("i", "<C-z>", "<C-o>u", { desc = "Undo" })
map("n", "<C-y>", "<C-r>", { desc = "Redo" })
map("i", "<C-y>", "<C-o><C-r>", { desc = "Redo" })
map("v", "<C-c>", "y", { desc = "Copy" })
map("i", "<C-v>", "<C-r>*", { desc = "Paste" })

-- stylua: ignore
map('c', '<C-v>', function() local reg = vim.fn.getreg('*') vim.api.nvim_feedkeys(reg, 'c', true) end, { desc = 'Paste' })
map({ "n", "i" }, "<C-j>", "<C-f>", { desc = "Page down" })
map({ "n", "i" }, "<C-k>", "<C-b>", { desc = "Page up" })
map("n", "gd", "<C-d>", { desc = "Half page down" })
map("n", "gu", "<C-u>", { desc = "Half page up" })
map("n", "zj", "<C-f>", { desc = "Page down" })
map("n", "zk", "<C-b>", { desc = "Page up" })
-- stylua: ignore
if vim.g.neovide == true then
	map({'n','i'}, '<C-=>', function() cutils.increment_font_size(1) end, { desc = 'FontSize++' })
	map({'n','i'}, '<C-->', function() cutils.increment_font_size(-1) end, { desc = 'FontSize--' })
	map({'n','i'}, '<C-F11>', ':let g:neovide_fullscreen = !g:neovide_fullscreen<CR>', {desc = 'ToggleFullScreen'})
end
