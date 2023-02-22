local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

local installer_ok, installer = pcall(require, "mason-tool-installer")
if not installer_ok then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

installer.setup({
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "clangd",
    "clang-format",
    "bash-language-server",
    "shfmt",
    "pyright",
    "black",
    "typescript-language-server",
    "html-lsp",
    "css-lsp",
    "prettierd",
    "marksman",
    "emmet-ls",
  },
  auto_update = true,
  run_on_start = true,
  start_delay = 1000,
})
