return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "c_sharp" } },
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = { underline = false },
			servers = {
				omnisharp = { autostart = false },
				ltex = { enabled = false },
			},
		},
	},
}
