local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
	return
end

treesitter.setup({
 ensure_installed = {"vim", "lua", "python", "markdown", "c", "cpp", "javascript", "typescript", "html", "css", "scss", "json" }, 
  sync_install = true,
  ignore_install = {},
  highlight = {
    enable = true, 
    disable = {}, 
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
})

