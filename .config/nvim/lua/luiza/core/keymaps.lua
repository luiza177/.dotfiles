local map = vim.keymap.set

map("n", "q", "<nop>", { desc = "Disabled (macro record)" })

-------- File Operations
--map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
--map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
--map("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all" })

-------- Search
map("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })

---- keep cursor centered when jumping through search
--map("n", "n", "nzzzv", { desc = "Next result (centered)" })
--map("n", "n", "Nzzzv", { desc = "Prev result (centered)" })

-------- Navigation
---- keep cursor centered when scrolling
--map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
--map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

---- easier line start/end

--------- Window Management
---- Splits
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make window splits equal" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

---- Tabs
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

---- Buffers
map("n", "<leader>bp", "<cmd>bp<CR>", { desc = "Previous buffer" })
map("n", "<leader>bn", "<cmd>bn<CR>", { desc = "Next buffer" })
map("n", "<leader>bx", "<cmd>bd<CR>", { desc = "Close buffer" })

--------- Editor
map("n", "<leader>/", "gcc", { remap = true, desc = "Toggle line comment" })
map("v", "<leader>/", "gc", { remap = true, desc = "Toggle comment" })
map("i", "jj", "<ESC>", { silent = true })

---- Move lines
map("n", "<M-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<M-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
