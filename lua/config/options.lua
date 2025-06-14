-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
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

-- 检测是否在 WSL 环境中
local function is_wsl()
	-- 检查 /proc/version 文件是否存在（仅在 Linux 系统上存在）
	local proc_version_path = "/proc/version"
	if vim.fn.filereadable(proc_version_path) == 0 then
		return false
	end

	-- 安全地读取文件内容
	local ok, output = pcall(vim.fn.readfile, proc_version_path)
	if not ok or not output or not output[1] then
		return false
	end

	-- 检查是否包含 Microsoft 字符串（WSL 的标识）
	return output[1]:lower():match("microsoft") ~= nil
end

-- 仅在 WSL 环境下配置 win32yank
if is_wsl() then
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
