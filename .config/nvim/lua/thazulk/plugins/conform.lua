return {
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
        lua = { 'stylua' },
        -- Conform will run multiple formatters sequentially
        python = { 'isort', 'black' },
        -- Use a sub-list to run only the first available formatter
        javascript = { 'prettierd', 'prettier' },
        bash = { 'shfmt' },
        sh = { 'shfmt' },
        fish = { 'fish_indent' },
        go = { 'goimports', 'gofumpt', 'goimports-reviser' },
        tsx = { 'prettierd', 'prettier' },
        typescript = { 'prettierd', 'prettier' },
        javascriptreact = { 'prettierd', 'prettier' },
        typescriptreact = { 'prettierd', 'prettier' },
        vue = { 'prettierd', 'prettier' },
        css = { 'prettierd', 'prettier' },
        scss = { 'prettierd', 'prettier' },
        less = { 'prettierd', 'prettier' },
        html = { 'prettierd', 'prettier' },
        json = { 'prettierd', 'prettier' },
        jsonc = { 'prettierd', 'prettier' },
        yaml = { 'prettierd', 'prettier' },
        markdown = { 'prettierd', 'prettier' },
        ['markdown.mdx'] = { 'prettierd', 'prettier' },
        graphql = { 'prettierd', 'prettier' },
      },
    },
  },
  vim.keymap.set('', '<leader>f', function()
    require('conform').format { async = true, lsp_fallback = true }
  end, { desc = '[F]ormat' }),
}
-- vim: ts=2 sts=2 sw=2 et
