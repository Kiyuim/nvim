return {
	{ 
		"ellisonleao/gruvbox.nvim", 
		--"folke/tokyonighr.nvim",
		 dependencies = {
            "nvim-lualine/lualine.nvim",
            "nvim-tree/nvim-web-devicons",
            "utilyre/barbecue.nvim",
            "SmiteshP/nvim-navic",
        },
		priority = 1000 , 
		config = function ()
			vim.cmd([[colorscheme gruvbox]])
			vim.o.background = "dark"
			require('lualine').setup({
                options = {
                    theme = 'gruvbox'
                    --theme = 'tokyonight'
                },
            })
            require('barbecue').setup {
                theme = 'gruvbox',
                --theme = 'tokyonight'
            }
		end
	},
}