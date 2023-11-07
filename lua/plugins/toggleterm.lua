return {
  {
    'akinsho/toggleterm.nvim', 
    version = "*", 
    opts = {
      open_mapping = [[<c-\>]],
      start_in_insert = true,
      direction = 'vertical',
      size = vim.o.columns * 0.4,
      shell = vim.o.shell,
      auto_scroll = true,
    }
  }
}