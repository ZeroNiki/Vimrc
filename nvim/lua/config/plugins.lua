-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Лидеры
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Настройка lazy.nvim
require("lazy").setup({
  spec = {
    -- Тема
    {
      "ellisonleao/gruvbox.nvim",
      priority = 1000,
      config = function()
        vim.o.background = "dark" -- или "light"
        require("gruvbox").setup({})
        vim.cmd("colorscheme gruvbox")
      end,
    },

    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
      "folke/which-key.nvim",
      event = "VeryLazy",
    },

    {
      "akinsho/bufferline.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
        require("bufferline").setup({
          options = {
            mode = "buffers",
            separator_style = "slant", -- варианты: "slant", "slope", "thick", "thin"
            hover = { enabled = true, delay = 200, reveal = {'close'} },
            show_buffer_close_icons = true,
            show_close_icon = false,
            always_show_bufferline = true,
          }
        })
      end
    },


    -- Файловый менеджер
    -- Neo-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
        },
        config = function()
          require("neo-tree").setup({
            close_if_last_window = true,
            window = { width = 30 },
            filesystem = { follow_current_file = true, filtered_items = { hide_dotfiles = false } },
          })
        end
    },

    -- Git signs
    {"lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end},

      -- Hop for fast motion
    {
        "phaazon/hop.nvim", branch = "v2", config = function()
        require("hop").setup()
        vim.api.nvim_set_keymap("n", "<leader><leader>s", ":HopWord<CR>", { silent = true })
      end
    },

    -- Статус-бар
    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- Поиск и навигация
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    -- Подсветка синтаксиса
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- LSP + Mason + Completion
    {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },

    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      },
    },

    {
      "folke/todo-comments.nvim",
      event = "BufReadPost",
      config = function()
        require("todo-comments").setup({
          signs = true, -- показывать в gutter
          keywords = {
            FIX = { icon = " ", color = "error" },
            TODO = { icon = " ", color = "info" },
            HACK = { icon = " ", color = "warning" },
            WARN = { icon = " ", color = "warning" },
            NOTE = { icon = " ", color = "hint" },
          },
          highlight = {
            keyword = "wide",
            after = "",
          },
        })
      end
    },
    {
      "itchyny/vim-cursorword",
      event = {"BufRead", "BufNewFile"},
      config = function()
        vim.cmd([[
          augroup user_plugin_cursorword
            autocmd!
            autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0
            autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif
            autocmd InsertEnter * let b:cursorword = 0
            autocmd InsertLeave * let b:cursorword = 1
          augroup END
        ]])
      end
    },
  },

  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
