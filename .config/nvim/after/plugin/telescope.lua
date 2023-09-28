local builtin = require('telescope.builtin')

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
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
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
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
    }
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {});
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
