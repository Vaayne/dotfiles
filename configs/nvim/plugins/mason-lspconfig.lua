local present, mlsp = pcall(require, "mason-lspconfig")

if not present then
	return
end


local ensure_installed = {
  "bashls",
  "cssls",
  "dockerls",
  "eslint",
  "golangci_lint_ls",
  "gopls",
  "html",
  "jsonls",
  "sumneko_lua",
  "marksman",
  "rnix",
  "ruff_lsp",
  "sqlls",
  "taplo",
  "yamlls",
}

mlsp.setup({
  ensure_installed = ensure_installed,
  automatic_installation = true,
})
