return {
  ["williamboman/mason.nvim"] = {
    override_options = {
          ensure_installed = { 
        -- python 
        "black", "ruff", "ruff-lsp",
        -- nix
        "rnix-lsp", 
        -- shell
        "shellcheck", "shfmt", 
        -- golang
        "golangci-lint",
        -- lua
        "lua-language-server", "luacheck"
      }
      }
  },
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
 },
}
