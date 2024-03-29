-- For bootstrapping lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`


require("lazy").setup({

	-- LSP Related --
	-----------------
	-----------------

	-- Should be called before lsp
	-- Null-ls --
	-- TODO: may need this at some point -> https://github.com/jay-babu/mason-null-ls.nvim
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.config.null-ls")
		end,
	},

	-- LSP Configuration & Plugins
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",

			-- Used to display Statusline from LSP in corner
			{ "j-hui/fidget.nvim" },

			-- TODO: I don't remember what this is for, also may need to call setup?
			--
			"nvimdev/lspsaga.nvim",
		},
		config = function()
			require("plugins.config.lsp")

			require("fidget").setup({})
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	},

	-- Debug Adapter Protocol
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			require("plugins.config.dap")
		end,
	},

	-----------------
	-----------------
	-- LSP Related --

	-- TODO: test this
	{
		"lewis6991/impatient.nvim",
		config = function()
			pcall(require, "impatient")
		end,
	},

	-- Install before treesitter
	-- Orgmode nvim
	-- {
	-- 	"nvim-orgmode/orgmode",
	-- 	config = function()
	-- 		require("plugins.config.org")
	-- 	end,
	-- },

	-- Treesitter --
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter", --TODO: cool TS stuff from https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		config = function()
			require("plugins.config.treesitter")
		end,
		dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
	},

	-- File Tree --
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("plugins.config.nvim-tree")
		end,
	},

	-- Toggle an area to view all current errors and warnings
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	},

	----------
	-- Rust --

	-- Rust Additional Tools For LSP
	-- {
	-- 	"simrat39/rust-tools.nvim",
	-- 	config = function()
	-- 		require("plugins.config.rust-tools")
	-- 	end,
	-- },

	-- Crates
	-- {
	-- 	"saecki/crates.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		require("crates").setup()
	-- 	end,
	-- },

	-- Rust --
	----------

	-- Debugging
	"nvim-lua/plenary.nvim",

	-- Commenting
	{
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.config.commenter")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.config.gitsigns")
		end,
	},

	-- Git
	"tpope/vim-fugitive",

	-- File Searching
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("plugins.config.telescope")
		end,
	},

	---------
	-- QOL --
	---------

	-- Autopairs {} () []
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	-- Surround --
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
				-- Conflicts with lightspeed.nvim
				keymaps = { visual = "Z" },
			})
		end,
	},

	-- Motions --
	{
		"ggandor/lightspeed.nvim",
		config = function()
			require("plugins.config.lightspeed")
		end,
	},

	-- TODO: this kills start screen for some reason
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
		config = function()
			require("plugins.config.lualine")
		end,
	},

	-- Which key, never for get a mapping!
	{
		"folke/which-key.nvim",
		config = function()
			require("plugins.config.whichkey")
		end,
	},

	------------------
	-- Colorschemes --

    { "catppuccin/nvim", name = "catppuccin", priority = 1000 }

	-- Colorschemes --
	------------------

	-- {
	-- 	"rcarriga/nvim-notify",
	-- 	config = function()
	-- 		require("notify").setup({
	-- 			background_colour = "#000000",
	-- 		})
	-- 	end,
	-- }
})
