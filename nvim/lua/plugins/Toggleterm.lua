return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-/>]], -- Keybinding to open the terminal
        shade_terminals = false, -- Disables shading of terminal windows
        shell = "zsh --login", -- Set the shell to `zsh`
        size = 20, -- Set default terminal size, can be overridden
        direction = "float",
      })
    end,
  },
}
