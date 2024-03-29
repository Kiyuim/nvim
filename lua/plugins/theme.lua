return {
    {
        "folke/tokyonight.nvim",
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "nvim-tree/nvim-web-devicons",
            "utilyre/barbecue.nvim",
            "SmiteshP/nvim-navic",
        },
        config = function()
            vim.cmd[[colorscheme tokyonight-storm]]
            --vim.api.nvim_set_hl(0, 'Normal', {ctermfg=252, ctermbg='none'})
            vim.o.background = "dark"
            vim.g.tokyonight_transparent = true
            vim.g.tokyonight_transparent_sidebar = true
            require('lualine').setup({
                options = {
                    theme = 'tokyonight',
                },
            })
            require('barbecue').setup {
                theme = 'tokyonight',
            }
        end
    },
}