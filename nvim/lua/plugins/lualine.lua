return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/noice.nvim",
  },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "catppuccin",
      icons_enabled = true,
      component_separators = "|",
      section_separators = "",
    },
    sections = {
      lualine_a = {
        {
          "buffers",
        },
      },
      lualine_x = {
        {
          require("noice").api.statusline.mode.get,
          cond = require("noice").api.statusline.mode.has,
          color = { fg = "#ff9e64" },
        },
        {
          require("noice").api.status.command.get,
          cond = require("noice").api.status.command.has,
          color = { fg = "#ff9e64" },
        },
      },
    },
  },
}
