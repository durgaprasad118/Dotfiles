-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps her
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- typing j,k and going to normal mode
vim.keymap.set("i", "jk", "<Esc>")
-- moving line up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<C-/>", ":ToggleTerm<CR>", { noremap = true, silent = true, desc = "Open floating terminal" })
