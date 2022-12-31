local overrides = require("custom.plugins.overrides")

return {

	-- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

	-- Override plugin definition options
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},

	-- overrde plugin configs
	["nvim-treesitter/nvim-treesitter"] = {
		override_options = overrides.treesitter,
	},

	["williamboman/mason.nvim"] = {
		override_options = overrides.mason,
	},


	["kyazdani42/nvim-tree.lua"] = {
		override_options = overrides.nvimtree,
	},

	-- Install a plugin
	["max397574/better-escape.nvim"] = {
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

--	["mfussenegger/nvim-dap"] = {
--		-- event = "InsertEnter",
--		config = function()
--			require("mfussenegger/nvim-dap").setup()
--		end,
--	},
--	["rcarriga/nvim-dap-ui"] = {
--		event = "InsertEnter",
--		after = "mfussenegger/nvim-dap",
--		config = function()
--			require("rcarriga/nvim-dap-ui").setup()
--		end,
--	},
--	["mfussenegger/nvim-dap-python"] = {
--		event = "InsertEnter",
--		after = "mfussenegger/nvim-dap",
--		config = function()
--			require("dap-python").setup()
--		end,
--	},
--
--	["leoluz/nvim-dap-go"] = {
--		event = "InsertEnter",
--		after = "mfussenegger/nvim-dap",
--		config = function()
--			require("dap-go").setup()
--		end,
--	},
--

	-- code formatting, linting etc
	["jose-elias-alvarez/null-ls.nvim"] = {
    event = "InsertEnter",
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},

	-- remove plugin
	-- [thrsh7th/cmp-path"] = false,
}
