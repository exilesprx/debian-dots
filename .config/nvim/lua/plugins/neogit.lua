return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim",
    },
    config = true,
    keys = {
      {
        "<leader>gn",
        function()
          require("neogit").open()
        end,
        desc = "Neogit",
      },
    },
  },
}
