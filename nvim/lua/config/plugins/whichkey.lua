local wk = require("which-key")

wk.add({
  -- ===== FILE =====
  { "<leader>f", group = "file" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
  { "<leader>fn", "<cmd>enew<cr>", desc = "New File" },
  { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },

  -- ===== BUFFERS =====
  { "<leader>b", group = "buffers" },
  { "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete Buffer" },
  { "<leader>bn", "<cmd>bnext<cr>", desc = "Next Buffer" },
  { "<leader>bp", "<cmd>bprevious<cr>", desc = "Prev Buffer" },
  { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
  { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
  { "<C-q>", "<cmd>bdelete<cr>", desc = "Close Buffer" },

  -- ===== WINDOWS =====
  { "<leader>w", group = "windows" },
  { "<leader>w", proxy = "<c-w>", group = "windows" }, -- показывает все стандартные <C-w> бинды
  { "<C-h>", "<C-w>h", desc = "Move Left" },
  { "<C-j>", "<C-w>j", desc = "Move Down" },
  { "<C-k>", "<C-w>k", desc = "Move Up" },
  { "<C-l>", "<C-w>l", desc = "Move Right" },

  -- ===== TODOS =====
  { "<leader>t", group = "todo" },
  { "]t", "<cmd>TodoTelescope<cr>", desc = "Next TODO" },
  { "[t", "<cmd>TodoTelescope<cr>", desc = "Prev TODO" },
  { "<leader>tt", "<cmd>TodoTelescope<cr>", desc = "Todo Telescope" },

  -- ===== LSP =====
  { "g", group = "LSP" },
  { "gO", vim.lsp.buf.document_symbol, desc = "Document Symbols" },
  { "grn", vim.lsp.buf.rename, desc = "Rename Symbol" },
  { "gra", vim.lsp.buf.code_action, desc = "Code Action" },
  { "grr", vim.lsp.buf.references, desc = "References" },
  { "gri", vim.lsp.buf.implementation, desc = "Implementation" },
  { "grt", vim.lsp.buf.type_definition, desc = "Type Definition" },
  { "gd", vim.lsp.buf.definition, desc = "Goto Definition" },
  { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
  { "gs", vim.lsp.buf.signature_help, desc = "Signature Help" },
  { "gx", "<cmd>!xdg-open <cfile><cr>", desc = "Open file/URL" },

  -- Диагностика
  { "[d", vim.diagnostic.goto_prev, desc = "Prev Diagnostic" },
  { "]d", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
  { "<leader>ld", vim.diagnostic.open_float, desc = "Line Diagnostics" },
  { "<leader>lq", vim.diagnostic.setloclist, desc = "Diagnostics List" },

  -- ===== SEARCH =====
  { "<leader>h", "<cmd>nohlsearch<cr>", desc = "Clear Highlight" },

  -- ===== QUIT / WRITE =====
  { "<leader>q", "<cmd>q<cr>", desc = "Quit", mode = { "n", "v" } },
  { "<leader>w", "<cmd>w<cr>", desc = "Write", mode = { "n", "v" } },

  -- ===== EXTRA =====
  { "K", vim.lsp.buf.hover, desc = "Hover Docs" },
  { "jj", "<Esc>", desc = "Exit Insert", mode = "i" }, -- твой быстрый выход
})
