return {
  -- other plugins ...

  -- Rust support plugin
  {
    "rust-lang/rust.vim",
    ft = "rust", -- load only for Rust files
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
    config = function()
      -- Enable syntax and filetype plugins if not already enabled
      vim.cmd([[syntax enable]])
      vim.cmd([[filetype plugin indent on]])
    end,
  },

  -- optionally add rust-tools for enhanced LSP support
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      require("rust-tools").setup({})
    end,
  },
}
