-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local set_indent = function(size)
	vim.opt_local.expandtab = true
	vim.opt_local.tabstop = size
	vim.opt_local.shiftwidth = size
	vim.opt_local.softtabstop = size
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "yaml", "typescript", "javascript" },
	callback = function()
		set_indent(2) -- 这些文件类型使用 2 空格
	end,
})
