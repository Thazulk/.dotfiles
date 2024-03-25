-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	-- NOTE: Plugins can also be added by using a table,
	-- with the first argument being the link and the following
	-- keys can be used to configure plugin behavior/loading/etc.
	--
	-- Use `opts = {}` to force a plugin to be loaded.
	--
	--  This is equivalent to:
	--    require('Comment').setup({})

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	-- modular approach: using `require 'path/name'` will
	-- include a plugin definition from file lua/path/name.lua
	--Rosé-pine theme
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	--Gruvbox theme
	{ "ellisonleao/gruvbox.nvim", priority = 1 },
	--One Monokai theme
	{ "cpea2506/one_monokai.nvim" },
	{
		"folke/trouble.nvim",
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	"mbbill/undotree",
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"nvim-treesitter/nvim-treesitter-context",
	-- Required
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
	},
	"ThePrimeagen/vim-be-good",
	"tpope/vim-surround",
	"RRethy/vim-illuminate",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	"petertriho/nvim-scrollbar",
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
	{
		"nvim-pack/nvim-spectre",
		build = false,
		cmd = "Spectre",
		opts = { open_cmd = "noswapfile vnew" },
		-- stylua: ignore
		keys = {
			{ "<leader>sp", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
		},
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
			-- "ibhagwan/fzf-lua", -- optional
			"cleong14/fzf-lua", -- optional
		},
		config = true,
	},
	"brenoprata10/nvim-highlight-colors",
	{ "folke/neodev.nvim", opts = {} },
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	{ "mfussenegger/nvim-dap" },
	{ "wakatime/vim-wakatime", lazy = false },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "MunifTanjim/nui.nvim", lazy = true },
	-- Additional plugins:
	require("thazulk.plugins"),
}, {
	ui = {
		-- If you have a Nerd Font, set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- vim: ts=2 sts=2 sw=2 et
