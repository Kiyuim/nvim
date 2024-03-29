return {
    "neovim/nvim-lspconfig",
    cmd = { "Mason", "Neoconf" },
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
        "folke/neoconf.nvim",
        "folke/neodev.nvim",
        {
            "j-hui/fidget.nvim",
            tag = "legacy",
        },
        "nvimdev/lspsaga.nvim",
    },
    config = function()
        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            },
            clangd = {
                cmd = {
                    "C:/Program Files/llvm/bin/clangd.exe",
					--"clangd"
                    "--header-insertion=never",
                    --"--query-driver=clang++",
                    "--query-driver=C:/Program Files/llvm/bin/clang++.exe",
                    --"--all-scopes-completion",
                    --"--completion-style=detailed",    
                    -- compile_commands.json 生成文件夹
                    --"--compile-commands-dir=${workspaceFolder}/build",
                    -- 让 Clangd 生成更详细的日志
                    --"--log=verbose",
                    -- 输出的 JSON 文件更美观
                    --"--pretty",
                    -- 全局补全(输入时弹出的建议将会提供 CMakeLists.txt 里配置的所有文件中可能的符号，会自动补充头文件)
                    --"--all-scopes-completion",
                    -- 建议风格：打包(重载函数只会给出一个建议）
                    -- 相反可以设置为detailed
                    --"--completion-style=bundled",
                    -- 跨文件重命名变量
                    --"--cross-file-rename",
                    -- 输入建议中，已包含头文件的项与还未包含头文件的项会以圆点加以区分
                    --"--header-insertion-decorators",
                    -- 在后台自动分析文件(基于 complie_commands，我们用CMake生成)
                    --"--background-index",
                    -- 启用 Clang-Tidy 以提供「静态检查」
                    --"--clang-tidy",
                    -- Clang-Tidy 静态检查的参数，指出按照哪些规则进行静态检查，详情见「与按照官方文档配置好的 VSCode 相比拥有的优势」
                    -- 参数后部分的*表示通配符
                    -- 在参数前加入-，如-modernize-use-trailing-return-type，将会禁用某一规则
                    --"--clang-tidy-checks=cppcoreguidelines-*,performance-*,bugprone-*,portability-*,modernize-*,google-*",
                    -- 默认格式化风格: 谷歌开源项目代码指南
                    -- "--fallback-style=file",
                    -- 同时开启的任务数量
                    "-j=4",
                    -- pch优化的位置(memory 或 disk，选择memory会增加内存开销，但会提升性能) 推荐在板子上使用disk
                    --"--pch-storage=disk",
                    -- 启用这项时，补全函数时，将会给参数提供占位符，键入后按 Tab 可以切换到下一占位符，乃至函数末
                    -- 我选择禁用
                    --"--function-arg-placeholders=false",
                    -- compelie_commands.json 文件的目录位置(相对于工作区，由于 CMake 生成的该文件默认在 build 文件夹中，故设置为 build)
                    --"--compile-commands-dir=build"
                },
            },
            pyright = {},
            jsonls = {},
            marksman = {},
            volar = {},
            dockerls = {},
            docker_compose_language_service = {},
            bashls = {},
            --ocamllsp = {},
            taplo = {},
            ruff_lsp = {},
        }
        local on_attach = function(_, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            nmap('gd', require "telescope.builtin".lsp_definitions, '[G]oto [D]efinition')
            nmap('K', "<cmd>Lspsaga hover_doc<CR>", 'Hover Documentation')
            nmap('gi', require "telescope.builtin".lsp_implementations, '[G]oto [I]mplementation')
            nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
            nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
            nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
            nmap('<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, '[W]orkspace [L]ist Folders')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            nmap('<leader>rn', "<cmd>Lspsaga rename ++project<cr>", '[R]e[n]ame')
            nmap('<leader>ca', "<cmd>Lspsaga code_action<CR>", '[C]ode [A]ction')
            nmap('<leader>da', require "telescope.builtin".diagnostics, '[D]i[A]gnostics')
            nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            -- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
            nmap("<space>f", function()
                vim.lsp.buf.format { async = true }
            end, "[F]ormat code")
        end
        require("neoconf").setup()
        require("neodev").setup()
        require("fidget").setup()
        require("lspsaga").setup()
        require("mason").setup()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        for server, config in pairs(servers) do
            require("lspconfig")[server].setup(
                vim.tbl_deep_extend("keep",
                    {
                        on_attach = on_attach,
                        capabilities = capabilities
                    },
                    config
                )
            )
        end
    end
}
