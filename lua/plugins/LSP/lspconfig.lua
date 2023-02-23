-- Safe call
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local cmplsp_ok, cmplsp = pcall(require, "cmp_nvim_lsp")
if not cmplsp_ok then
  return
end

-- Sign object
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn",  text = "" },
  { name = "DiagnosticSignHint",  text = "" },
  { name = "DiagnosticSignInfo",  text = "" },
}

require("vim.lsp.protocol")

-- Set the appearance of lsp
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
  signs = true,
  virtual_text = false,
  severity_sort = true,
})

-- Icon for errors
vim.diagnostic.config({
  virtual_text = {
    prefix = "硫",
  },
})

-- Set the icon from signs object
for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- For cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Default cmp capabilities
local default_cmp_capabilities = cmplsp.default_capabilities(capabilities)

-- Change clang capabilities
local clangd_capabilities = default_cmp_capabilities
clangd_capabilities.offsetEncoding = "utf-8"

-- Setup each lsp
local on_attach = function(client)
  client.server_capabilities.document_formatting = false
end

-- Config server
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
