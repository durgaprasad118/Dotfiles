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
						previewer = true, -- Enable preview for find_files
					})
				end,
				desc = "Find File (CWD)",
			},
			{
				"<leader>sg",
				function()
					require("telescope.builtin").git_files({
						previewer = true, -- Enable preview for git_files
					})
				end,
				desc = "Search Git Files",
			},
			-- Other key mappings...
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
						preview_cutoff = 120,
						height = 0.8, -- Increase height of the entire Telescope window
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
						previewer = true, -- Enable preview for find_files
						layout_config = {
							height = 0.6, -- Increase height of the find_files picker
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					git_files = {
						previewer = true, -- Enable preview for git_files
						layout_config = {
							height = 0.6, -- Increase height of the git_files picker
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					buffers = {
						mappings = {
							i = {
								["<c-d>"] = actions.delete_buffer,
							},
							n = {
								["<c-d>"] = actions.delete_buffer,
							},
						},
						previewer = true, -- Enable preview for buffers
						initial_mode = "normal",
						layout_config = {
							height = 0.6, -- Increase height of the buffers picker
							width = 0.8, -- Optionally increase width as well
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					current_buffer_fuzzy_find = {
						previewer = true,
						layout_config = {
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					live_grep = {
						only_sort_text = true,
						previewer = true,
					},
					grep_string = {
						only_sort_text = true,
						previewer = true,
					},
					lsp_references = {
						show_line = false,
						previewer = true,
					},
					treesitter = {
						show_line = false,
						previewer = true,
					},
					colorscheme = {
						enable_preview = true,
					},
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
					package_info = {
						-- Optional theme (the extension doesn't set a default theme)
						-- theme="ivy",
					},
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
