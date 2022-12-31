local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"c",
		"bash",
		"dockerfile",
		"go",
		"json",
		"lua",
		"python",
		"markdown",
		"make",
		"nix",
		"python",
		"toml",
		"yaml",
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"eslint-lsp",
		"prettier",
		"json-lsp",

		-- python
		"black",
		"ruff",
		"ruff-lsp",
		"debugpy",

		-- golang
		"golangci-lint",
		"golangci-lint-langserver",
		"gopls",
		"delve",

		-- docker
		"dockerfile-language-server",
		-- nix
		"rnix-lsp",
		-- markdown
		"markdownlint",

		-- shell
		"shfmt",
		"shellcheck",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
