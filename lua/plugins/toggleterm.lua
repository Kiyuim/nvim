return {
    {
        'akinsho/toggleterm.nvim', 
        event = "VeryLazy",
        version = "*", 
        opts = {
            open_mapping = [[<c-\>]],
            start_in_insert = true,
            direction = 'float',
            size = vim.o.columns * 0.4,
            shell = vim.o.shell,
            --shell = powershell,
            autochdir = true,
            auto_scroll = true,
        }
    }
  }
