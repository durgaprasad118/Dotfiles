return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lang = "java",
    directory = vim.fn.stdpath("data") .. "/leetcode/",
    logging = true,
    console = {
      open_on_runcode = true,
      dir = "row",
      size = {
        width = "75%",
        height = "75%",
      },
    },
    description = {
      position = "left",
      width = "40%",
    },
    image_support = false,
  },
  config = function(_, opts)
    require("leetcode").setup(opts)
  end,
}
