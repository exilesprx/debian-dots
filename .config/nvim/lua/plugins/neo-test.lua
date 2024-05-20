return {
  { "nvim-neotest/neotest-plenary" },
  "nvim-neotest/neotest",
  dependencies = {
    "lawrence-laz/neotest-zig",
    "mrcjkb/neotest-haskell",
    "olimorris/neotest-phpunit",
  },
  opts = {
    adapters = {
      "neotest-plenary",
      "neotest-zig",
      "neotest-python",
      "neotest-haskell",
      "neotest-phpunit",
    },
  },
}
