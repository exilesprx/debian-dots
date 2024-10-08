return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  opts = {
    ---@type table<string, conform.FormatterUnit[]>
    formatters_by_ft = {
      ["css"] = { "prettier" },
      ["html"] = { "prettier" },
      ["javascript"] = { "prettier" },
      ["json"] = { "prettier" },
      ["lua"] = { "stylua" },
      ["markdown"] = { "prettier" },
      ["php"] = { "phpcs" },
      ["typescript"] = { "prettier" },
      ["sh"] = { "shfmt" },
      ["vue"] = { "prettier" },
      ["yaml"] = { "prettier" },
    },
    -- The options you set here will be merged with the builtin formatters.
    -- You can also define any custom formatters here.
    ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
    formatters = {
      phpcs = {
        args = {
          "--rules=@PSR12,ordered_imports",
          "fix",
          "$FILENAME",
        },
        command = "php-cs-fixer",
        filetypes = { "php" },
        stdin = false,
      },
    },
  },
}
