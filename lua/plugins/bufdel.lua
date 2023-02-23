-- Safe call
local bufdel_ok, bufdel = pcall(require, "bufdel")
if not bufdel_ok then
  return
end

bufdel.setup({
  next = "tabs",
  quit = true,
})
