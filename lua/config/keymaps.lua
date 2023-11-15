local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- nvim-tree
local firstUseNvimTree = true
local function firstUseNvimTreeFunc()
  if firstUseNvimTree then
    require("nvim-tree").setup {
      view = { width = 20 },
      renderer = { indent_width = 1 },
      diagnostics = { enable = true }
    }
    firstUseNvimTree = false
  end
  vim.cmd "NvimTreeToggle<CR>"
end
keymap("n", "<leader>t", firstUseNvimTreeFunc, opts)
keymap("n", "t<leader>", firstUseNvimTreeFunc, opts)

-- quit current window
keymap("n", "q", ":bd<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- clear highlight for find string
keymap("n", "<C-n><C-h>", ":nohl<CR>", opts)

-- Markdown
keymap("n", "r", "<cmd>MarkdownPreview<CR>")


-- Insert --
-- Press <C-[> to exit insert mode


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- keep paste object
keymap("v", "p", '"-dP', opts)


-- Visual Block --
keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)


-- Terminal --
keymap("t", "<C-[>", "<C-\\><C-n>", opts)


-- goto end of the line and change to insert mode
keymap("n", "9", "$", opts)
keymap("v", "9", "$", opts)

-- Telescope
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)
