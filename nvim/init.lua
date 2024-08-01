-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.g.python3_host_prog = "/usr/bin/python3"
return {
  function()
    vim.cmd([[
      autocmd BufRead,BufNewFile *.vue set filetype=vue
    ]])
  end,
}
