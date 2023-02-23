-- Safe call
local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
  return
end

-- Setup appearance of popup
local setup = {
  window = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0,
  },
  layout = {
    height = { min = 5, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 5,
    align = "center",
  },
}

-- Keymaps settings for builtin function
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Keymaps settings for which key
local wkopts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

-- Mappings
local mappings = {
  ["e"] = { "<CMD>NvimTreeToggle<CR>", "File Explorer" },
  ["w"] = { "<CMD>BufDel<CR>", "Close Tab" },
  ["q"] = { "<CMD>qa<CR>", "Quit" },
  ["s"] = { "<CMD>lua vim.lsp.buf.format()<CR><CMD>w<CR>", "Save & Format" },
  ["f"] = {
    "<CMD>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Find Files",
  },
  ["g"] = { "<CMD>Telescope live_grep theme=ivy<CR>", "Find In Current Folder" },
  ["h"] = { "<CMD>Telescope current_buffer_fuzzy_find theme=ivy<CR>", "Find In Current File" },
  ["l"] = { "<CMD>lua vim.diagnostic.open_float(nil, {focus=false})<CR>", "Show Diagnostic Float" },
}

-- Set space as <leader> key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<CMD>bnext<CR>", opts)
keymap("n", "<S-h>", "<CMD>bprevious<CR>", opts)

-- Init with settings
wk.setup(setup)
wk.register(mappings, wkopts)
