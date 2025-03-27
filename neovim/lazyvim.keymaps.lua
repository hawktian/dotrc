local pam = vim.keymap.del
pam("n", "<C-L>")
pam("n", "<S-L>")
pam("n", "<S-H>")

local map = vim.keymap.set

map("n", "<leader>ww", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<leader>q", "<cmd>qa<cr><esc>", { desc = "quit" })
map("n", "gl", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "gh", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<C-L>", "<cmd>!/usr/bin/php -l %<cr>", { desc = "PHP Synctax Check" })
map("n", "<C-F>", "<cmd>!/usr/bin/php -f %<cr>", { desc = "Execute PHP Code" })
map("n", "<F2>", "<cmd>set paste!<CR><cmd>set paste?<CR>", { desc = "set paste" })
--
