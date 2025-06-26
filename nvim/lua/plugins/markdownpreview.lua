return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Do NOT lazy-load, as recommended
    -- If you use blink.cmp for completion, add as dependency:
    -- dependencies = { "saghen/blink.cmp" },
    config = function()
      require("markview").setup({
        preview = {
          icon_provider = "internal", -- or "mini" or "devicons"
        },
        -- Add further customization here as needed
      })
    end,
    keys = {
      {
        "<leader>mp",
        function()
          vim.cmd("Markview preview")
        end,
        desc = "Markdown Preview (Markview)",
        ft = { "markdown", "typst", "latex", "yaml", "html" },
      },
    },
  },
}
