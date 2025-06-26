return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      on_colors = function(colors)
        colors.bg = "#011423"
        colors.fg = "#CBE0F0"
        colors.comment = "#214969"
        colors.cursor_fg = "#011423"
        colors.cursor_bg = "#47FF9C"
        colors.selection_bg = "#033259"
        colors.selection_fg = "#CBE0F0"
      end,
      on_highlights = function(hl, colors)
        -- General
        hl.Normal = { bg = "NONE" }
        hl.NormalNC = { bg = "NONE" }
        hl.SignColumn = { bg = "NONE" }
        hl.VertSplit = { bg = "NONE", fg = colors.comment }

        -- NvimTree
        hl.NvimTreeNormal = { bg = "NONE", fg = colors.fg }
        hl.NvimTreeNormalNC = { bg = "NONE", fg = colors.fg }
        hl.NvimTreeWinSeparator = { fg = colors.comment, bg = "NONE" }
        hl.NvimTreeEndOfBuffer = { fg = colors.comment, bg = "NONE" }

        -- Telescope
        hl.TelescopeNormal = { bg = "NONE", fg = colors.fg }
        hl.TelescopeBorder = { fg = colors.comment, bg = "NONE" }
        hl.TelescopeTitle = { fg = colors.fg, bg = "NONE" }
        hl.TelescopePromptNormal = { bg = "NONE", fg = colors.fg }
        hl.TelescopePromptBorder = { bg = "NONE", fg = colors.comment }
        hl.TelescopeResultsNormal = { bg = "NONE", fg = colors.fg }
        hl.TelescopeResultsBorder = { bg = "NONE", fg = colors.comment }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
