return {
	{
		"LunarVim/breadcrumbs.nvim",
		dependencies = { "SmiteshP/nvim-navic" },
		config = function()
			require("nvim-navic").setup({
				lsp = { auto_attach = true }, -- Automatically attach to LSP clients
			})

			require("breadcrumbs").setup({
				position = "winbar", -- Set position to winbar
			})

			-- Set the winbar to display breadcrumbs
			vim.opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

			-- Alternative: Display breadcrumbs in statusline
			vim.opt.statusline = "%{%v:lua.require'nvim-navic'.get_location()%} " .. vim.opt.statusline:get()
		end,
	},
}
