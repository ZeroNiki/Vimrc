-- Лид-клавиша = пробел
vim.g.mapleader = " "

local map = vim.keymap.set

-- Быстрый выход из insert
map("i", "jj", "<Esc>")

-- Навигация по окнам
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Удобный поиск
map("n", "<leader>h", ":nohlsearch<CR>")

-- Перемещение между буферами
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { silent = true })

-- Закрытие текущего буфера
vim.keymap.set("n", "<C-q>", ":bdelete<CR>", { silent = true })

-- For work with todo
vim.keymap.set("n", "]t", ":TodoTelescope<CR>", { silent = true }) -- TODO
vim.keymap.set("n", "[t", ":TodoTelescope<CR>", { silent = true }) -- предыдущий TODO
vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { silent = true }) -- все TODO через Telescope
