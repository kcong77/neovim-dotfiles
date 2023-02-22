local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

require("vim.lsp.protocol")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
  signs = true,
  virtual_text = false,
  severity_sort = true,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = "硫",
  },
})

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn",  text = "" },
  { name = "DiagnosticSignHint",  text = "" },
  { name = "DiagnosticSignInfo",  text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local default_cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local clangd_capabilities = default_cmp_capabilities
clangd_capabilities.offsetEncoding = "utf-8"

local on_attach = function(client)
  client.server_capabilities.document_formatting = false
end

lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = default_cmp_capabilities,
  settings = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = clangd_capabilities,
})

lspconfig.bashls.setup({
  on_attach = on_attach,
  capabilities = default_cmp_capabilities,
})

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = clangd_capabilities,
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = default_cmp_capabilities,
})

lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = default_cmp_capabilities,
})

lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = default_cmp_capabilities,
})

lspconfig.emmet_ls.setup({
  on_attach = on_attach,
  capabilities = clangd_capabilities,
})

lspconfig.marksman.setup({
  on_attach = on_attach,
  capabilities = default_cmp_capabilities,
})
