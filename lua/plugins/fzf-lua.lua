return {
	{
		"ibhagwan/fzf-lua",
		lazy = false,
		opts = function(_, opts)
			local fzf = require("fzf-lua")
			local config = fzf.config
			local actions = fzf.actions
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
				grep = {
					rg_opts = '-g "!.patch" -g "!*.dll" ',
				},
				files = {
					fd_opts = "--exclude /Library/ --exclude /Temp/ --exclude /dragon2017/ --exclude .svn --exclude .idea --exclude .git",
					hidden = false,
				},
				fzf_opts = {
					["--case-sensitive"] = false, -- 禁用大小写敏感
					["--ignore-case"] = true, -- 启用忽略大小写
				},
			})
			return fzf_opts
		end,
	},
}
