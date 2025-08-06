local snacks = { "folke/snacks.nvim", opts = {} }
local opts = snacks.opts
opts.picker = { sources = {} }

local explorer = {
	diagnostics = false,
	jump = { close = true },
	win = { list = {} },
}

local explorer_keys = {
	["<leader>/"] = false,
}

explorer.win.list.keys = explorer_keys

opts.picker.sources.explorer = explorer
return snacks
