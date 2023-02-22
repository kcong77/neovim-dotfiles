local at_ok, at = pcall(require, "nvim-ts-autotag")
if not at_ok then
  return
end

at.setup()
