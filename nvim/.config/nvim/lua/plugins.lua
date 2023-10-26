-- TODO: this kind of works, but a lot of errors are still hit on the initial load
-- For bootstrapping packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Executes packer compile whenever file change is made
vim.api.nvim_create_augroup("packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "lua/plugins/config/*.lua,plugins.lua",
	group = "packer",
	-- TODO: this depends on where we open nvim from, remove this somehow
	command = [[source ~/.config/nvim/lua/plugins.lua | PackerCompile]],
})

return require("packer").startup(function(use)
	-- Package manager
	use("wbthomason/packer.nvim")

	-- LSP Related --
	-----------------
	-----------------

	-- Should be called before lsp
	-- Null-ls --
	-- TODO: may need this at some point -> https://github.com/jay-babu/mason-null-ls.nvim
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.config.null-ls")
		end,
	})

	-- LSP Configuration & Plugins
	use({
		"neovim/nvim-lspconfig",
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",

			-- Used to display Statusline from LSP in corner
			{ "j-hui/fidget.nvim", tag = "legacy" },
		},
		config = function()
			require("plugins.config.lsp")

			require("fidget").setup({})
		end,
	})

	-- Autocompletion
	use({
		"hrsh7th/nvim-cmp",
		requires = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	})

	-- Debug Adapter Protocol
	use({
		"mfussenegger/nvim-dap",
		requires = {
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			require("plugins.config.dap")
		end,
	})

	use({
		"nvimdev/lspsaga.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("lspsaga").setup({})
		end,
	})

	-----------------
	-----------------
	-- LSP Related --

	-- TODO: test this
	use({
		"lewis6991/impatient.nvim",
		config = function()
			pcall(require, "impatient")
		end,
	})

	-- Install before treesitter
	-- Orgmode nvim
	use({
		"nvim-orgmode/orgmode",
		config = function()
			require("plugins.config.org")
		end,
	})

	-- Treesitter --
	use({ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter", --TODO: cool TS stuff from https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		config = function()
			require("plugins.config.treesitter")
		end,
	})

	use({ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})

	-- File Tree --
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("plugins.config.nvim-tree")
		end,
	})

	-- Toggle an area to view all current errors and warnings
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	----------
	-- Rust --

	-- Rust Additional Tools For LSP
	use({
		"simrat39/rust-tools.nvim",
		config = function()
			require("plugins.config.rust-tools")
		end,
	})

	-- Crates
	use({
		"saecki/crates.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	})

	-- Rust --
	----------

	-- Debugging
	use("nvim-lua/plenary.nvim")

	-- Commenting
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.config.commenter")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.config.gitsigns")
		end,
	})

	-- Git
	use("tpope/vim-fugitive")

	-- File Searching
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
		config = function()
			require("plugins.config.telescope")
		end,
	})

	---------
	-- QOL --
	---------

	-- Autopairs {} () []
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	-- Surround --
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
				-- Conflicts with lightspeed.nvim
				keymaps = { visual = "Z" },
			})
		end,
	})

	-- Motions --
	use({
		"ggandor/lightspeed.nvim",
		config = function()
			require("plugins.config.lightspeed")
		end,
	})

	-- TODO: this kills start screen for some reason
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("plugins.config.lualine")
		end,
	})

	-- Which key, never for get a mapping!
	use({
		"folke/which-key.nvim",
		config = function()
			require("plugins.config.whichkey")
		end,
	})

	------------------
	-- Colorschemes --

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("plugins.config.catppuccin")
		end,
	})

	use({
		"rebelot/kanagawa.nvim",
		config = function()
			require("plugins.config.kangawa")
		end,
	})

	-- Colorschemes --
	------------------

	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("plugins.config.copilot")
		end,
	})

	use({
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
	})

	-- Used at bootstrap
	if packer_bootstrap then
		print("Packer bootstrapping...")
		require("packer").sync()
	end
end)
