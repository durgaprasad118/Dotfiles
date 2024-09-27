return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		version = false,
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
			"telescope-dap.nvim",
			"kkharji/sqlite.lua",
		},
		keys = {
			{
				"<leader>f",
				function()
					require("config.utils").telescope_git_or_file()
				end,
				desc = "Find Files (Root)",
			},
			{
				"<leader>o",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>sf",
				function()
					require("telescope.builtin").find_files({
						previewer = true,
					})
				end,
				desc = "Find File (CWD)",
			},
			{
				"<leader>sg",
				function()
					require("telescope.builtin").git_files({
						previewer = true,
					})
				end,
				desc = "Search Git Files",
			},
			{
				"<leader>sb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Buffers",
			},
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local trouble = require("trouble.sources.telescope")
			local icons = require("config.icons")

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "TelescopeResults",
				callback = function(ctx)
					vim.api.nvim_buf_call(ctx.buf, function()
						vim.fn.matchadd("TelescopeParent", "\t\t.*$")
						vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
					end)
				end,
			})

			telescope.setup({
				file_ignore_patterns = { "%.git/." },
				defaults = {
					mappings = {
						i = {
							["<esc>"] = actions.close,
							["<C-t>"] = trouble.open,
						},
						n = { ["<C-t>"] = trouble.open },
					},
					path_display = { "filename_first" },
					previewer = true, -- Enable preview by default
					prompt_prefix = " " .. icons.ui.Telescope .. " ",
					selection_caret = icons.ui.BoldArrowRight .. " ",
					file_ignore_patterns = { "node_modules", "package-lock.json" },
					initial_mode = "insert",
					select_strategy = "reset",
					sorting_strategy = "ascending",
					color_devicons = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default is nil
					layout_config = {
						prompt_position = "top",
						height = 0.85, -- Increase height of the entire Telescope window
						width = 0.9, -- Increase width of the entire Telescope window
						horizontal = {
							width_padding = 0.15, -- Make the left side a bit larger
							height_padding = 0.1, -- Adjust vertical padding
							preview_width = 0.65, -- Make preview a bit smaller
						},
						preview_cutoff = 120,
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob=!.git/",
					},
				},
				pickers = {
					find_files = {
						layout_config = {
							height = 0.7, -- Increase height of the find_files picker
							width = 0.9, -- Increase width of the find_files picker
							prompt_position = "top",
							horizontal = {
								width_padding = 0.15, -- Make the left side a bit larger
								height_padding = 0.1, -- Adjust vertical padding
								preview_width = 0.65, -- Make preview a bit smaller
							},
						},
					},
					git_files = {
						layout_config = {
							height = 0.7, -- Increase height of the git_files picker
							width = 0.9, -- Increase width of the git_files picker
							prompt_position = "top",
							horizontal = {
								width_padding = 0.15, -- Make the left side a bit larger
								height_padding = 0.1, -- Adjust vertical padding
								preview_width = 0.65, -- Make preview a bit smaller
							},
						},
					},
					buffers = {
						layout_config = {
							height = 0.7, -- Increase height of the buffers picker
							width = 0.9, -- Increase width of the buffers picker
							prompt_position = "top",
							horizontal = {
								width_padding = 0.15, -- Make the left side a bit larger
								height_padding = 0.1, -- Adjust vertical padding
								preview_width = 0.65, -- Make preview a bit smaller
							},
						},
					},
					current_buffer_fuzzy_find = {
						layout_config = {
							height = 0.7, -- Increase height of current_buffer_fuzzy_find picker
							width = 0.9, -- Increase width of current_buffer_fuzzy_find picker
							prompt_position = "top",
							horizontal = {
								width_padding = 0.15,
								height_padding = 0.1,
								preview_width = 0.65,
							},
						},
					},
					live_grep = { previewer = true },
					grep_string = { previewer = true },
					lsp_references = { show_line = false, previewer = true },
					treesitter = { show_line = false, previewer = true },
					colorscheme = { enable_preview = true },
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							previewer = false,
							initial_mode = "normal",
							sorting_strategy = "ascending",
							layout_strategy = "horizontal",
							layout_config = {
								horizontal = {
									width = 0.5,
									height = 0.4,
									preview_width = 0.6,
								},
							},
						}),
					},
					package_info = {},
				},
			})
			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
			telescope.load_extension("dap")
			telescope.load_extension("notify")
			telescope.load_extension("package_info")
		end,
	},
}
