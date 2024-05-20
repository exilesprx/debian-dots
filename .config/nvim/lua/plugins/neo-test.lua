return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "lawrence-laz/neotest-zig",
    "mrcjkb/neotest-haskell",
    "olimorris/neotest-phpunit",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-zig"),
        require("neotest-python"),
        require("neotest-haskell"),
        require("neotest-phpunit"),
      },
    })
  end,
}
