vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Netrw explorer' })
vim.keymap.set('n', '<leader>fe', '<cmd>Neotree toggle<CR>', { desc = 'File explorer' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Move line under cursor to end of current line' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Jump half a screen down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Jump half a screen up' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Jump to next find result' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Jump to previous find result' })
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste over highlighted' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank to system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete to blackhole register' })
vim.keymap.set('i', '<C-c>', '<Esc>', { desc = 'Remap Ctrl-c to Esc' })
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Remap Q to no operation' })
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>', { desc = 'Open tmux sessionizer' })
vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, { desc = 'Format current buffer with LSP' })
vim.keymap.set('n', '<leader>efa', '<cmd>:EslintFixAll<CR>', { desc = '[E]slint [F]ix [A]ll' })
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'Jump to next quickfix' })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'Jump to previous quickfix' })
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Jump to next location list' })
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Jump to previous location list' })
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
--     { desc = "Search and replace word under cursor" })
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make file executable' })
vim.keymap.set('n', '<leader><leader>', function()
  vim.cmd 'so'
end)

vim.keymap.set('n', '<leader>vt', '<cmd>vsplit | term<CR>', { desc = 'Open vertical terminal' })
-- toggleterm map ESC to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })