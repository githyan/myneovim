return {
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		opts = require("configs.conform"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	-- These are some examples, uncomment them if you want to see them work!
	-- {
	--   "neovim/nvim-lspconfig",
	--   config = function()
	--     require("nvchad.configs.lspconfig").defaults()
	--     require "configs.lspconfig"
	--   end,
	-- },

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"html-lsp",
				"css-lsp",
				"prettier",
				"clangd",
				"clang-format",
				"pyright",
				"black",
			},
		},
	},

	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.chunk")
		end,
	},

	-- {
	--   "wakatime/vim-wakatime",
	--   lazy = false,
	-- },

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
		enabled = false,
	},

	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		config = function()
			require("configs.inline-diagnostics")
		end,
	},

	-- {
	-- 	"nvim-flutter/flutter-tools.nvim",
	-- 	lazy = false,
	-- 	enabled = false,
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"stevearc/dressing.nvim", -- optional for vim.ui.select
	-- 	},
	-- 	config = true,
	-- },

	{
		"IogaMaster/neocord",
		event = "VeryLazy",
		config = function()
			require("configs.discord")
		end,
	},
	{ "nvchad/volt", lazy = true },
	{
		"nvchad/minty",
		lazy = true,
		config = function()
			require("configs.minty")
		end,
	},

	-- {
	-- 	"MeanderingProgrammer/render-markdown.nvim",
	-- 	-- Load only for markdown files
	-- 	ft = { "markdown" },
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter", -- Required for parsing
	-- 		"nvim-tree/nvim-web-devicons", -- Optional, for icons
	-- 	},
	-- 	config = function()
	-- 		require("render-markdown").setup({
	-- 			-- Enable by default when opening a markdown file
	-- 			enabled = true,
	-- 			-- Render in normal, command, and terminal modes
	-- 			render_modes = { "n", "c", "t" },
	-- 			-- Add other configuration options as desired
	-- 		})
	-- 		-- Define a keymap to toggle rendering (optional)
	-- 		vim.keymap.set(
	-- 			{ "n", "i", "v" },
	-- 			"<leader>mr",
	-- 			require("render-markdown").toggle,
	-- 			{ desc = "Toggle Markdown Render" }
	-- 		)
	-- 	end,
	-- },

	{ "nvchad/menu", lazy = true },

	{ "nvchad/showkeys", cmd = "ShowkeysToggle", opts = { position = "bottom-right", maxkeys = 5 } },

	{ "nvchad/timerly", cmd = "TimerlyToggle" },

	-- {
	-- 	"nvim-java/nvim-java",
	-- 	config = function()
	-- 		require("java").setup()
	-- 		vim.lsp.enable("jdtls")
	-- 	end,
	-- },

	{
		"nvzone/floaterm",
		dependencies = "nvzone/volt",
		opts = {
			border = true,
			size = { h = 60, w = 70 },

			-- to use, make this func(buf)
			-- mappings = { sidebar = nil, term = nil },
			mappings = {
				sidebar = nil,
				term = function(buf)
					vim.keymap.set({ "n", "t" }, "<C-p>", function()
						require("floaterm.api").cycle_term_bufs("prev")
					end, { buffer = buf })
				end,
			},

			-- Default sets of terminals you'd like to open
			terminals = {
				{ name = "Terminal" },
				-- cmd can be function too
				{ name = "Terminal", cmd = "htop" },
				-- More terminals
			},
		},
		cmd = "FloatermToggle",
	},
	{
		"RRethy/base16-nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("matugen").setup()
		end,
	},
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
		dependencies = {
			-- include a picker of your choice, see picker section for more details
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		cmd = "Leet",
		opts = {
			-- configuration goes here
		},
	},
	{
		"Jezda1337/nvim-html-css",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			enable_on = {
				"html",
				"htmldjango",
				"tsx",
				"jsx",
				"erb",
				"svelte",
				"vue",
				"blade",
				"php",
				"templ",
				"astro",
			},
			handlers = {
				definition = {
					bind = "gd",
				},
				hover = {
					bind = "K",
					wrap = true,
					border = "none",
					position = "cursor",
				},
			},
			documentation = {
				auto_show = true,
			},
			peek = {
				enabled = true,
				border = "rounded",
				position = "center",
				width = 0.5,
				height = 0.5,
				focus = true,
				style = "minimal",
			},
			style_sheets = {
				"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
				"https://cdnjs.cloudflare.com/ajax/libs/bulma/1.0.3/css/bulma.min.css",
				"./index.css", -- `./` refers to the current working directory.
			},
		},
	},
	-- test new blink
	-- { import = "nvchad.blink.lazyspec" },

	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = {
	-- 		ensure_installed = {
	-- 			"vim", "lua", "vimdoc",
	--      "html", "css"
	-- 		},
	-- 	},
	-- },
}
