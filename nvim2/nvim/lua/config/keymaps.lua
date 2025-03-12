local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)
keymap("n", "t<leader>", ":NvimTreeToggle<CR>", opts)

keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "q", ":bd<CR>", opts)

keymap("n", "<C-n><C-h>", ":nohl<CR>", opts)

keymap("t", "<C-[>", "<C-\\><C-n>", opts)

keymap("n", "<F5>", ":lua dapRunConfigWithArgs()<CR>", opts)
-- keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<Leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<Leader>q", ":lua require'dap'.disconnect()<CR>", opts)
keymap("n", "<Leader>h", ":lua require'dap.ui.widgets'.hover()<CR>", opts)
    -- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    --   require('dap.ui.widgets').hover()
    -- end)

-- Ctrl ] goto define
-- Ctrl t go back

-- <Leader>zf create fold
-- <leader>zd delete fold
-- <Leader>za toggle fold
