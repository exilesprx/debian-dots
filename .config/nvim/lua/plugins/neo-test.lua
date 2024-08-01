return {
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "lawrence-laz/neotest-zig",
    },
    opts = {
      adapters = {
        "neotest-zig",
        "neotest-haskell",
        ["neotest-python"] = {
          runner = "pytest",
        },
      },
    },
  },
}
