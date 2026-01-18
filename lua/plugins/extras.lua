return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = { "c_sharp", "json5", "jsonc" },
			-- 禁用可能导致渲染问题的功能
			incremental_selection = {
				enable = false,
			},
			indent = {
				enable = false,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			-- 完全禁用诊断的各种显示功能
			diagnostics = {
				underline = false,
				virtual_text = false, -- 禁用虚拟文本
				signs = false, -- 禁用标志
				update_in_insert = false, -- 插入模式下不更新
				severity_sort = false,
			},
			-- 禁用内联提示
			inlay_hints = {
				enabled = false,
			},
			-- 禁用代码镜头
			codelens = {
				enabled = false,
			},
			servers = {
				omnisharp = { autostart = false },
				ltex = { enabled = false },
				marksman = { enabled = false },
				jsonls = { settings = { json = { validate = { enable = false } } } },
			},
		},
	},
	-- 配置全局诊断设置
	{
		"LazyVim/LazyVim",
		opts = function()
			vim.diagnostic.config({
				virtual_text = false,
				signs = false,
				underline = false,
				update_in_insert = false,
				severity_sort = false,
			})
			-- 禁用拼写检查
			vim.opt.spell = false
			vim.opt.spelllang = {}
		end,
	},
	{
		"folke/persistence.nvim",
		--event = "BufReadPre",
		opts = {},
		-- stylua: ignore
		keys = {
			--{ "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
			--{ "<leader>qS", function() require("persistence").select() end,desc = "Select Session" },
			--{ "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
			--{ "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
		},
	},
}
