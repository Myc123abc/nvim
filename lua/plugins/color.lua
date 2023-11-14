return {
  -- colorscheme
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("tokyonight").setup {
        style = "day",
        transparent = true,
        day_brightness = 0.5,
        styles = {
          sidebars = "transparent",
          floats = "transparent"
        },
        sidebars = { "qf", "help", "vista_kind", "terminal", "packer" },
        -- on_highlights = function(hl, c)
        --   local prompt = "#2d3149"
        --   hl.TelescopeNormal = {
        --     bg = c.bg_dark,
        --     fg = c.fg_dark,
        --   }
        --   hl.TelescopeBorder = {
        --     bg = c.bg_dark,
        --     fg = c.bg_dark,
        --   }
        --   hl.TelescopePromptNormal = {
        --     bg = prompt,
        --   }
        --   hl.TelescopePromptBorder = {
        --     bg = prompt,
        --     fg = prompt,
        --   }
        --   hl.TelescopePromptTitle = {
        --     bg = prompt,
        --     fg = prompt,
        --   }
        --   hl.TelescopePreviewTitle = {
        --     bg = c.bg_dark,
        --     fg = c.bg_dark,
        --   }
        --   hl.TelescopeResultsTitle = {
        --     bg = c.bg_dark,
        --     fg = c.bg_dark,
        --   }
        -- end,
      }
      vim.cmd([[colorscheme tokyonight]])
    end
  },
  -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("lualine").setup {
        options = {
          theme = 'onedark'
        },
        sections = {
          lualine_x = { 'encoding', 'filetype' }
        }
      }
    end
  },
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup {}
    end
  },
  -- highlight
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter").setup {
        ensure_installed = { "c", "cpp", "lua" },
        sync_insatll = false,
        auto_install = true,
        highlight = { enable = true },
        additional_vim_regex_highlighting = false
      }
    end
  }
}
