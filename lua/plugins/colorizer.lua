local colorizer_ok, colorizer = pcall(require, "colorizer")
if not colorizer_ok then
  return
end

colorizer.setup({
  "*",
  css = { css = true, mode = "foreground" },
}, {
  mode = "foreground",
})
