local map = vim.keymap.set

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<CR>")
map("n", "<C-Down>", "<cmd>resize -2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- Move Lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("i", "<A-j>", " <Esc>:m .+1<CR>==gi")
map("v", "K", ":m '<-2<CR>gv=gv")
map("i", "<A-k>", " <Esc>:m .-2<CR>==gi")

--buffers
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Prev Nuffer" })
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next Nuffer" })
--map("n", "<A-Tab>", "<cmd>bnext<CR>", { desc = "Next Buffer" }) 
map("n", "[b", "<cmd>bprevious<CR>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<CR>", { desc = "Next Buffer" })
map("n", "<leader>bo", "<cmd>enew<CR>", { desc = "Open a New Buffer" })
map("n", "<leader>bl", "<cmd>ls<CR>", { desc = "List All The Buffers" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
--map("n", "<leader>`", "<cmd>e #<CR>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bc", "<cmd>bd<CR>", { desc = "Close Buffer" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>wb", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>wr", "<C-W>v", { desc = "Split window right", remap = true })
--map("n", "<leader>w-", "<C-W>s")
--map("n", "<leader>w|", "<C-W>v")
--map("n", "<leader>-", "<C-W>s")
--map("n", "<leader>|", "<C-W>v")

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Disable arrow keys
--({ "n", "i", "v" }, "<Left>", "<Nop>")
--({ "n", "i", "v" }, "<Right>", "<Nop>")
--({ "n", "i", "v" }, "<Up>", "<Nop>")
--({ "n", "i", "v" }, "<Down>", "<Nop>")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<CR><esc>")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<CR><esc>")

-- copy
map({ "v", "n" }, "<leader>y", "\"+y", { desc = "Copy" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

