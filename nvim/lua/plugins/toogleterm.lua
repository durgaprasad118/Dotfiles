return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
			shade_terminals = false,
			shell = "zsh --login",
			size = function(term)
				if term.direction == "horizontal" then
					return 10 -- Set horizontal terminal size
				else
					return 40 -- Increase vertical terminal size
				end
			end,
		})
	end,
	keys = {
		{
			"<leader>tv",
			function()
				local count = vim.v.count1
				require("toggleterm").toggle(count, 0, vim.loop.cwd(), "vertical")
			end,
			desc = "ToggleTerm (vertical)",
		},
		{
			"<leader>th",
			function()
				local count = vim.v.count1
				require("toggleterm").toggle(count, 10, vim.loop.cwd(), "horizontal")
			end,
			desc = "ToggleTerm (horizontal)",
		},
	},
}
