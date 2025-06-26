return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = function(_, opts)
    opts.dashboard = {
      enabled = true,
      override = {
        theme = "hyper",
        header = vim.split(
          [[
        ]],
          "\n"
        ),
        center = {}, -- remove all default buttons
        footer = {}, -- remove footer
      },
    }
  end,
}
