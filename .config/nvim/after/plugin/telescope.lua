local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
                -- ["<C-w>"] = actions.send_selected_to_qflist,
                -- ["<C-q>"] = actions.send_to_qflist,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,

            },
            n = {
                -- ["<C-w>"] = actions.send_selected_to_qflist,
                -- ["<C-q>"] = actions.send_to_qflist,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,

            },
        },
        pickers = {
            live_grep = {
                additional_args = function(opts)
                    return { "--hidden" }
                end
            },
            find_files = {
                find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
            },
        },
    }
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
-- open file_browser with the path of the current buffer
vim.keymap.set('n', "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", {})
