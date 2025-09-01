local telescope = require("telescope")

telescope.setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = { width = 0.9, height = 0.8 },
  },
})

-- Горячие клавиши
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Найти файл" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Греп по проекту" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Открытые буферы" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Поиск по help" })
