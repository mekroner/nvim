
vim.g.mapleader = " "
vim.keymap.set("n","<Space>","<Nop>")
-- vim.keymap.set("n","<leader>pv", vim.cmd.Ex)
vim.keymap.set("n","<leader>pv", ":Oil<CR>")


vim.keymap.set("x","<leader>p", [["_dP]])

-- Copy to Clipboard
vim.keymap.set({"n", "v"},"<leader>y",[["+y]])
vim.keymap.set("n","<leader>Y",[["+Y]])

-- Buffer Navigation
vim.keymap.set("n","<leader>bd", vim.cmd.bdelete)
vim.keymap.set("n","<S-l>",":bnext<CR>")
vim.keymap.set("n","<S-h>",":bprevious<CR>")

-- Window Navigation
vim.keymap.set("n","<C-h>","<C-w>h")
vim.keymap.set("n","<C-j>","<C-w>j")
vim.keymap.set("n","<C-k>","<C-w>k")
vim.keymap.set("n","<C-l>","<C-w>l")
vim.keymap.set("n","<leader>vs",":vsplit <CR>")

-- Move text up and down
vim.keymap.set("v","K",":m '<-2<CR>gv=gv")
vim.keymap.set("v","J",":m '>+1<CR>gv=gv")

-- Navigate up down and Center
vim.keymap.set("n","<C-d>","<C-d>zz")
vim.keymap.set("n","<C-u>","<C-u>zz")

-- Search Pattern
vim.keymap.set("n","n","nzzzv")
vim.keymap.set("n","n","nzzzv")

-- this place rules
vim.keymap.set("i", "<C-c>", "<Esc>")
