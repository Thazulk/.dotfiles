vim.diagnostic.config({
    virtual_text = true
})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local nmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end
    nmap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end, 'LSP: Workspace Symbol')
    nmap("<leader>vrr", function() vim.lsp.buf.references() end, 'LSP: References')
    nmap('<leader>e', vim.diagnostic.open_float, 'Open diagnostics float')
    nmap("[d", function() vim.diagnostic.goto_next() end, 'Next Diagnostic')
    nmap("]d", function() vim.diagnostic.goto_prev() end, 'Previous Diagnostic')
    nmap('<leader>q', vim.diagnostic.setloclist, 'Set diagnostics loclist')
    nmap('<leader>rn', vim.lsp.buf.rename, 'LSP: [R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, 'LSP: [C]ode [A]ction')
    nmap('gd', vim.lsp.buf.definition, 'LSP: [G]oto [D]efinition')
    nmap('gI', vim.lsp.buf.implementation, 'LSP: [G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'LSP: Type [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, 'LSP: [G]oto [R]eferences - Telescope')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'LSP: [D]ocument [S]ymbols - Telescope')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'LSP: [W]orkspace [S]ymbols - Telescope')
    nmap('K', vim.lsp.buf.hover, 'LSP: Hover Documentation')
    nmap('<C-a>', vim.lsp.buf.signature_help, 'LSP: Signature Documentation')
    nmap('gD', vim.lsp.buf.declaration, 'LSP: [G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'LSP: [W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'LSP: [W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, 'LSP: [W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    --     vim.lsp.buf.format()
    -- end, { desc = 'Format current buffer with LSP' })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'ansiblels',
        'volar',
        'yamlls',
        'tsserver',
        'tailwindcss',
        'rust_analyzer',
        'lua_ls',
        'jsonls',
        'html',
        'gopls',
        'emmet_language_server',
        'eslint',
        'dockerls',
        'docker_compose_language_service',
        'cssls',
        'bashls'
    },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    }
})

local cmp = require('cmp')
local cmp_format = lsp_zero.cmp_format()
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
    },
    formatting = cmp_format,
    completion = { completeopt = 'menu,menuone,noinsert' },
    mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
        end,
    }),
})
