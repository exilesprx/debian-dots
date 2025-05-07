return {
  -- workaround
  { "mason-org/mason.nvim", version = "^1.0.0" },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
  -- end workaround
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "elixir-ls",
        "haskell-language-server",
        "lua-language-server",
        "phpactor",
        "phpcs",
        "php-cs-fixer",
        "prettier",
        "stylua",
        "shellcheck",
        "shfmt",
        "vue-language-server",
      },
    },
  },
}
