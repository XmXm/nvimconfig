return {
	{
		"nvim-telescope/telescope.nvim",
		priority = 1000,
		opts = function(_, opts)
			-- 确保 defaults 表存在
			opts.defaults = opts.defaults or {}
			
			-- 合并配置而不是覆盖
			opts.defaults.layout_strategy = "vertical"
			opts.defaults.layout_config = opts.defaults.layout_config or {}
			opts.defaults.layout_config.vertical = {
				preview_height = 0.3,
			}
			
			return opts
		end,
	},
}