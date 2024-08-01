-- Set up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Require lazy.nvim and set up plugins
require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" }, -- LazyVim core
    { import = "lazyvim.plugins.extras.lang.typescript" }, -- TypeScript support
    { import = "lazyvim.plugins.extras.lang.json" }, -- JSON support
    { import = "lazyvim.plugins.extras.ui.mini-animate" }, -- UI animations
    { import = "lazyvim.plugins.extras.linting.eslint" }, -- ESLint integration
    { import = "lazyvim.plugins.extras.formatting.prettier" }, -- Prettier integration
    { import = "lazyvim.plugins.extras.lang.markdown" }, -- Markdown support
    { import = "lazyvim.plugins.extras.lang.rust" }, -- Rust support
    { import = "lazyvim.plugins.extras.lang.tailwind" }, -- Tailwind CSS support
    { import = "lazyvim.plugins.extras.lang.vue" }, -- Tailwind CSS support
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.dap.core" }, -- Debugging support
    { import = "lazyvim.plugins.extras.vscode" }, -- VSCode-like features
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" }, -- Highlight patterns
    { import = "lazyvim.plugins.extras.test.core" }, -- Testing support
    { import = "lazyvim.plugins.extras.editor.mini-files" }, -- File explorer
    { import = "lazyvim.plugins.extras.util.project" }, -- Project management
    { "glepnir/lspsaga.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { import = "plugins" }, -- Your custom plugins
  },
  opts = function(_, opts)
    local nls = require("null-ls") -- Require null-ls for formatting
    opts.sources = opts.sources or {}
    table.insert(opts.sources, nls.builtins.formatting.prettier) -- Add Prettier to sources
    table.insert(opts.ensure_installed, "prettier") -- Ensure Prettier is installed
  end,
  defaults = {
    lazy = false, -- Load plugins immediately
    version = false, -- Always use the latest git commit
  },
  dev = {
    path = "~/.ghq/github.com", -- Path for development plugins
  },
  install = { colorscheme = { "tokyonight", "catapuccin" } }, -- Default colorschemes to install
  checker = { enabled = true }, -- Automatically check for plugin updates
  performance = {
    cache = {
      enabled = true, -- Enable caching
    },
    rtp = {
      disabled_plugins = { -- Disable certain built-in plugins for performance
        "gzip",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  debug = false, -- Disable debug messages
})
