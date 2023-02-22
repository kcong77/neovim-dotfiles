local nvimtree_ok, nvimtree = pcall(require, "nvim-tree")
if not nvimtree_ok then
  return
end

nvimtree.setup({
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    special_files = { "Cargo.toml", "Makefile", "README.md", "Dockerfile", "LICENSE" },
    root_folder_modifier = ":~",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 40,
    side = "left",
    number = false,
    relativenumber = false,
    mappings = {
      list = {
        { key = "r", action = "rename" },
        { key = "d", action = "remove" },
      },
    },
  },
})
