return {
	{
		"ibhagwan/fzf-lua",
		opts = function(_, opts)
			local fzf_opts = vim.tbl_deep_extend("force", opts or {}, {
				-- 覆盖默认窗口配置
				winopts = {
					height = 0.90,
					width = 0.90,
					row = 0.5,
					col = 0.5,
					preview = {
						layout = "vertical",
						vertical = "down:30%",
						scrollchars = { "┃", "" },
					},
				},
			})
			return fzf_opts
		end,
	},
}

