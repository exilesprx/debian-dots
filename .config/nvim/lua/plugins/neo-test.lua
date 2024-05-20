return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/nvim-nio",
      "lawrence-laz/neotest-zig",
      "mrcjkb/neotest-haskell",
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        "neotest-plenary",
        "neotest-zig",
        "neotest-haskell",
        ["neotest-python"] = {
          runner = "pytest",
        },
      },
    },
  },
}
