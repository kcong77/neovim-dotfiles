-- Safe call
local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
  return
end

-- Settings
treesitter.setup({
  ensure_installed = {
    "vim",
    "lua",
    "bash",
    "c",
    "cpp",
    "python",
    "javascript",
    "typescript",
    "css",
    "scss",
    "html",
    "yaml",
    "json",
    "markdown",
    "markdown_inline",
    "gitignore",
  },
  sync_install = true,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false,
  },
})
