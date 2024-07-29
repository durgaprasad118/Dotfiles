-- typing j,k and going to normal mode
vim.keymap.set("i", "jk", "<Esc>")
-- moving line up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
-- markdown preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { noremap = true, silent = true })
-- gitsigns
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

-- pastify for directly pasting the copied images
vim.keymap.set("n", "<leader>p", "<cmd>PastifyAfter<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>P", "<cmd>Pastify<CR>", { noremap = true, silent = true })
