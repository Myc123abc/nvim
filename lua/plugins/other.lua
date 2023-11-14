return {
  -- file tree
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true
    -- config in keymaps
  },
  -- comment
  {
    "numToStr/Comment.nvim",
    keys = { "<C-v>", "V", "gcc" },
    opts = {}
  },
  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  }
}
