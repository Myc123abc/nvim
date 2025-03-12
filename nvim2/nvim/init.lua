vim.api.nvim_create_autocmd("BufRead", {
  pattern = {
    "*.c",
    "*.cpp"
  },
  callback = function()
    vim.cmd("silent!")
    vim.cmd("loadview")
  end,
})

vim.api.nvim_create_autocmd("BufWrite", {
  pattern = {
    "*.c",
    "*.cpp"
  },
  callback = function()
    vim.cmd("mkview")
  end,
})

require("config.lazy")
require("config.options")
require("config.keymaps")

-- Copy to clipboard using wl-copy
vim.api.nvim_set_keymap('v', '<C-c>', ":w !wl-copy<CR>", { noremap = true, silent = true })

