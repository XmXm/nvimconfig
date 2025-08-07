-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map("n", "<C-z>", "u", { desc = "Undo" })
map("i", "<C-z>", "<C-o>u", { desc = "Undo" })
map("n", "<C-y>", "<C-r>", { desc = "Redo" })
map("i", "<C-y>", "<C-o><C-r>", { desc = "Redo" })
map("v", "<C-c>", "y", { desc = "Copy" })
map({ "n", "i" }, "<C-j>", "<C-f>", { desc = "Page down" })
map({ "n", "i" }, "<C-k>", "<C-b>", { desc = "Page up" })
map("i", "gd", "<C-d>", { desc = "Half page down" })
map("i", "gu", "<C-u>", { desc = "Half page up" })
map("i", "zj", "<C-f>", { desc = "Page down" })
map("i", "zk", "<C-b>", { desc = "Page up" })
