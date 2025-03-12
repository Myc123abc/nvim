return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000
  },

  {
    "akinsho/bufferline.nvim",
    -- config = function()
    --   local bufferline = require("bufferline")
    --   bufferline.setup {
    --     options = {
    --       style_preset = bufferline.style_preset.minimal
    --     }
    --   }
    -- end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter").setup {
        ensure_installed = {
          "c",
          "cpp",
          "lua",
          "bash",
          "markdown",
          "cmake"
        },
        -- sync_insatll = false,
        -- auto_install = true,
        highlight = { enable = true },
        ident = { enable = true },
        -- additional_vim_regex_highlighting = false
      }
    end
  }
}
