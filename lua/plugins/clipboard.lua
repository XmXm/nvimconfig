-- OSC 52剪切板支持，适用于远程SSH环境
return {
	{
		"ojroques/nvim-osc52",
		event = "VeryLazy",
		config = function()
			require("osc52").setup({
				max_length = 0, -- 不限制长度
				silent = false, -- 显示复制信息
				trim = false, -- 不修剪空白字符
			})

			-- 检测是否在SSH环境中
			local function is_ssh()
				return os.getenv("SSH_CLIENT") ~= nil
					or os.getenv("SSH_TTY") ~= nil
					or os.getenv("SSH_CONNECTION") ~= nil
			end

			-- 检测是否在tmux环境中
			local function is_tmux()
				return os.getenv("TMUX") ~= nil
			end

			-- 检测是否在WSL环境中（复用原有逻辑）
			local function is_wsl()
				local proc_version_path = "/proc/version"
				if vim.fn.filereadable(proc_version_path) == 0 then
					return false
				end
				local ok, output = pcall(vim.fn.readfile, proc_version_path)
				if not ok or not output or not output[1] then
					return false
				end
				return output[1]:lower():match("microsoft") ~= nil
			end

			-- 在SSH或tmux环境下配置OSC 52剪切板
			-- 优先级：tmux > SSH > WSL
			if is_tmux() or (is_ssh() and not is_wsl()) then
				local function copy(lines, _)
					require("osc52").copy(table.concat(lines, "\n"))
				end

				local function paste()
					return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
				end

				vim.g.clipboard = {
					name = "osc52",
					copy = {
						["+"] = copy,
						["*"] = copy,
					},
					paste = {
						["+"] = paste,
						["*"] = paste,
					},
				}

				-- 自动复制选中的文本到剪切板
				vim.api.nvim_create_autocmd("TextYankPost", {
					group = vim.api.nvim_create_augroup("OSC52Copy", { clear = true }),
					pattern = "*",
					callback = function()
						if vim.v.event.operator == "y" and vim.v.event.regname == "" then
							require("osc52").copy_register("")
						end
					end,
				})
			end
		end,
	},
}
