local tokyonight_ok, tokyonight = pcall(require, "tokyonight")
if not tokyonight_ok then
  return
end

tokyonight.setup({
  style = "night",
  transparent = true,
  terminal_colors = true,
  styles = {
    comments = "NONE",
    keywords = "NONE",
    functions = "NONE",
    variables = "NONE",
    sidebars = "transparent",
    floats = "transparent",
  },
  hide_inactive_statusline = true,
  dim_inactive = true,
  lualine_bold = true,
})

vim.cmd([[colorscheme tokyonight]])
