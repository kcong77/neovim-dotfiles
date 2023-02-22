local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
	return
end

local keymap = vim.api.nvim_set_keymap
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
		spacing = 2,
		align = "left",
	},
}

local opts = { noremap = true, silent = true }

local wkopts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}

local mappings = {
	["e"] = { "<CMD>NvimTreeToggle<CR>", "File Explorer" },
  ["w"] = { "<CMD>BufDel<CR>", "Close tab"},
  ["q"] = { "<CMD>qa<CR>", "Quit"}
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

wk.setup(setup)
wk.register(mappings, wkopts)


