-- Safe call to check if treesitter is installed
local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
  return
end

-- Safe call autotags
local at_ok, at = pcall(require, "nvim-ts-autotag")
if not at_ok then
  return
end

at.setup()
