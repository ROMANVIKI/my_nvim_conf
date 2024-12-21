-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader><Tab><Tab>", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>tabnext<CR>")
vim.keymap.set("n", "Q", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<C-t>", "<cmd>terminal<CR>")
-- Move the current line up
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
-- Move the current line down
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
-- Move selected lines up
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Move selected lines down
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
