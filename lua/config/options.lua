-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local cutils = require("cutils")

vim.g.lazyvim_picker = "fzf"

vim.opt.autochdir = true
vim.opt.expandtab = false -- Do not use spaces instead of tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.title = true
vim.opt.relativenumber = false -- Do not use relative line numbers
vim.opt.foldmethod = "manual" -- use manual folding
vim.opt.foldenable = false --Disable folding at startup.
vim.opt.spell = false -- 禁用拼写检查
vim.opt.spelllang = {} -- 清空拼写检查语言
vim.log.levels.INFO = 3

-- 仅在 WSL 环境下配置 win32yank
if cutils.is_wsl() then
	vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
			["+"] = "win32yank.exe -i --crlf",
			["*"] = "win32yank.exe -i --crlf",
		},
		paste = {
			["+"] = "win32yank.exe -o --lf",
			["*"] = "win32yank.exe -o --lf",
		},
		cache_enabled = 0,
	}
end

if vim.g.neovide then
	vim.opt.guifont = "JetBrainsMonoNL Nerd Font Mono:h14"
	vim.g.neovide_input_ime = false
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_remember_window_size = true
end
