-- Safe call
local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
  return
end

telescope.setup({
  defaults = {
    file_ignore_patterns = { ".git/", "./node_modules/*", "node_modules", "^node_modules/*", "node_modules/*" },
  },
})
