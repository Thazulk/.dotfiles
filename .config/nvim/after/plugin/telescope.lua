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
    },
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
        },
    },
}

-- Enable telescope extensions, if they are installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git Commits' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Git Branches' })
vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = 'Grep String' })
-- open file_browser with the path of the current buffer
vim.keymap.set('n', "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    { desc = 'File Browser - Telescope' })
