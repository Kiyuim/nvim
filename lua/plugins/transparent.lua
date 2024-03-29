return {
    "xiyaowong/transparent.nvim",
    config = function()
        require('transparent').setup({ -- Optional, you don't have to run setup.
            groups = { -- table: default groups
                'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
                'EndOfBuffer',
            },
            extra_groups = {}, 
            exclude_groups = {}, 
        })
        require('transparent').clear_prefix('BufferLine')
        require('transparent').clear_prefix('NeoTree')
        --require('transparent').clear_prefix('lualine')
    end
}
  