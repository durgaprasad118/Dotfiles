return
---@type LazySpec
{
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- 👇 change the keymap to <leader>e and open Yazi in the current directory
    {
      "<leader>-", -- New keybinding
      mode = { "n", "v" },
      "<cmd>Yazi cwd<cr>", -- This command opens Yazi in the current working directory
      desc = "Open Yazi at the current file",
    },
    {
      -- Open Yazi in the current working directory
      "<leader>yc",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  ---@type YaziConfig | {}
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
  init = function()
    vim.g.loaded_netrwPlugin = 1
  end,
}
