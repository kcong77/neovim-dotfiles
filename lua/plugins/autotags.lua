local treesitter_ok = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
  return
end

local at_ok, at = pcall(require, "nvim-ts-autotag")
if not at_ok then
  return
end

at.setup()
