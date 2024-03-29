return{
    "xeluxee/competitest.nvim",
    dependencies = 'MunifTanjim/nui.nvim',
    event = "VeryLazy",
    config = function()
        require('competitest').setup() 
        local map = vim.api.nvim_set_keymap
        local opt = { noremap = true, silent = true }
        map("n", "<leader>re", ":CompetiTest edit_testcase<CR>", opt)
        map("n", "<leader>rr", ":CompetiTest run<CR>", opt)
        map("n", "<leader>ra", ":CompetiTest add_testcase<CR>", opt)
        map("n", "<leader>rd", ":CompetiTest delete_testcase<CR>", opt)
        map("n", "<leader>rt", ":CompetiTest receive testcases<CR>", opt)
        --map("n", "<leader>rm", ":!rm -f %< %<_* <CR>", opt)
        map("n", "<leader>rm", ":!del %<.exe %<_*.txt <CR>", opt)
        compile_command = {
            cpp       = { exec = 'clang++',           args = {'$(FNAME)', '-o', '$(FNOEXT)'}, '-std=c++2a' },
            some_lang = { exec = 'some_compiler', args = {'$(FNAME)'} },
        }
    end,
}
