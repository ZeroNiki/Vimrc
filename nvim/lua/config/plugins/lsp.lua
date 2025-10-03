-- Подключаем mason
require("mason").setup()

-- Автоматическая интеграция mason + lspconfig
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "ts_ls",
    "clangd",
    "bashls",
  }, -- LSP сервера
})

-- Общие ключи
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- capabilities для nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Подключаем сервера
local servers = {
  "lua_ls",
  "pyright",
  "ts_ls",
  "clangd",
  "bashls",
}

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    on_attach = on_attach,
    capabilities = capabilities,
  })
  vim.lsp.enable(server)
end
