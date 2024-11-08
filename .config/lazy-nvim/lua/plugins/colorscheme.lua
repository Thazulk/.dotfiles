return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      terminal_colors = true,
      sidebars = {},
      undercurl = true, -- Enable curly underlines
      underline = true, -- Enable terminal underline
      on_highlights = function(hl, c)
        hl.diagnosticVirtualTextError = {
          fg = c.error,
          bg = "none",
          blend = 100,
        }
        hl.diagnosticVirtualTextWarn = {
          fg = c.warning,
          bg = "none",
          blend = 100,
        }
        hl.diagnosticVirtualTextInfo = {
          fg = c.info,
          bg = "none",
          blend = 0,
        }
        hl.diagnosticVirtualTextHint = {
          fg = c.hint,
          bg = "none",
          blend = 0,
        }
        hl.LspInlayHint = {
          fg = c.fg_dark,
          bg = "none",
          blend = 100,
        }
      end,
    },
  }, -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  --add rose-pine
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   opts = {
  --     styles = {
  --       bold = true,
  --       italic = false,
  --       transparency = false,
  --     },
  --   },
  -- },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "none" }),
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "none" }),
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = "none" }),
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "none" }),

    -- Set highlights for inlay hints to make them transparent
    vim.api.nvim_set_hl(0, "LspInlayHint", { bg = "none" }),
  },
}
