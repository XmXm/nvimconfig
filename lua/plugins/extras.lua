return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = { "c_sharp" },
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
			},
		},
	},
	-- 禁用可能导致渲染问题的 UI 插件
	{ "echasnovski/mini.indentscope", enabled = false }, -- 缩进线动画
	{ "lukas-reineke/indent-blankline.nvim", enabled = false }, -- 缩进指示线
	{ "folke/noice.nvim", enabled = false }, -- UI 增强插件
	{ "rcarriga/nvim-notify", enabled = false }, -- 通知插件
	{ "echasnovski/mini.animate", enabled = false }, -- 动画效果
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
	-- 禁用自动补全
	{ "hrsh7th/nvim-cmp", enabled = false },
	{ "hrsh7th/cmp-nvim-lsp", enabled = false },
	{ "hrsh7th/cmp-buffer", enabled = false },
	{ "hrsh7th/cmp-path", enabled = false },
	{ "saadparwaiz1/cmp_luasnip", enabled = false },
	{ "L3MON4D3/LuaSnip", enabled = false },
	{ "rafamadriz/friendly-snippets", enabled = false },
	-- 禁用 mini.pairs（自动括号补全）
	{ "echasnovski/mini.pairs", enabled = false },
}
