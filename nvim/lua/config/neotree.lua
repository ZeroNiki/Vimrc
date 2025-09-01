require("neo-tree").setup({
  close_if_last_window = true, -- Закрывать, если это последнее окно
  popup_border_style = "rounded",
  enable_git_status = true,    -- Показ git-статуса
  enable_diagnostics = true,   -- Показ диагностик LSP
  default_component_configs = {
    indent = {
      padding = 1,
      indent_size = 2,
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "ﰊ",
      default = "",
    },
    name = {
      trailing_slash = true,
      use_git_status_colors = true,
    },
    git_status = {
      symbols = {
        added     = "+",
        modified  = "~",
        deleted   = "-",
        renamed   = "→",
        untracked = "?",
        ignored   = "!",
        unstaged  = "✗",
        staged    = "✓",
        conflict  = "",
      }
    },
  },
  window = {
    position = "left",
    width = 30,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<CR>"] = "open",
      ["o"] = "open",
      ["<C-s>"] = "open_split",
      ["<C-v>"] = "open_vsplit",
      ["<C-t>"] = "open_tabnew",
      ["<BS>"] = "close_node",
      ["<Esc>"] = "cancel",
      ["a"] = "add",
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["<leader>e"] = "focus_preview",
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = { "node_modules" },
      never_show = { ".DS_Store", "thumbs.db" },
    },
    follow_current_file = true, -- Следить за открытым файлом
    group_empty_dirs = true,
  },
})

vim.keymap.set("n", "<leader>n", ":NeoTreeFocusToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>i", ":NeoTreeFloatToggle<CR>", { silent = true })
