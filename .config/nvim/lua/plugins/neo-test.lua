return {
  "nvim-neotest/neotest",
  dependencies = {
    "lawrence-laz/neotest-zig",
    "mrcjkb/neotest-haskell",
    "olimorris/neotest-phpunit",
    "nvim-treesitter/nvim-treesitter",
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
