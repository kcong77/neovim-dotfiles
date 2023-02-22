local nlls_ok, nlls = pcall(require, "null-ls")
if not nlls_ok then
  return
end

local formatting = nlls.builtins.formatting
local diagnostics = nlls.builtins.diagnostics

nlls.setup({
  sources = {
    formatting.stylua.with({
      name = "lua_format",
      filetyles = { "lua" },
      methods = { "formatting" },
      command = "stylua",
    }),
    formatting.clang_format.with({
      name = "clang_format",
      filetypes = { "c", "cpp" },
      methods = { "formatting" },
      command = "clang-format",
    }),
    formatting.shfmt.with({
      name = "bash_format",
      filetypes = { "sh" },
      methods = { "formatting" },
      command = "shfmt",
    }),
    formatting.black.with({
      name = "python_format",
      filetypes = { "python" },
      methods = { "formatting" },
      command = "black",
    }),
    formatting.prettierd.with({
      name = "prettier",
      filetypes = { "markdown", "yaml", "json", "html", "css", "typescipt", "javascript" },
      methods = { "formatting" },
      command = "prettierd",
    }),

    diagnostics.eslint_d.with({
      diagnostic_config = {
        underline = false,
        signs = true,
        virtual_text = false,
        severity_sort = true,
      },
    }),
  },
})
