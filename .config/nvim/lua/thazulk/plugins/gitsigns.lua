-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return {
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			on_attach = function(bufnr)
				vim.keymap.set(
					"n",
					"<leader>gp",
					require("gitsigns").prev_hunk,
					{ buffer = bufnr, desc = "[G]o to [P]revious Hunk" }
				)
				vim.keymap.set(
					"n",
					"<leader>gn",
					require("gitsigns").next_hunk,
					{ buffer = bufnr, desc = "[G]o to [N]ext Hunk" }
				)
				vim.keymap.set(
					"n",
					"<leader>ph",
					require("gitsigns").preview_hunk,
					{ buffer = bufnr, desc = "[P]review [H]unk" }
				)
				vim.keymap.set(
					"n",
					"<leader>tb",
					require("gitsigns").toggle_current_line_blame,
					{ buffer = bufnr, desc = "[T]oggle [B]lame" }
				)
				vim.keymap.set(
					"n",
					"<leader>hs",
					require("gitsigns").stage_hunk,
					{ buffer = bufnr, desc = "[H]unk [S]tage" }
				)
				vim.keymap.set(
					"n",
					"<leader>hu",
					require("gitsigns").undo_stage_hunk,
					{ buffer = bufnr, desc = "[H]unk [U]ndo" }
				)
				vim.keymap.set(
					"n",
					"<leader>hr",
					require("gitsigns").reset_hunk,
					{ buffer = bufnr, desc = "[H]unk [R]eset" }
				)
				vim.keymap.set(
					"n",
					"<leader>hR",
					require("gitsigns").reset_buffer,
					{ buffer = bufnr, desc = "Buffer [H]unk [R]eset" }
				)
				vim.keymap.set(
					"n",
					"<leader>hS",
					require("gitsigns").stage_buffer,
					{ buffer = bufnr, desc = "Buffer [H]unk [S]tage" }
				)
			end,
		},
	},
}
