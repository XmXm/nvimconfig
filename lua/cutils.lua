local _M = {}
-- 检测是否在 WSL 环境中
function _M.is_wsl()
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

function _M.is_windows()
	return string.lower(jit.os) == "windows"
end

function _M.increment_font_size(v)
	if vim.g.neovide then
		local reg = ":h(%d+)"
		local size_str = vim.o.guifont:match(reg)
		local size = tonumber(size_str) + v
		vim.o.guifont = vim.o.guifont:gsub(reg, ":" .. tostring(size))
	end
end

return _M
