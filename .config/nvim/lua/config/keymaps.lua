-- vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })
-- vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Move line under cursor to end of current line" })
-- vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Jump half a screen down' })
-- vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Jump half a screen up' })
vim.keymap.set("n", "n", "nzzzv", { desc = "Jump to next find result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Jump to previous find result" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over highlighted" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Remap Q to no operation" })
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux sessionizer" })
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Jump to next quickfix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Jump to previous quickfix" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Jump to next location list" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Jump to previous location list" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })
