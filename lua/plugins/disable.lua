-- 统一管理禁用的插件
return {
	-- 禁用 snacks 的 picker 功能，使用 fzf-lua 替代
	{
		"folke/snacks.nvim",
		opts = {
			picker = { enabled = false },
		},
	},
	
	-- 从 extras.lua 中合并过来的禁用插件
	-- 禁用可能导致渲染问题的 UI 插件
	{ "echasnovski/mini.indentscope", enabled = false }, -- 缩进线动画
	{ "lukas-reineke/indent-blankline.nvim", enabled = false }, -- 缩进指示线
	{ "folke/noice.nvim", enabled = false }, -- UI 增强插件
	{ "rcarriga/nvim-notify", enabled = false }, -- 通知插件
	{ "echasnovski/mini.animate", enabled = false }, -- 动画效果
	
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