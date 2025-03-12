local options = {
  autoindent = true,
  -- :help options
  backup = false,            -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1,             -- make more space in the neovim command line for displaying messages
  -- comleteopt = { "menuone", "noselect" },   -- mostly just for cmp
  conceallevel = 0,          -- so that `` is visiable in markdown files
  fileencoding = 'utf-8',    -- the encoding written to a file
  hlsearch = true,           -- highlisht all matches on previous search pattern
  ignorecase = true,         -- ignore case in search patterns
  -- mouse = "a",      				              -- allow the mouse to be used in neovim
  pumheight = 10,            -- pop up menu height
  showmode = false,          -- we don't need to see this like -- INSERT -- anymore
  showtabline = 2,           -- always show tabs
  smartcase = true,          -- smart case
  smartindent = true,        -- make indenting smarter again
  splitbelow = true,         -- force all horizontal splits to go below current window
  splitright = true,         -- force all vertical splits to go the right of current window
  swapfile = false,          -- creates a swapfile
  termguicolors = true,      -- set term gui colors (must terminals support this)
  timeoutlen = 300,          -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,           -- enable persistent undo
  updatetime = 300,          -- faster completion (4000ms default)
  writebackup = false,       -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,          -- convert tabs to spaces
  shiftwidth = 2,            -- the number of spaces inserted for each indentation
  tabstop = 2,               -- insert 2 spaces for a tab
  softtabstop = 2,
  cursorline = true,         -- highlight current
  number = true,             -- set numbered lines
  relativenumber = true,     -- set relative numbered lines
  numberwidth = 2,           -- set number column width to 2 (default 4)
  signcolumn = "yes",        -- always show the sign column, otherwise it would shift the text each time
  wrap = true,               -- display lines as one long line
  linebreak = true,          -- companion to wrap, don't split words
  scrolloff = 4,             -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 4,         -- minimal number of columns to scroll horizontally
  -- guifont = "",                          -- the font used in graphical neovim applications
  whichwrap = "bs<>[]hl",     -- which "horizontal" keys are allowed to travel to prev/next line
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd ":hi clear CursorLine" -- use underline highlight for cursorline
vim.cmd ":highlight CursorLine cterm=underline gui=underline"

-- vim.cmd("colorscheme onedark")
vim.cmd("colorscheme onelight")

local bufferline = require("bufferline")
bufferline.setup {
  options = {
    style_preset = bufferline.style_preset.minimal
  }
}

-- dap
local dap = require "dap"
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" },
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
  },
}

dap.configurations.c = dap.configurations.cpp

-- cpptools
dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "OpenDebugAD7",
  options = {
    detached = false,
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  },
}

dap.configurations.c = dap.configurations.cpp

-- args
function _G.dapRunConfigWithArgs()
  local ft = vim.bo.filetype
  if ft == "" then
      print("Filetype option is required to determine which dap configs are available")
      return
  end
  local configs = dap.configurations[ft]
  if configs == nil then
      print("Filetype \"" .. ft .. "\" has no dap configs")
      return
  end
  local mConfig = nil
  vim.ui.select(
      configs,
      {
          prompt = "Select config to run: ",
          format_item = function(config)
              return config.name
          end
      },
      function(config)
          mConfig = config
      end
  )
  -- redraw to make ui selector disappear
  vim.api.nvim_command("redraw")
  if mConfig == nil then
      return
  end
  vim.ui.input(
      {
          prompt = mConfig.name .." - with args: ",
      },
      function(input)
          if input == nil then
              return
          end
          local args = vim.split(input, ' ', true)
          mConfig.args = args
          dap.run(mConfig)
      end
  )
end

