local bufferline_ok, bufferline = pcall(require, "bufferline")
if not bufferline_ok then
  return
end

local accent_color = "#8aadf4"

bufferline.setup({
  options = {
    indicator = {
      icon = "",
      style = "none",
    },
    numbers = "none",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        separator = true,
      },
    },
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    separator_style = { "⏽", "⏽" },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  },
  highlights = {
    separator = {
      fg = accent_color,
    },
    buffer_selected = {
      fg = accent_color,
      italic = false,
    },
  },
})
