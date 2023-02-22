local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
  return
end

local luasnip_ok, luasnip = pcall(require, "luasnip")
if not luasnip_ok then
  return
end

local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

local border = {
  { "╭", "CmpBorder" },
  { "─", "CmpBorder" },
  { "╮", "CmpBorder" },
  { "│", "CmpBorder" },
  { "╯", "CmpBorder" },
  { "─", "CmpBorder" },
  { "╰", "CmpBorder" },
  { "│", "CmpBorder" },
}

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  window = {
    documentation = {
      border = border,
    },
    completion = {
      border = border,
    },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
  }),
  sources = cmp.config.sources({
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "luasnip" },
  }),
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[SNIP]",
            buffer = "[BUF]",
            path = "[PATH]",
          })[entry.source.name]
      return vim_item
    end,
  },
})
