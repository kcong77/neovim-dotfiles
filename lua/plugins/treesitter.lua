local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
  return
end

treesitter.setup({
  ensure_installed = {
    "vim",
    "lua",
    "c",
    "cpp",
    "bash",
    "javascript",
    "typescript",
    "markdown",
    "css",
    "scss",
    "html",
    "python",
    "yaml",
  },
  sync_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})
