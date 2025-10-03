-- Базовые опции Neovim
local opt = vim.opt

opt.clipboard = "unnamedplus"

opt.number = true          -- Номера строк
opt.relativenumber = true  -- Относительные номера
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true       -- Пробелы вместо табов
opt.smartindent = true
opt.wrap = false
opt.termguicolors = true   -- Цвета в терминале
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
