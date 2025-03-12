return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.misc').setup_termbg_sync()
    end
  }
}
