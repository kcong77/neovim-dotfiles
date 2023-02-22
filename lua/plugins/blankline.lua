local bl_ok, blankline = pcall(require, "indent_blankline")
if not bl_ok then
	return
end

blankline.setup({})
