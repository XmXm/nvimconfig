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
	if not vim.g.neovide then
		return
	end
	local font = vim.o.guifont
	local pattern = ":h(%d+)"
	local size_str = font:match(pattern)

	-- 检查是否匹配到字体大小
	if size_str then
		local size = tonumber(size_str) + v
		-- 确保字体大小在合理范围内
		size = math.max(6, math.min(size, 72))
		-- 修正：替换时保留 :h 前缀
		vim.o.guifont = font:gsub(pattern, ":h" .. tostring(size))
	else
		-- 如果没有匹配到，可能需要处理其他格式
		vim.notify("无法识别字体大小格式", vim.log.levels.WARN)
	end
end

local ignore_fileexts = {
	".meta",
	".manifest",
	".browser",
	".aspx",
	".dat",
	".prefab",
	".unity",
	".asset",
	".bytes",
	".jpg",
	".JPG",
	".png",
	".PNG",
	".dll",
	".pdb",
	".mdb",
	".jar",
	".a",
	".o",
	".so",
	".obj",
	".exe",
	".mat",
	".bnk",
	".cache",
	".xls",
	".xlsx",
	".doc",
	".docx",
	".ttf",
	".TTF",
	".otf",
	".tga",
	".fbx",
	".FBX",
	".anim",
	".controller",
	".bin",
	".resx",
	".resources",
	".psd",
	".temp",
	".gradle",
	".data",
	".db",
	".mp4",
	".unity3d",
	".zip",
	".gz",
	".mmdb",
	".tgz",
	".rar",
	".7z",
}

return _M
