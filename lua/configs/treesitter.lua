local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
	return
end

treesitter.setup({
  indent = {
    enable = true
  },
	ensure_installed = {"vim",  "lua", "markdown", "c", "cpp", "bash", "yaml", "html", "css", "scss", "javascript", "typescript", "json", "make", "python",   },
  sync_install = false,
  auto_install = true,
	highlight = {
		enable = true,
	},
})

